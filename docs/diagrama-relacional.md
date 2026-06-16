# Diagrama Relacional – Abreu

## Tabela: EMPRESA  
Armazena os dados cadastrais das empresas vinculadas ao processo.

| Coluna       | Tipo          | Nulo | Observações |
|--------------|---------------|------|-------------|
| ID           | SERIAL        | NÃO  | PK          |
| Nome         | VARCHAR(255)  | NÃO  | —           |
| Telefone     | VARCHAR(20)   | SIM  | —           |
| Endereco     | VARCHAR(255)  | SIM  | —           |
| Email        | VARCHAR(100)  | SIM  | ÚNICO       |
| Proprietario | VARCHAR(255)  | NÃO  | —           |

---

##  Tabela: MUNICIPIO  
Armazena os dados dos municípios que possuem núcleos de REURB.

| Coluna       | Tipo          | Nulo | Observações |
|--------------|---------------|------|-------------|
| ID           | SERIAL        | NÃO  | PK          |
| Nome         | VARCHAR(255)  | NÃO  | —           |
| CEP          | VARCHAR(10)   | SIM  | —           |
| Estado       | CHAR(2)       | NÃO  | CHECK (2)   |
| Prefeito     | VARCHAR(255)  | SIM  | —           |
| Lei_Municipal| VARCHAR(255)  | SIM  | —           |

---

##  Tabela: NUCLEO  
Armazena os dados dos núcleos urbanos em processo de regularização.

| Coluna       | Tipo          | Nulo | Observações |
|--------------|---------------|------|-------------|
| ID           | SERIAL        | NÃO  | PK          |
| Nome         | VARCHAR(255)  | NÃO  | —           |
| CEP          | VARCHAR(10)   | SIM  | —           |
| Topografo    | VARCHAR(255)  | SIM  | —           |
| Lider        | VARCHAR(255)  | SIM  | —           |
| MUNICIPIO_ID | INT           | SIM  | FK → MUNICIPIO(ID) |

---

##  Tabela: COLABORADOR  
Armazena os dados dos colaboradores que atuam nos cadastros.

| Coluna     | Tipo          | Nulo | Observações |
|------------|---------------|------|-------------|
| ID         | SERIAL        | NÃO  | PK          |
| Nome       | VARCHAR(255)  | NÃO  | —           |
| CPF        | VARCHAR(14)   | NÃO  | ÚNICO       |
| Telefone   | VARCHAR(20)   | SIM  | —           |
| Email      | VARCHAR(100)  | SIM  | ÚNICO       |
| Senha      | VARCHAR(255)  | NÃO  | —           |
| EMPRESA_ID | INT           | SIM  | FK → EMPRESA(ID) |
| NUCLEO_ID  | INT           | SIM  | FK → NUCLEO(ID)  |

---

##  Tabela: MORADOR  
Armazena os dados dos moradores cadastrados nos núcleos.

| Coluna          | Tipo          |
|-----------------|---------------|
| ID              | SERIAL        | 
| Nome            | VARCHAR(255)  | 
| CPF             | VARCHAR(14)   | 
| Quadra          | INT           | 
| Lote            | INT           | 
| Lider           | VARCHAR(255)  |
| Nome_do_conjuge | VARCHAR(255)  | 
| NUCLEO_ID       | INT           | 

---

##  Tabela: DOCUMENTO  
Armazena os documentos entregues pelos moradores.

| Coluna                           | Tipo          | Nulo | Observações |
|----------------------------------|---------------|------|-------------|
| ID                               | SERIAL        | NÃO  | PK          |
| Ficha_de_cadastro                | VARCHAR(255)  | SIM  | —           |
| RG_CPF_CNH                       | VARCHAR(20)   | SIM  | —           |
| Renda                            | NUMERIC(10,2) | SIM  | CHECK (>=0) |
| Residencia                       | VARCHAR(255)  | SIM  | —           |
| Contrato                         | VARCHAR(255)  | SIM  | —           |
| Certidao_de_casamento_nascimento | VARCHAR(255)  | SIM  | —           |
| MORADOR_ID                       | INT           | NÃO  | FK → MORADOR(ID) |
