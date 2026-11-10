from pathlib import Path

import pandas as pd
import plotly.express as px
import streamlit as st


DATA_DIR = Path(__file__).resolve().parent.parent / "data" / "processed"


st.set_page_config(
    page_title="Tracker Certificaciones LATAM",
    page_icon="📊",
    layout="wide",
    initial_sidebar_state="expanded",
)


@st.cache_data
def load_data():
    kpis = pd.read_csv(DATA_DIR / "kpis_v2.csv")
    demanda = pd.read_csv(DATA_DIR / "demanda_v2.csv")
    detalle = pd.read_csv(DATA_DIR / "detalle_v2.csv")
    catalogo = pd.read_csv(DATA_DIR / "certificaciones_base.csv")
    return kpis, demanda, detalle, catalogo


kpis, demanda, detalle, catalogo = load_data()


st.sidebar.title("Tracker LATAM")
st.sidebar.caption("Certificaciones tech en el mercado laboral de América Latina")
pagina = st.sidebar.radio(
    "Secciones",
    ["Resumen", "Demanda por certificación", "Vacantes con mención", "Catálogo"],
)
st.sidebar.markdown("---")
st.sidebar.markdown("**Autor:** Orlando Meneses Corona")
st.sidebar.markdown(
    "[LinkedIn](https://www.linkedin.com/in/carlos-orlando-meneses-corona-da/)"
)
st.sidebar.markdown("[GitHub](https://github.com/OrlandoCorona/cert-roi-latam)")


if pagina == "Resumen":
    st.title("Tracker de certificaciones tech en LATAM")
    st.caption(
        "656 vacantes de GetOnBoard analizadas el 28 de octubre de 2026 contra un "
        "catálogo propio de 28 certificaciones."
    )

    row = kpis.iloc[0]
    col1, col2, col3, col4 = st.columns(4)
    col1.metric("Vacantes en la muestra", f"{int(row['total_vacantes']):,}")
    col2.metric("Certificaciones en el catálogo", int(row["total_certificaciones"]))
    col3.metric("Vacantes con al menos una cert", int(row["vacantes_con_cert"]))
    col4.metric("Participación", f"{row['porcentaje_muestra']:.1f}%")

    st.markdown("---")
    st.subheader("Top 10 certificaciones mencionadas en esta muestra")
    top = (
        demanda.sort_values("vacantes_con_cert", ascending=False)
        .head(10)
        .copy()
    )
    fig = px.bar(
        top,
        x="vacantes_con_cert",
        y="nombre_oficial",
        orientation="h",
        color="vacantes_con_cert",
        color_continuous_scale="Blues",
        labels={"vacantes_con_cert": "Vacantes que la mencionan", "nombre_oficial": ""},
    )
    fig.update_layout(yaxis={"categoryorder": "total ascending"}, height=500)
    st.plotly_chart(fig, width="stretch")

    st.info(
        "El 5.8% describe esta muestra, no el mercado tech completo de LATAM. "
        "GetOnBoard tiene mayor presencia en Chile y en vacantes 100% remoto."
    )


elif pagina == "Demanda por certificación":
    st.title("Demanda por certificación")

    proveedor = st.multiselect(
        "Proveedor",
        sorted(demanda["proveedor"].dropna().unique().tolist()),
        default=sorted(demanda["proveedor"].dropna().unique().tolist()),
    )
    categoria = st.multiselect(
        "Categoría",
        sorted(demanda["categoria"].dropna().unique().tolist()),
        default=sorted(demanda["categoria"].dropna().unique().tolist()),
    )
    filtro = demanda[
        demanda["proveedor"].isin(proveedor) & demanda["categoria"].isin(categoria)
    ].sort_values("vacantes_con_cert", ascending=False)

    st.dataframe(
        filtro[
            [
                "codigo",
                "nombre_oficial",
                "proveedor",
                "categoria",
                "nivel",
                "vacantes_con_cert",
                "porcentaje_muestra",
            ]
        ].rename(
            columns={
                "codigo": "Código",
                "nombre_oficial": "Certificación",
                "proveedor": "Proveedor",
                "categoria": "Categoría",
                "nivel": "Nivel",
                "vacantes_con_cert": "Vacantes que la mencionan",
                "porcentaje_muestra": "% de la muestra",
            }
        ),
        width="stretch",
        height=500,
    )


elif pagina == "Vacantes con mención":
    st.title("Vacantes que mencionan alguna certificación")
    st.caption(
        f"{len(detalle):,} relaciones vacante–certificación detectadas por el detector v2."
    )

    cert_elegida = st.selectbox(
        "Filtrar por certificación",
        ["Todas"] + sorted(detalle["codigo"].dropna().unique().tolist()),
    )
    df = detalle if cert_elegida == "Todas" else detalle[detalle["codigo"] == cert_elegida]

    st.dataframe(
        df[
            [
                "titulo",
                "empresa",
                "codigo",
                "estado",
                "menciones",
                "fecha_publicacion",
                "url_vacante",
            ]
        ].rename(
            columns={
                "titulo": "Puesto",
                "empresa": "Empresa",
                "codigo": "Cert",
                "estado": "Estado de la mención",
                "menciones": "N° de menciones",
                "fecha_publicacion": "Fecha",
                "url_vacante": "URL",
            }
        ),
        width="stretch",
        height=600,
    )


else:
    st.title("Catálogo de certificaciones")
    st.caption(
        "28 certificaciones curadas manualmente, con costo del examen en USD, "
        "horas de estudio estimadas y vigencia oficial."
    )

    proveedor = st.multiselect(
        "Proveedor",
        sorted(catalogo["proveedor"].dropna().unique().tolist()),
        default=sorted(catalogo["proveedor"].dropna().unique().tolist()),
    )
    filtro = catalogo[catalogo["proveedor"].isin(proveedor)]

    st.dataframe(
        filtro.rename(
            columns={
                "codigo": "Código",
                "nombre_oficial": "Certificación",
                "proveedor": "Proveedor",
                "categoria": "Categoría",
                "nivel": "Nivel",
                "costo_examen_usd": "Costo examen (USD)",
                "horas_estudio": "Horas de estudio",
                "vigencia_anios": "Vigencia (años)",
                "requisitos_previos": "Requisitos previos",
                "url_oficial": "Sitio oficial",
            }
        ),
        width="stretch",
        height=600,
    )
