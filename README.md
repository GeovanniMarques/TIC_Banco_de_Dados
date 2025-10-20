# TIC - Banco de Dados

Repositório para armazenamento de estudos referente ao curso de Banco de Dados, com MySQL e PostgreSQL, ministrado através do projeto [Residência em TIC 12](https://tic-hub.irede.org.br/).

## 🔧💻 Ferramentas e tecnologias utilizadas:
- SQL;
- MySQL Workbench;
- PG Admin 4 (PostgreSQL);
- brModelo;

## Capítulo 1: Introdução aps Bancos de Dados

## Capítulo 2: Modelagem de Dados

### Capítulo 2.1: Modelagem de Dados

#### 1. Entidade forte x Entidade fraca:
- `Entidade forte:` não depende de uma entidade e contém uma chave primária.
- `Entidade fraca:` depende de uma entidade para existir e não contém *chaves parciais (não foi explicado o que é)*

**Representação de entidade forte e fraca:**
![Representação de entidades na modelagem conceitual](img/representacao-entidade-forte-fraca.png)

*A forma como `pedido` está representado mostra uma entidade fraca.*

#### 2. Graus de Relacionamentos:

> Representa a indicação de quantas entidades estão envolvidas em um relacionamento.

Os graus de relacionamentos se dividem em alguns tipos:

- `Binário`: indica que teremos duas entidades envolvidas em um relacionamento.
![Grau de relacionamento binário](img/relacionamento-binario.png)

- `Ternário`: indica que teremos três entidades envolvidas em um relacionamento.

- `N-nário`: indica que teremos quatro, em diante, entidades envolvidas em um relacionamento.
![Grau de relacionamento n-nário](img/relacionamento-n-nario.png)

#### 3. Relacionamentos na prática
<!-- ![Relacionamento de entidades](img/relacionamento-de-entidades.png) -->

#### 4. Cardinalidade

> Indica quantos objetos (instâncias) de uma entidade, podem se relacionar com outra entidade, através de um relacionamento.

Os tipos de cardinalidade são:

<!-- - `(0, n)` -->

- `(1, 1)`: quando uma entidade pode se comunicar apenas com um único objeto de outra entidade.

- `(1, n)`: quando uma entidade pode se comunicar com diversos objetos de outra entidade.

- `(n, n)`: quando uma entidade pode se comunicar com diversos objetos de outra entidade e vice versa.


>> ***Um objeto da minha entidade A, pode ter relacionamento, no mínimo, com quantos objetos da minha entidade B? E no máximo?***

#### 5. Entidade associativa

É quando teremos um relacionamento entre as cardinalidades (n, n). Exemplo:
> Em nossas entidades Pedido e Produto há um relacionamento com cardinalidade (n, n)

![DER com relacionamentos](./img/entidades-associativas.png)

#### 6. Atributos

São as características da entidade. Exemplo:

![Atributos da entidade Cliente](./img/exemplo-atributos-cliente.png)

*Podemos ter atributos compostos, multivalorados e determinante, como `endereço`, `telefone` e `cpf`*

#### 7. Especialização e Generalização

Especialização seria a divisão na entidade mais genérica. Como assim? Podemos usar
como exemplo a entidade `Cliente`, que, a partir dela, conseguimos criar outras entidades, ou seja, subdividir,
criar entidades filhas desta mais genérica. Um caso comum é que cliente pode ser pessoa física ou jurídica.

O que diferencia um tipo de cliente do outro, pertimindo que identifiquemos a possibilidade de entidades filhas?
Nesse caso, sabemos que cada tipo de cliente possui uma identificação específica: CPF E CNPJ.

![Exemplo de especialização da entidade Cliente](./img/exemplo-especializacao.png)

Generalização se aplica no caso de impossibilidade de especialização. Usando nosso atributo `telefone` e
o transformando em uma entidade, a fim de exemplificar, sabemos que podemos ter diversos tipos de telefones, 
como residencial e comercial. Apesar de poder ter essa definição, não podemos - e nem seria uma boa pratica -
fazer a especialização porque, mesmo que mude o tipo, todo telefone contém os mesmos atributos: `ddd` e `numero`.

Neste caso, o mais indicado seria o instanciamento de um novo atributo chamado `tipo`:

![Exemplo de instanciamento de atributo](./img/exemplo-generalizacao.png)

### Resumo até este ponto

Vimos até o momento sobre modelagem de dados: entendemos sobre seu conceito, importância e fases.

Iniciamos Mini mundo, que é um projeto de estudo de casos para Banco de Dados, até chegarmos a compreensão
de modelo conceitual, utilizando o Diagrama de Entidade-Relacionamento (DER).

![Diagrama do capítulo 2.1](./img/diagrama-capitulo-2-1.png)

### Capítulo 2.2:  Modelo Entidade-Relacionamento

#### 1. Nornalização

Um conjunto de regras para que possamos construir tabelas bem projetadas e que não tenhamos redundâncias de dados.
Para isso, devemos evitar algumas anomalias, como de inclusão, modificação e exclusão.

#### 2. 1ª Forma Normal (FN)

Para uma tabela estar na 1FN deve ter apenas atributos atômicos, ou seja, não pode conter dados repetidos em sua estrututra.

#### 3. 2ª Forma Normal (FN)

Para acontecer, obrigatoriamente deve atender a 1FN, além de não possuir dependência parcial da primary key (PK), ou seja:
atributo não-chave não pode se referir apenas a uma parte da PK.

#### 4. 3ª Forma Normal (FN)

Deve atender as duas FNs anteriores e não pode ter dependência transitivas, ou seja, atributos não devem depender
de atributos que não sejam PK.

#### 5. Modelo lógico - tabela e campos

O modelo lógico seria a representação detalhada que descreve a estrutura de dados e os seus relacionamentos, servindo
como um passo a passo intermediário entre o modelo conceitual e o físico. Ele transforma os conceitos gerais do modelo 
conceitual em uma estrutura mais técnica, definindo atributos, tipos de dados, chaves primárias e estrangeiras, e 
relações de cardinalidade, tornando o projeto pronto para implementação. 

#### 6. Modelo lógico - multivalorado e composto

Para representar atributos multivalores e compostos no modelo lógico, devemos transforma-los em uma nova tabela.

![Modelo lógico de atributos multivalorados e compostos](./img/modelo-logico-multivalorado-composto.png)

#### 7. Modelo lógico - Entidade fraca

Usando a entidade fraca de nosso exemplo, `Produto`, temos a seguinte representação lógica:

![Modelo lógico de entidade fraca](./img/modelo-logico-entidade-fraca.png)

*No brModelo, para a representação lógica, não há uma diferenciação gráfica entre entidades fortes e fracas.*

#### 8. Modelo lógico - Entidade associativa

No modelo lógico, uma entidade associativa também será transformada de uma tabela que conterá como chave estrangeiras as
chaves primárias das tabelas na qual faz associação.

![Modelo lógico de entidade associativa](./img/modelo-logico-entidade-associativa.png)

#### 9. Modelo lógico - Especialização

No modelo lógico, representamos a especialização da seguinte maneira:

![Modelo lógico de especialização](./img/modelo-logico-especializacao.png)

#### 10. Modelo lógico - Projeto ordem de serviço

Exercício de criação do zero de um modelo lógico referente ao banco de dados de um projeto para armazenagem
de ordem de serviços, baseado nas regras de negócio da empresa.

![Modelo lógico de projeto de ordem de serviço](./img/modelo-logico-ordem-servico.png)

## Capítulo 3: Uso de SGBD

### Capítulo 3.1: DDL

#### 1. Tipos

**Tipos inteiros:**

| Tipo | Bytes | Menor valor | Unsigned | Maior valor | Unsigned |
|-------|-------|-------|-------|-------|-------|
| Tinyint | 1 | -128 | 0 | 127 | 255 |
| Smallint | 2 | -32768 | 0 | 32767 | 65535 |
| Mediumint | 3 | -8388608 | 0 | 83888607 | 16777215 |
| Int | 4 | -21477483648 | 0 | 2147483647 | 4294967295 |
| Bigint | 8 | -2xE63 | 0 | 2xE63-1 | 2xE64 |

**Tipos flutuantes:**

> Exemplo: se declararmos um campo FLOAT(7, 4) se incluimos o numero `999,00009` o valor armazenado será `999,0001`.

| Tipo | Bytes |
|-------|-------|
| Float | 4 |
| Double | 8 |

**Tipos fixos:**

> Especificamos o número de dígitos e o número de casas decimais. Exemplo: se declararmos um campo DECIMAL(5, 2) poderemos armazenar valores somente entre `-999,99` e `999,99`.

| Tipo | Dígitos |
|-------|-------|
| Decimal | 65 |
| Numeric | 65 |

**BIT:**

> Tamanho: Até 64 Bits. Exemplo: `BIT(1)` - Pode ser 1 ou 0; `BIT(2)` - Pode ser 01, 10, 00, 11

| Tipo | Valor |
|-------|-------|
| BIT | 1 ou 0 |

**Tipos de data e hora:**

| Tipo | Valor |
|-------|-------|
| Date | 1000-01-01 até 9999-12-31 |
| Datetime | 1000-01-01 00:00:00 até até 9999-12-31 23:59:59 |
| Timestamp | 1970-01-01 00:00:01 UTC até 2038-01-19 UTC |
| Time | -838:59:59 até 839:59:59 |
| Year | 1901 até 2155 |

**Tipos textuais:**

| Tipo | Suporte | Tamanho (Bytes por Caractere) | Tipo de Comprimento | Observação |
|---|---|---|---|---|
| **CHAR(N)** | Não-Unicode | 1 | Fixo | Ocupa N bytes (preenchido com espaços). Use para dados de tamanho consistente (ex: `CHAR(2)` para UF). |
| **VARCHAR(N)** | Não-Unicode | 1 (+ 1 ou 2 para *overhead*) | Variável | Ocupa apenas o espaço necessário. Mais econômico em espaço para textos curtos de tamanho variável. |
| **NCHAR(N)** | **Unicode** | 2 | Fixo | Duplica o espaço (2 bytes por caractere), mas garante suporte a caracteres internacionais. |
| **NVARCHAR(N)** | **Unicode** | 2 (+ 1 ou 2 para *overhead*) | Variável | **Recomendado para dados internacionais** (múltiplos idiomas, emojis). Ocupa apenas o necessário. |
| **TINYTEXT** | Não-Unicode/Charset | Variável | Variável (Máx. $255$ B) | Para textos curtos (Máx. 255 bytes). |
| **TEXT** | Não-Unicode/Charset | Variável | Variável (Máx. $64$ KB) | Para textos longos. (Máx. 65.535 bytes). |
| **MEDIUMTEXT** | Não-Unicode/Charset | Variável | Variável (Máx. $16$ MB) | Para textos muito longos. (Máx. $16,7$ milhões de bytes). |
| **LONGTEXT** | Não-Unicode/Charset | Variável | Variável (Máx. $4$ GB) | Para textos de tamanho extremo. |
| **ENUM** | Variável | 1 ou 2 | Fixo | Armazena o **índice numérico** de uma *string* pré-definida. Otimiza o uso de espaço. |
| **TINYBLOB** | Binário puro | 1 | Variável (Máx. $255$ B) | Binário. Usado para dados binários curtos (ex: *hashes*). |
| **BLOB** | Binário puro | 1 | Variável (Máx. $64$ KB) | Binário. Para imagens e arquivos de médio porte. |
| **LONGBLOB** | Binário puro | 1 | Variável (Máx. $4$ GB) | Binário. Para arquivos de grande porte (vídeos, documentos). |

***Observação:*** Em sistemas como **SQL Server**, os tipos `TEXT` e `BLOB` são obsoletos e substituídos por `VARCHAR(MAX)` e `VARBINARY(MAX)`. No **MySQL**, a diferença entre `VARCHAR` e `NVARCHAR` é controlada pela Codificação de Caracteres (Charset) da tabela/coluna.

### Capítulo 3.2: DML



## Capítulo 4: 