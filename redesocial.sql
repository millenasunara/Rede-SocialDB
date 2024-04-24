Create database redesocial;
use redesocial;

-- Criação da tabela de usuários
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Idade INT NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Senha VARCHAR(100) NOT NULL
);

-- Criação da tabela de administradores de atividades
CREATE TABLE Administradores (
    AdministradorID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Criação da tabela de categorias de atividades
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL
);

-- Criação da tabela de atividades extracurriculares
CREATE TABLE Atividades (
    AtividadeID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT NOT NULL,
    DataInicio DATE NOT NULL,
    DataFim DATE NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    CategoriaID INT,
    UsuarioID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Criação da tabela de participantes em atividades
CREATE TABLE Participantes (
    ParticipanteID INT PRIMARY KEY AUTO_INCREMENT,
    AtividadeID INT,
    UsuarioID INT,
    FOREIGN KEY (AtividadeID) REFERENCES Atividades(AtividadeID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);

-- Criação da tabela de conexões entre usuários
CREATE TABLE Conexoes (
    ConexaoID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID1 INT,
    UsuarioID2 INT,
    FOREIGN KEY (UsuarioID1) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (UsuarioID2) REFERENCES Usuarios(UsuarioID)
);

-- Criação da tabela de comentários em atividades
CREATE TABLE Comentarios (
    ComentarioID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    AtividadeID INT,
    Comentario TEXT NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (AtividadeID) REFERENCES Atividades(AtividadeID)
);

-- Criação da tabela de permissões para criar atividades
CREATE TABLE Permissoes (
    PermissaoID INT PRIMARY KEY AUTO_INCREMENT,
    UsuarioID INT,
    Permissao BOOLEAN NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID)
);
