import json
import time
import random
from pathlib import Path
from datetime import datetime, timezone
import requests
from tenacity import retry, stop_after_attempt, wait_exponential

API_BASE = "https://www.getonbrd.com/api/v0"
USER_AGENT = (
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
    "AppleWebKit/537.36 (KHTML, like Gecko) "
    "Chrome/130.0.0.0 Safari/537.36"
)
HEADERS = {"User-Agent": USER_AGENT, "Accept": "application/json"}

RUTA_RAW = Path(__file__).parent.parent / "data" / "raw" / "getonboard"
RUTA_RAW.mkdir(parents=True, exist_ok=True)

RUTA_CATALOGOS = RUTA_RAW / "_catalogos"
RUTA_CATALOGOS.mkdir(parents=True, exist_ok=True)


BUSQUEDAS = {
    "data_analyst": ["data-analyst", "analista-de-datos"],
    "business_analyst": ["business-analyst", "analista-de-negocio"],
    "reporting_analyst": ["reporting-analyst"],
    "data_engineer": ["data-engineer", "ingeniero-de-datos"],
    "data_scientist": ["data-scientist", "cientifico-de-datos"],
    "soporte_ti": ["soporte-ti", "it-support"],
    "help_desk": ["help-desk", "mesa-de-ayuda"],
    "devops": ["devops"],
    "cloud_engineer": ["cloud-engineer", "ingeniero-cloud"],
    "seguridad": ["cybersecurity", "ciberseguridad"],
    "project_manager": ["project-manager", "gerente-de-proyecto"],
    "scrum_master": ["scrum-master"],
}


@retry(stop=stop_after_attempt(3), wait=wait_exponential(min=2, max=10))
def http_get(url: str, params: dict | None = None) -> dict:
    response = requests.get(url, params=params, headers=HEADERS, timeout=30)
    response.raise_for_status()
    return response.json()


def cargar_catalogo_global(nombre: str) -> dict[str, dict]:
    print(f"  Cargando catalogo global: {nombre}")
    cache = {}
    pagina = 1
    while True:
        try:
            data = http_get(f"{API_BASE}/{nombre}", {"page": pagina, "per_page": 200})
        except Exception as e:
            print(f"    Error pagina {pagina}: {e}")
            break
        items = data.get("data", [])
        if not items:
            break
        for item in items:
            cache[str(item["id"])] = item.get("attributes", {})
        meta = data.get("meta", {})
        total_paginas = meta.get("total_pages", 1)
        if pagina >= total_paginas:
            break
        pagina += 1
        time.sleep(random.uniform(0.5, 1.0))
    with (RUTA_CATALOGOS / f"{nombre}.json").open("w", encoding="utf-8") as f:
        json.dump(cache, f, ensure_ascii=False, indent=2)
    print(f"    {len(cache)} items")
    return cache


def cargar_catalogos_globales() -> dict[str, dict]:
    print("\n[Catalogos globales]")
    return {
        "modalities": cargar_catalogo_global("modalities"),
        "seniorities": cargar_catalogo_global("seniorities"),
        "categories": cargar_catalogo_global("categories"),
        "tags": cargar_catalogo_global("tags"),
    }


class CacheEmpresas:
    def __init__(self) -> None:
        self.archivo = RUTA_CATALOGOS / "companies.json"
        self.data: dict[str, dict] = {}
        if self.archivo.exists():
            with self.archivo.open("r", encoding="utf-8") as f:
                self.data = json.load(f)
            print(f"  Cache de empresas cargado: {len(self.data)} empresas conocidas")

    def obtener(self, empresa_id: str) -> dict | None:
        if empresa_id in self.data:
            return self.data[empresa_id]
        try:
            resp = http_get(f"{API_BASE}/companies/{empresa_id}")
            attrs = resp.get("data", {}).get("attributes", {})
            self.data[empresa_id] = attrs
            time.sleep(random.uniform(0.3, 0.8))
            return attrs
        except Exception as e:
            print(f"    No se pudo traer empresa {empresa_id}: {e}")
            self.data[empresa_id] = {"name": empresa_id, "country": None, "_error": True}
            return self.data[empresa_id]

    def guardar(self) -> None:
        with self.archivo.open("w", encoding="utf-8") as f:
            json.dump(self.data, f, ensure_ascii=False, indent=2)
        print(f"  Cache de empresas guardado: {len(self.data)} empresas en total")


def buscar_vacantes(termino: str, pagina: int = 1) -> dict:
    return http_get(f"{API_BASE}/search/jobs", {"query": termino, "page": pagina, "per_page": 50})


def scrapear_rol(rol: str, terminos: list[str]) -> list[dict]:
    print(f"\n[{rol}]")
    vacantes_rol = []
    vistos = set()
    for termino in terminos:
        print(f"  Buscando: {termino}")
        pagina = 1
        while True:
            try:
                data = buscar_vacantes(termino, pagina)
            except Exception as e:
                print(f"    Error en pagina {pagina}: {e}")
                break
            jobs = data.get("data", [])
            if not jobs:
                break
            for job in jobs:
                job_id = job.get("id")
                if job_id in vistos:
                    continue
                vistos.add(job_id)
                vacantes_rol.append(job)
            print(f"    pagina {pagina}: {len(jobs)} vacantes")
            meta = data.get("meta", {})
            total_paginas = meta.get("total_pages", 1)
            if pagina >= total_paginas:
                break
            pagina += 1
            time.sleep(random.uniform(1.5, 3.0))
        time.sleep(random.uniform(2.0, 4.0))
    print(f"  Total unicas para {rol}: {len(vacantes_rol)}")
    return vacantes_rol


def enriquecer_vacante(vacante: dict, catalogos: dict, cache_empresas: CacheEmpresas) -> dict:
    attrs = vacante.get("attributes", {})
    nombres = {}

    comp_data = attrs.get("company", {}).get("data")
    if comp_data:
        comp_attrs = cache_empresas.obtener(str(comp_data["id"]))
        if comp_attrs:
            nombres["company_name"] = comp_attrs.get("name")
            nombres["company_country"] = comp_attrs.get("country")

    mod_data = attrs.get("modality", {}).get("data")
    if mod_data:
        mod_attrs = catalogos["modalities"].get(str(mod_data["id"]), {})
        nombres["modality_name"] = mod_attrs.get("name")

    sen_data = attrs.get("seniority", {}).get("data")
    if sen_data:
        sen_attrs = catalogos["seniorities"].get(str(sen_data["id"]), {})
        nombres["seniority_name"] = sen_attrs.get("name")

    tags_ids = attrs.get("tags", {}).get("data", [])
    tags_nombres = []
    for t in tags_ids:
        tag_attrs = catalogos["tags"].get(str(t["id"]), {})
        tag_name = tag_attrs.get("name")
        if tag_name:
            tags_nombres.append(tag_name)
    nombres["tags_names"] = tags_nombres

    attrs["_enriched"] = nombres
    return vacante


def guardar_json(rol: str, vacantes: list[dict]) -> Path:
    fecha = datetime.now(timezone.utc).strftime("%Y-%m-%d")
    archivo = RUTA_RAW / f"{rol}_{fecha}.json"
    payload = {
        "rol": rol,
        "fuente": "GetOnBoard",
        "fecha_scrape": datetime.now(timezone.utc).isoformat(),
        "total_vacantes": len(vacantes),
        "vacantes": vacantes,
    }
    with archivo.open("w", encoding="utf-8") as f:
        json.dump(payload, f, ensure_ascii=False, indent=2)
    return archivo


def main() -> None:
    print("GetOnBoard scraper v2 (con enriquecimiento)")
    print(f"Guardando en: {RUTA_RAW}")

    catalogos = cargar_catalogos_globales()
    cache_empresas = CacheEmpresas()

    resumen = []
    total_vacantes_global = 0

    for rol, terminos in BUSQUEDAS.items():
        vacantes = scrapear_rol(rol, terminos)
        print(f"  Enriqueciendo {len(vacantes)} vacantes...")
        vacantes_enriquecidas = [
            enriquecer_vacante(v, catalogos, cache_empresas) for v in vacantes
        ]
        archivo = guardar_json(rol, vacantes_enriquecidas)
        resumen.append((rol, len(vacantes), archivo.name))
        total_vacantes_global += len(vacantes)
        cache_empresas.guardar()
        time.sleep(random.uniform(3.0, 6.0))

    print("\n" + "=" * 60)
    print("RESUMEN")
    print("=" * 60)
    for rol, cantidad, archivo in resumen:
        print(f"  {rol:20s} {cantidad:5d} vacantes -> {archivo}")
    print(f"\n  TOTAL: {total_vacantes_global} vacantes guardadas")
    print(f"  EMPRESAS cacheadas: {len(cache_empresas.data)}")


if __name__ == "__main__":
    main()