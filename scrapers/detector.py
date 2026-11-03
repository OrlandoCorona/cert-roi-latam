"""Detector conservador con evidencia por bloque HTML."""
import re
import unicodedata
from bs4 import BeautifulSoup
from scrapers.cert_nombres import NOMBRES_CERT


def normalizar(texto):
    return ''.join(c for c in unicodedata.normalize('NFD', texto.casefold())
                   if unicodedata.category(c) != 'Mn')


AMBIGUOS = {
    'AWS_SAA': ['AWS Solutions Architect', 'Arquitecto de Soluciones AWS', 'Arquitecto AWS'],
    'AZ_DP203': ['Azure Data Engineer', 'Ingeniero de Datos Azure'],
}


def estado(texto):
    t = normalizar(texto)
    if re.search(r'experiencia.*equivalente|equivalent experience|disposicion.*obtener|willing.*obtain|associate/professional', t):
        return 'alternativa'
    if re.search(r'deseabl|deseable|are a plus|is a plus|preferred|nice to have|diferenciales|valoramos|valoraremos|optional', t):
        return 'deseable'
    if re.search(r'required|mandatory|obligatori|indispensable|requerid', t):
        return 'requerida'
    return 'sin_especificar'


def detectar(html):
    soup = BeautifulSoup(html or '', 'html.parser')
    bloques = soup.find_all(['p', 'li', 'h1', 'h2', 'h3', 'h4'])
    if not bloques:
        bloques = [soup]
    resultados = []
    encabezado = ''
    for bloque in bloques:
        if bloque.find(['p', 'li']):
            continue
        texto = bloque.get_text(' ', strip=True)
        if bloque.name in ('p', 'h1', 'h2', 'h3', 'h4'):
            encabezado = texto if len(texto) < 160 else ''
        # El encabezado se hereda solo por listas inmediatamente posteriores.
        contexto = texto
        if bloque.name == 'li':
            lista = bloque.find_parent(['ul', 'ol'])
            anterior = lista.find_previous_sibling() if lista else None
            if anterior and anterior.name in ('p', 'h1', 'h2', 'h3', 'h4'):
                h = anterior.get_text(' ', strip=True)
                if len(h) < 160:
                    contexto = h + ': ' + texto
        t = normalizar(texto)
        for codigo, aliases in NOMBRES_CERT.items():
            ocupados = []
            for alias in sorted(aliases, key=len, reverse=True):
                patron = r'(?<!\w)' + re.escape(normalizar(alias)).replace(r'\ ', r'[\s-]+') + r'(?!\w)'
                for m in re.finditer(patron, t):
                    if any(m.start() < b and m.end() > a for a, b in ocupados):
                        continue
                    ocupados.append(m.span())
                    precision = 'exacta'
                    if alias in AMBIGUOS.get(codigo, []):
                        precision = 'familia_sin_nivel'
                        if codigo == 'AWS_SAA' and re.match(r'\s+professional\b', t[m.end():]):
                            precision = 'otro_nivel'
                    resultados.append(dict(codigo=codigo, alias=alias, estado=estado(contexto),
                                             precision=precision, evidencia=contexto))
    return resultados
