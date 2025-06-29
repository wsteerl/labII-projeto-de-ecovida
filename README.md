# 🌱 Projeto EcoVida: Convivência Sustentável

O **EcoVida** é uma plataforma web voltada para a promoção da sustentabilidade, da educação ambiental e da conscientização ecológica nas comunidades. Seu principal objetivo é incentivar práticas sustentáveis, como reciclagem, consumo consciente, uso de energias renováveis e cultivo de hortas urbanas.

Por meio de ações educativas, oficinas, campanhas e parcerias com escolas e organizações locais, o EcoVida busca transformar hábitos cotidianos e fomentar uma cultura de responsabilidade ambiental, contribuindo para a preservação dos recursos naturais e a melhoria da qualidade de vida.

---

## 🌿 Começando

Estas instruções permitirão que você obtenha uma cópia do projeto em execução na sua máquina local para desenvolvimento e testes.

Consulte a seção **[📦 Implantação](#-implantação)** para saber como implantar o projeto em produção.

---

## 🔗 Pré-requisitos

Antes de começar, você precisará ter instalado na sua máquina:

* [Visual Studio](https://visualstudio.microsoft.com/) (versão 2019 ou superior) com o workload **Desenvolvimento ASP.NET e Web Forms**.
* [SQL Server Express](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads) ou uma instância do SQL Server.
* [SQL Server Management Studio (SSMS)](https://learn.microsoft.com/pt-br/sql/ssms/download-sql-server-management-studio-ssms) para gerenciar seu banco de dados.
* Navegador web atualizado (Chrome, Edge, Firefox, etc.).


## 🔧 Instalação

Siga os passos abaixo para configurar o ambiente de desenvolvimento:

1. **Clone este repositório:**

```bash
git clone https://github.com/wsteerl/labII-projeto-de-ecovida/tree/main
```

2. **Abra o projeto no Visual Studio.**

3. **Configure a string de conexão no arquivo `Web.config`:**

```xml
<connectionStrings>
	<add name="EcoVidaBDConnectionString"
		connectionString="Data Source=(LocalDB)\MSSQLLocalDB;
		AttachDbFilename=C:\Users\user\Documents\EcoVidaBD.mdf;
		Integrated Security=True;
		Connect Timeout=30;
		Encrypt=False"
		providerName="System.Data.SqlClient" />
</connectionStrings>
```

4. **Configure o banco de dados:**

   * No SQL Server Management Studio (SSMS), anexe o arquivo `EcoVidaBD.mdf` ou execute o script `EcoVida_Script.sql` (disponível na pasta `/database`) para criar as tabelas:

Tabelas principais:

* AcoesSustentaveis
* CategoriasConvivencia
* EventosSustentaveis
* ConvitesEvento
* RegistroParticipacao
* Alunos
* FaleConosco

5. **Execute o projeto no Visual Studio:**

   * Pressione `F5` ou clique em **Iniciar Depuração**.

6. **Acesse o sistema via navegador:**

```
http://localhost:[porta]/Login.aspx
```


## ⚙️ Executando os testes

### 🔎 Testes manuais de ponta a ponta

O projeto atualmente utiliza testes manuais, que simulam as ações dos usuários, como:

* Cadastrar ações sustentáveis
* Criar eventos e enviar convites
* Registrar participações
* Gerenciar categorias
* Enviar mensagens via Fale Conosco
* Geração de certificados

### ⌨️ Testes de estilo e boas práticas

O código segue os padrões de desenvolvimento Web Forms, com organização por:

* Arquivos `.aspx` (interface)
* Arquivos `.aspx.vb` (lógica de negócio)
* Uso de classes SQLConnection e comandos parametrizados para evitar SQL Injection.
* Interface estilizada com o framework CSS [Bulma](https://bulma.io/).


## 📦 Implantação

Para implantar o EcoVida em um servidor:

1. Publique o projeto pelo Visual Studio (opção **Publicar Web App**).
2. Configure um servidor IIS ou utilize um serviço de hospedagem ASP.NET.
3. Suba o banco de dados `.mdf` ou o script `.sql` no servidor SQL.
4. Atualize a string de conexão no `Web.config` com os dados do servidor.


## 🛠️ Construído com

* [ASP.NET Web Forms](https://learn.microsoft.com/aspnet/web-forms/) — Framework web utilizado.
* [VB.NET](https://learn.microsoft.com/dotnet/visual-basic/) — Linguagem de programação do backend.
* [SQL Server](https://www.microsoft.com/pt-br/sql-server/) — Banco de dados relacional.
* [Bulma](https://bulma.io/) — Framework CSS responsivo.
* [HTML5 e CSS3](https://developer.mozilla.org/) — Marcação e estilos.


## ✒️ Autores

* **Ester** — *Desenvolvimento do Site, Notion & Documentação* — [@wsteerl](https://github.com/wsteerl)
* **Caio** — *Modelagem Conceitual & Documentação*
* **Isabel** — *Modelagem Lógica & READ.me*
* **Ayla & Ândrya** — *Minimundo & Protótipo no Excalidraw*

Veja também a lista completa de [colaboradores](https://silicon-troodon-95f.notion.site/Projeto-EcoVida-WebSite-1a443957c9c3807e868bc0a83f4a38ab) que participaram deste projeto e cada uma de suas funções.
