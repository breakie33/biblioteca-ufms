# Sistema de Banco de Dados - Biblioteca UFMS

Este projeto contém o modelo completo de banco de dados relacional para gestão de uma biblioteca universitária. Desenvolvido como parte do Projeto Integrador em Tecnologia da Informação II (UFMS).

## Tabelas Principais

- **livros**: Cadastro do acervo bibliográfico (ISBN, título, editora, ano)
- **autores**: Registro dos autores dos livros
- **usuarios**: Cadastro de membros da comunidade acadêmica
- **emprestimos**: Controle de circulação dos materiais

## Tecnologias

  -PostgreSQL 13+ (banco de dados relacional)
  -Git 2.25+ (controle de versão)
  -GitHub (repositório remoto)

## Estrutura do Projeto

```bash
biblioteca-ufms/
├── scripts/
│   ├── schema.sql       # Schema completo do banco
│   ├── inserts.sql      # Dados iniciais
│   ├── queries.sql      # Consultas CRUD
│   └── procedures.sql   # Procedimentos armazenados
├── .gitignore              
└── README.md               # Este arquivo
```

## Como usar
```bash
#Clone este repositório:
git clone https://github.com/breakie33/biblioteca-ufms.git
cd biblioteca-ufms
  
#Execute os scripts em ordem:
psql -U postgres -f scripts/01_schema.sql
psql -U postgres -f scripts/02_inserts.sql

#Para testar as consultas:
psql -U postgres -f scripts/03_queries.sql
   
#(Opcional) Carregar procedures:
psql -U postgres -f scripts/04_procedures.sql
   
```
## Autor

Este projeto foi desenvolvido como atividade prática de modelagem e versionamento de banco de dados.
