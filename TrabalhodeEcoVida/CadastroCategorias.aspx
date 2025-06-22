<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroCategorias.aspx.vb" Inherits="CadastroCategorias" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8">
    <title>Cadastro de Categorias - EcoVida</title>
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f8;
            color: #333;
            font-family: 'Poppins', sans-serif;
        }

        .container-box {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            margin-top: 50px;
        }

        label {
            color: #333;
        }

        .title {
            color: #00a86b;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .footer {
            margin-top: 30px;
            text-align: center;
            color: #666;
            font-size: 0.9rem;
        }

        .button.is-info {
            background-color: #00a86b;
            border-color: transparent;
        }

        .button.is-info:hover {
            background-color: #008f5a;
        }

        .gridview {
            width: 100%;
            background-color: #ffffff;
            color: #333;
            border-collapse: collapse;
        }

        .gridview th {
            background-color: #00a86b;
            color: #fff;
            padding: 8px;
        }

        .gridview td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="container-box">
                <h1 class="title">Cadastro de Categorias</h1>

                <div class="field">
                    <label class="label">Nome</label>
                    <div class="control">
                        <asp:TextBox ID="txtNome" runat="server" CssClass="input" />
                    </div>
                </div>

                <div class="field">
                    <label class="label">Descrição</label>
                    <div class="control">
                        <asp:TextBox ID="txtDescricao" runat="server" CssClass="input" />
                    </div>
                </div>

                <div class="field is-grouped">
                    <div class="control">
                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="button is-info" />
                    </div>
                    <div class="control">
                        <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="button is-light" />
                    </div>
                </div>

                <hr />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ID" CssClass="gridview">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="Nome" HeaderText="Nome" />
                        <asp:BoundField DataField="Descricao" HeaderText="Descrição" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>

                <div class="footer">
                    <p>&copy; EcoVida - Todos os direitos reservados.</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>