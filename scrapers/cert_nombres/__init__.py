from scrapers.cert_nombres.cloud import NOMBRES_CLOUD
from scrapers.cert_nombres.datos_bi import NOMBRES_DATOS_BI
from scrapers.cert_nombres.infraestructura import NOMBRES_INFRAESTRUCTURA
from scrapers.cert_nombres.gestion import NOMBRES_GESTION
from scrapers.cert_nombres.ciber import NOMBRES_CIBER
from scrapers.cert_nombres.palabras_contexto import (
    PALABRAS_REQUERIDO,
    PALABRAS_OPCIONAL,
)

NOMBRES_CERT: dict[str, list[str]] = {
    **NOMBRES_CLOUD,
    **NOMBRES_DATOS_BI,
    **NOMBRES_INFRAESTRUCTURA,
    **NOMBRES_GESTION,
    **NOMBRES_CIBER,
}


def total_certs() -> int:
    return len(NOMBRES_CERT)


def total_nombres() -> int:
    return sum(len(nombres) for nombres in NOMBRES_CERT.values())


def get_codigos() -> list[str]:
    return list(NOMBRES_CERT.keys())


def get_nombres_de(cert_codigo: str) -> list[str]:
    return NOMBRES_CERT.get(cert_codigo, [])