<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroAcoes.aspx.vb" Inherits="CadastroAcoes" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Cadastro de Ações - EcoVida</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" rel="stylesheet" />
    <style>
        html, body {
            height: 100%;
        }

        body {
            background: linear-gradient(135deg, #a5d6a7 0%, #e0f7fa 100%);
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            padding-bottom: 4.5rem; /* espaço para footer fixo */
        }

        header {
            background-color: #66bb6a;
            color: white;
            text-align: center;
            padding: 2rem;
            font-weight: 700;
            font-size: 2.8rem; /* título EcoVida maior */
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        footer {
            background-color: #66bb6a;
            color: white;
            text-align: center;
            padding: 2rem;
            font-weight: 600;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.2);
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            z-index: 999;
        }

        .container {
            margin: 2rem auto;
            max-width: 400px; /* largura reduzida */
            width: 100%;
            min-height: 850px;
            padding-bottom: 3rem; /* evita conteúdo atrás do footer */
        }

        .title {
            color: #212121;
        }

        .box {
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            padding: 2rem;
        }

        .button.is-success {
            background-color: #2e7d32;
            border: none;
        }

        .button.is-success:hover {
            background-color: #1b5e20;
        }

        .table-container {
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>EcoVida</header>

        <div class="container">
            <div class="box">
                <h1 class="title is-3 has-text-centered">Cadastro de Ações Sustentáveis</h1>

                <div class="field">
                    <label class="label">Nome da Ação</label>
                    <div class="control">
                        <asp:TextBox ID="txtNomeAcao" runat="server" CssClass="input" placeholder="Digite o nome da ação"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Tipo da Ação</label>
                    <div class="control">
                        <asp:TextBox ID="txtTipoAcao" runat="server" CssClass="input" placeholder="Digite o tipo da ação"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Descrição</label>
                    <div class="control">
                        <asp:TextBox ID="txtDescricao" runat="server" CssClass="input" placeholder="Descreva a ação"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Data de Realização</label>
                    <div class="control">
                        <asp:TextBox ID="txtData" runat="server" CssClass="input" placeholder="AAAA-MM-DD"></asp:TextBox>
                    </div>
                </div>

                <div class="buttons">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="button is-success" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="button is-light" OnClick="btnLimpar_Click" />
                </div>
            </div>

            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" CssClass="table is-fullwidth is-striped is-hoverable"
                    AutoGenerateColumns="False" DataKeyNames="ID" 
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="NomeAcao" HeaderText="Nome da Ação" />
                        <asp:BoundField DataField="TipoAcao" HeaderText="Tipo" />
                        <asp:BoundField DataField="Descricao" HeaderText="Descrição" />
                        <asp:BoundField DataField="DataRealizacao" HeaderText="Data" DataFormatString="{0:yyyy-MM-dd}" />

                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <footer>&copy; 2025 EcoVida. Todos os direitos reservados.</footer>
    </form>
</body>
</html>