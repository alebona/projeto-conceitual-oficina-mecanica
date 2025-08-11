# 🛠 Banco de Dados Conceitual - Oficina Mecânica

Este projeto implementa o esquema conceitual e relacional para um sistema de **gestão de ordens de serviço** em uma oficina mecânica.

## 📜 Contexto

O sistema controla:
- Cadastro de clientes e seus veículos
- Registro de ordens de serviço
- Serviços realizados e peças utilizadas, com identificação do mecânico responsável por cada item
- Equipes e mecânicos responsáveis
- Cálculo do valor total da OS (mão de obra + peças)

## 🗂 Estrutura do Banco

### Entidades principais:
- **Cliente** → Cadastra nome, endereço e telefone.
- **Veículo** → Associado a um cliente, com placa, modelo, ano e cor.
- **Equipe** → Grupo de mecânicos.
- **Mecânico** → Possui nome, endereço, especialidade e está vinculado a uma equipe.
- **Ordem de Serviço (OS)** → Contém informações de data, status e valor total.
- **Serviço** → Lista de serviços com valor de mão de obra.
- **Peça** → Lista de peças com valor unitário.

### Relacionamentos:
- Cliente **1:N** Veículo
- Veículo **1:N** OS
- Equipe **1:N** Detalhe OS
- Equipe **1:N** Mecânico
- OS **N:N** Serviço (via `detalhe_ordem_servico`)
- OS **N:N** Peça (via `detalhe_ordem_servico`)

### Detalhe da OS:
Cada item da OS (serviço ou peça) contém o `mecanico_id` responsável pela execução, permitindo controle detalhado sobre quem fez o quê.

## ⚖️ Regras de Negócio
1. Cada veículo só pode pertencer a um cliente.
2. Uma OS pode ter múltiplos serviços e peças.
3. Cada item da OS (serviço ou peça) registra o mecânico responsável.
4. O valor total da OS é a soma dos serviços e peças.

## 🚀 Como usar no DBDesigner
1. Acesse [https://erd.dbdesigner.net/](https://erd.dbdesigner.net/)
2. Crie um novo projeto.
3. Vá em **File > Import SQL** e cole o script `oficina.sql`.

---
Projeto desenvolvido para fins acadêmicos e de portfólio.
