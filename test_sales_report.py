import sqlite3
import unittest


class TestSalesReport(unittest.TestCase):

    def setUp(self):
        self.connection = sqlite3.connect(":memory:")
        self.cursor = self.connection.cursor()

        with open("sample_data.sql", "r") as file:
            self.cursor.executescript(file.read())

    def test_report(self):
        with open("sales_report.sql", "r") as file:
            query = file.read()

        self.cursor.execute(query)
        results = self.cursor.fetchall()

        expected = [
            ("Fiction", 2, 210.0, 1),
            ("Non-Fiction", 2, 196.0, 2)
        ]

        self.assertEqual(results, expected)

    def test_sci_fi_is_filtered(self):
        with open("sales_report.sql", "r") as file:
            query = file.read()

        self.cursor.execute(query)
        results = self.cursor.fetchall()

        genres = [row[0] for row in results]

        self.assertNotIn("Sci-Fi", genres)

    def tearDown(self):
        self.connection.close()


if __name__ == "__main__":
    unittest.main()