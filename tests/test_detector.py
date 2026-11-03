import unittest
from scrapers.detector import detectar


class DetectorTests(unittest.TestCase):
    def test_encabezado_deseable(self):
        r = detectar('<p>Experience required</p><ul><li>SQL</li></ul><p>Certificaciones deseables</p><ul><li>AWS Cloud Practitioner</li><li>AZ-900</li></ul>')
        self.assertEqual([x['estado'] for x in r], ['deseable', 'deseable'])

    def test_professional(self):
        r = detectar('<li>AWS Solutions Architect Professional</li>')
        self.assertEqual(r[0]['precision'], 'otro_nivel')

    def test_plus(self):
        r = detectar('<li>Azure Data Engineer certifications are a plus.</li>')
        self.assertEqual((r[0]['estado'], r[0]['precision']), ('deseable', 'familia_sin_nivel'))

    def test_alternativa(self):
        r = detectar('<li>CEH o experiencia comprobable equivalente</li>')
        self.assertEqual(r[0]['estado'], 'alternativa')

    def test_sigla_no_subcadena(self):
        self.assertEqual(detectar('<li>CCNAS</li>'), [])

    def test_alias_solapados(self):
        r = detectar('<li>AWS Certified Cloud Practitioner required</li>')
        self.assertEqual(len(r), 1)
        self.assertEqual(r[0]['estado'], 'requerida')

    def test_no_hereda_otro_requisito(self):
        r = detectar('<p>Experiencia requerida</p><ul><li>SQL</li></ul><p>Otros conocimientos</p><ul><li>CCNA</li></ul>')
        self.assertEqual(r[0]['estado'], 'sin_especificar')


if __name__ == '__main__':
    unittest.main()
