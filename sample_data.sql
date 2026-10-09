-- Create table for book sales

CREATE TABLE IF NOT EXISTS sales (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_title TEXT NOT NULL,
    genre TEXT NOT NULL,
    price REAL NOT NULL,
    quantity_sold INTEGER NOT NULL
);

-- Insert sample transaction data

INSERT INTO sales (book_title, genre, price, quantity_sold) VALUES
('The Great Gatsby', 'Fiction', 15.00, 10),
('To Kill a Mockingbird', 'Fiction', 12.00, 5),
('Sapiens', 'Non-Fiction', 20.00, 8),
('Educated', 'Non-Fiction', 18.00, 2),
('Dune', 'Sci-Fi', 25.00, 3),
('Neuromancer', 'Sci-Fi', 10.00, 2);