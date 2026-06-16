
# Dicionário de Dados – Abreu

## EMPRESA
+-----------------------------+
|          EMPRESA            |
+-----------------------------+
| PK  ID              SERIAL  |
|     Nome            VARCHAR(255) NOT NULL |
|     Telefone        VARCHAR(20) |
|     Endereco        VARCHAR(255) |
| UK  Email           VARCHAR(100) UNIQUE |
|     Proprietario    VARCHAR(255) NOT NULL |
+-----------------------------+

---

## MUNICIPIO
+-----------------------------+
|         MUNICIPIO           |
+-----------------------------+
| PK  ID              SERIAL  |
|     Nome            VARCHAR(255) NOT NULL |
|     CEP             VARCHAR(10) |
|     Estado          CHAR(2) CHECK |
|     Prefeito        VARCHAR(255) |
|     Lei_Municipal   VARCHAR(255) |
+-----------------------------+

---

## NUCLEO
+-----------------------------+
|           NUCLEO            |
+-----------------------------+
| PK  ID              SERIAL  |
|     Nome            VARCHAR(255) NOT NULL |
|     CEP             VARCHAR(10) |
|     Topografo       VARCHAR(255) |
|     Lider           VARCHAR(255) |
| FK  MUNICIPIO_ID    INT → MUNICIPIO(ID) |
+-----------------------------+

---

## COLABORADOR
+-----------------------------+
|        COLABORADOR          |
+-----------------------------+
| PK  ID              SERIAL  |
|     Nome            VARCHAR(255) NOT NULL |
| UK  CPF             VARCHAR(14) UNIQUE |
|     Telefone        VARCHAR(20) |
| UK  Email           VARCHAR(100) UNIQUE |
|     Senha           VARCHAR(255) NOT NULL |
| FK  EMPRESA_ID      INT → EMPRESA(ID) |
| FK  NUCLEO_ID       INT → NUCLEO(ID) |
+-----------------------------+

---

## MORADOR
+-----------------------------+
|          MORADOR            |
+-----------------------------+
| PK  ID              SERIAL  |
|     Nome            VARCHAR(255) NOT NULL |
| UK  CPF             VARCHAR(14) UNIQUE |
|     Quadra          INT |
|     Lote            INT |
|     Lider           VARCHAR(255) |
|     Nome_do_conjuge VARCHAR(255) |
| FK  NUCLEO_ID       INT → NUCLEO(ID) |
+-----------------------------+

---

## DOCUMENTO
+-------------------------------------------+
|               DOCUMENTO                   |
+-------------------------------------------+
| PK  ID              SERIAL                |
|     Ficha_de_cadastro VARCHAR(255)        |
|     RG_CPF_CNH       VARCHAR(20)          |
|     Renda            NUMERIC(10,2) CHECK  |
|     Residencia       VARCHAR(255)         |
|     Contrato         VARCHAR(255)         |
|     Certidao_de_casamento_nascimento VARCHAR(255) |
| FK  MORADOR_ID       INT → MORADOR(ID)    |
+-------------------------------------------+

🔗 Relacionamentos
Empresa → Colaborador (1:N)

Município → Núcleo (1:N)

Núcleo → Colaborador (1:N)

Núcleo → Morador (1:N)

Morador → Documento (1:N)


<img width="688" height="840" alt="DIAGRAMA REURB" src="https://github.com/user-attachments/assets/4f32037a-0869-4ff7-b30f-984cac883782" />

