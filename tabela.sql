CREATE DATABASE LojaDeTenis;
USE LojaDeTenis;

CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    DataNascimento DATE
); 

CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    NomeProduto VARCHAR(100),
    Preco DECIMAL(10, 2)
);

CREATE TABLE ItensPedido (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

INSERT INTO Clientes (Nome, Email, DataNascimento) VALUES
('João Silva', 'joao@example.com', '1990-01-01'),
('Maria Souza', 'maria@example.com', '1985-05-15');

INSERT INTO Produtos (NomeProduto, Preco) VALUES
('Tênis Nike Air Max', 350.00),
('Tênis Adidas Ultraboost', 400.00);

INSERT INTO Pedidos (ClienteID, DataPedido, Total) VALUES
(1, '2024-08-01', 750.00),
(2, '2024-08-02', 400.00);

INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade, PrecoUnitario) VALUES
(1, 1, 1, 350.00),
(1, 2, 1, 400.00),
(2, 2, 1, 400.00);


SELECT Pedidos.PedidoID, Clientes.Nome, Clientes.Email, Pedidos.DataPedido, Pedidos.Total
FROM Pedidos
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;


SELECT Pedidos.PedidoID, Clientes.Nome, Produtos.NomeProduto, ItensPedido.Quantidade, ItensPedido.PrecoUnitario
FROM ItensPedido
JOIN Pedidos ON ItensPedido.PedidoID = Pedidos.PedidoID
JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID
JOIN Produtos ON ItensPedido.ProdutoID = Produtos.ProdutoID;

