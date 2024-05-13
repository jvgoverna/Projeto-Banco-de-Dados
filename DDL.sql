CREATE TABLE IF NOT EXISTS Departamento(
    nome_departamento varchar(30) PRIMARY KEY,
    chefe_departamento varchar(20)
);

CREATE TABLE IF NOT EXISTS Professor(
    id_professor varchar(12) PRIMARY KEY,

    nome_professor varchar(20),

    salario FLOAT DEFAULT 0,

    nome_departamento varchar(30) REFERENCES Departamento(nome_departamento)
);

CREATE TABLE IF NOT EXISTS Curso(
    id_curso varchar(2) PRIMARY KEY,
    nome_curso varchar(30),
    horas_extras numeric(3),
    nome_departamento varchar(30) REFERENCES Departamento(nome_departamento)
);

CREATE TABLE IF NOT EXISTS Materia(
    id_materia varchar(6) PRIMARY KEY,
    nome_materia varchar(40),
    prova varchar(15),
    id_professor varchar(12) REFERENCES Professor(id_professor),
    nome_departamento varchar(30) REFERENCES Departamento(nome_departamento)
);

CREATE TABLE IF NOT EXISTS Matriz_Curricular(
    semestre varchar(15),
    ano numeric(4),
    dia numeric(2),
    id_materia varchar(6) REFERENCES Materia(id_materia),
    id_curso varchar(2) REFERENCES Curso(id_curso)
);

CREATE TABLE IF NOT EXISTS Tcc (
    id_tcc varchar(14) PRIMARY KEY,
    titulo varchar(40) NOT NULL,
    id_professor varchar(12) REFERENCES Professor(id_professor)
);

CREATE TABLE IF NOT EXISTS Aluno(
    id_aluno varchar(12) PRIMARY KEY,
    nome_aluno varchar(20),
    idade_aluno numeric(3),
    id_curso varchar(2) REFERENCES Curso(id_curso),
    id_tcc varchar(14) REFERENCES Tcc(id_tcc)
);

CREATE TABLE IF NOT EXISTS Horas_Complementares(
    id_horas varchar(3) PRIMARY KEY,
    descricao varchar(80),
    horas_extras numeric(3),
    id_aluno varchar(20) REFERENCES Aluno(id_aluno)
);

CREATE TABLE IF NOT EXISTS Historico_Escolar(
    id_historico varchar(12) PRIMARY KEY,
    nota numeric(2),
    semestre varchar(15),
    id_aluno varchar(20) REFERENCES Aluno(id_aluno),
    id_materia varchar(6) REFERENCES Materia(id_materia)
);