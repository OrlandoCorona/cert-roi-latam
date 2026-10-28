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

RUTA_RAW = Path(__file__).parent.parent / "data" / "raw" / "getonboard"
RUTA_RAW.mkdir(parents=True, exist_ok=True)


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
def buscar_vacantes(termino: str, pagina: int = 1) -> dict:
    url = f"{API_BASE}/search/jobs"
    params = {
        "query": termino,
        "page": pagina,
        "per_page": 50,
    }
    headers = {"User-Agent": USER_AGENT, "Accept": "application/json"}
    response = requests.get(url, params=params, headers=headers, timeout=30)
    response.raise_for_status()
    return response.json()


def obtener_detalle_vacante(job_id: str) -> dict | None:
    url = f"{API_BASE}/jobs/{job_id}"
    headers = {"User-Agent": USER_AGENT, "Accept": "application/json"}
    try:
        response = requests.get(url, headers=headers, timeout=30)
        response.raise_for_status()
        return response.json()
    except Exception as e:
        print(f"    No se pudo traer detalle de {job_id}: {e}")
        return None


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
    print(f"GetOnBoard scraper")
    print(f"Guardando en: {RUTA_RAW}")
    print(f"Total de roles a scrapear: {len(BUSQUEDAS)}")

    resumen = []
    for rol, terminos in BUSQUEDAS.items():
        vacantes = scrapear_rol(rol, terminos)
        archivo = guardar_json(rol, vacantes)
        resumen.append((rol, len(vacantes), archivo.name))
        time.sleep(random.uniform(3.0, 6.0))

    print("\n" + "=" * 60)
    print("RESUMEN")
    print("=" * 60)
    total = 0
    for rol, cantidad, archivo in resumen:
        print(f"  {rol:20s} {cantidad:5d} vacantes -> {archivo}")
        total += cantidad
    print(f"\n  TOTAL: {total} vacantes guardadas")


if __name__ == "__main__":
    main()