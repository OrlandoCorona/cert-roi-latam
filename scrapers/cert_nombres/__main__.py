from scrapers.cert_nombres import (
    NOMBRES_CERT,
    PALABRAS_REQUERIDO,
    PALABRAS_OPCIONAL,
    total_certs,
    total_nombres,
    get_nombres_de,
)


def main() -> None:
    print(f"Total certificaciones: {total_certs()}")
    print(f"Total nombres:         {total_nombres()}")
    print(f"Palabras 'requerido':  {len(PALABRAS_REQUERIDO)}")
    print(f"Palabras 'opcional':   {len(PALABRAS_OPCIONAL)}")
    print()
    print("Ejemplo (AWS_SAA):")
    for nombre in get_nombres_de("AWS_SAA"):
        print(f"  - {nombre}")


if __name__ == "__main__":
    main()