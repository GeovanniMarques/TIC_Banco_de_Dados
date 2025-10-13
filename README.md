# TIC - Banco de Dados

Repositório para armazenamento de estudos referente ao curso de Banco de Dados, com MySQL e PostgreSQL, ministrado através do projeto [Residência em TIC 12](https://tic-hub.irede.org.br/).

## 🔧💻 Ferramentas e tecnologias utilizadas:
- SQL;
- MySQL Workbench;
- PG Admin 4 (PostgreSQL);
- brModelo;

### 1. Entidade forte x Entidade fraca:
- `Entidade forte:` não depende de uma entidade e contém uma chave primária.
- `Entidade fraca:` depende de uma entidade para existir e não contém *chaves parciais (não foi explicado o que é)*

**Representação de entidade forte e fraca:**
![Representação de entidades na modelagem conceitual](img/representacao-entidade-forte-fraca.png)

### 2. Graus de Relacionamentos:

> Representa a indicação de quantas entidades estão envolvidas em um relacionamento.

Os graus de relacionamentos se dividem em alguns tipos:

- `Binário`: indica que teremos duas entidades envolvidas em um relacionamento.
![Grau de relacionamento binário](img/relacionamento-binario.png)

- `Ternário`: indica que teremos três entidades envolvidas em um relacionamento.

- `N-nário`: indica que teremos quatro, em diante, entidades envolvidas em um relacionamento.
![Grau de relacionamento n-nário](img/relacionamento-n-nario.png)

### 3. Relacionamentos na prática
![Relacionamento de entidades](img/relacionamento-de-entidades.png)

### 4. Cardinalidade

> Indica quantos objetos (instâncias) de uma entidade, podem se relacionar com outra entidade, através de um relacionamento.

Os tipos de cardinalidade são:

- `(1, 1)`: quando uma entidade pode se comunicar apenas com outra entidade.

- `(1, n)`: quando uma entidade pode se comunicar com