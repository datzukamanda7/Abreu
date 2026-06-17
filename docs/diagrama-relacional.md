# Diagrama Relacional – Abreu's

## Tabela: EMPRESA  

| Coluna       | Tipo          |
|--------------|---------------|
| ID           | SERIAL        | 
| Nome         | VARCHAR(255)  | 
| Telefone     | VARCHAR(20)   | 
| Endereco     | VARCHAR(255)  | 
| Email        | VARCHAR(100)  | 
| Proprietario | VARCHAR(255)  | 

---

##  Tabela: MUNICIPIO  

| Coluna       | Tipo          |
|--------------|---------------|
| ID           | SERIAL        |
| Nome         | VARCHAR(255)  |
| CEP          | VARCHAR(10)   |
| Estado       | CHAR(2)       |
| Prefeito     | VARCHAR(255)  |
| Lei_Municipal| VARCHAR(255)  |

---

##  Tabela: NUCLEO  

| Coluna       | Tipo          | 
|--------------|---------------|
| ID           | SERIAL        | 
| Nome         | VARCHAR(255)  | 
| CEP          | VARCHAR(10)   |
| Topografo    | VARCHAR(255)  | 
| Lider        | VARCHAR(255)  | 
| MUNICIPIO_ID | INT           |

---

##  Tabela: COLABORADOR  

| Coluna     | Tipo          |
|------------|---------------|
| ID         | SERIAL        |
| Nome       | VARCHAR(255)  |
| CPF        | VARCHAR(14)   | 
| Telefone   | VARCHAR(20)   |
| Email      | VARCHAR(100)  |
| Senha      | VARCHAR(255)  |
| EMPRESA_ID | INT           | 
| NUCLEO_ID  | INT           | 

---

##  Tabela: MORADOR  

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

| Coluna                           | Tipo          |
|----------------------------------|---------------|
| ID                               | SERIAL        |
| Ficha_de_cadastro                | VARCHAR(255)  |
| RG_CPF_CNH                       | VARCHAR(20)   |
| Renda                            | NUMERIC(10,2) |
| Residencia                       | VARCHAR(255)  |
| Contrato                         | VARCHAR(255)  |
| Certidao_de_casamento_nascimento | VARCHAR(255)  |
| MORADOR_ID                       | INT           |





<img width="688" height="840" alt="DIAGRAMA REURB" src="https://github.com/user-attachments/assets/6dc1b840-c92a-4660-a264-bc64e8c87494" />



