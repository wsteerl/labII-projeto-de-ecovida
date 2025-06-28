<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Admin.aspx.vb" Inherits="Admin" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Página de Administração - EcoVida</title>
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #ffffff;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .menu a {
            margin-bottom: 15px;
            display: block;
            font-weight: 600;
            font-size: 1.2rem;
            color: #4a4a4a;
            text-decoration: none;
        }
        .menu a:hover {
            color: #66bb6a;
        }
        h1.title {
            color: #66bb6a;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <h1 class="title">Painel de Administração - EcoVida</h1>
        <nav class="menu">
            <a href="Default.aspx">Página Inicial</a>
            <a href="Login.aspx">Cadastro de Login</a>
            <a href="CadastroAcoes.aspx">Cadastro de Ações Sustentáveis</a>
            <a href="CadastroCategorias.aspx">Cadastro de Categorias</a>
            <a href="CadastroEventos.aspx">Cadastro de Eventos</a>
            <a href="CadastroConvites.aspx">Cadastro de Convites</a>
            <a href="RegistroParticipacao.aspx">Registro de Participação</a>
            <a href="FaleConosco.aspx">Mensagens - Fale Conosco</a>

        </nav>
    </div>
    </form>
</body>
</html>