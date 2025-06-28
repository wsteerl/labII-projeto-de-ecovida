<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroAcoes.aspx.vb" Inherits="CadastroAcoes" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Cadastro de Ações Sustentáveis - EcoVida</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" rel="stylesheet" />
    <style>
        html, body { height: 100%; margin: 0; padding: 0; }
        body {
            background: linear-gradient(135deg, #e0f7fa 0%, #c8e6c9 100%);
            font-family: 'Poppins', sans-serif;
            display: flex; flex-direction: column; min-height: 100vh;
            padding-bottom: 4.5rem;
            color: #212121;
        }
        header {
            background-color: #81c784;
            color: white;
            text-align: center;
            padding: 2rem;
            font-weight: 700;
            font-size: 2.8rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        footer {
            background-color: #81c784;
            color: white;
            text-align: center;
            padding: 2rem;
            font-weight: 600;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.2);
            position: fixed; bottom: 0; left: 0; width: 100%; z-index: 999;
        }
        .container {
            margin: 2rem auto;
            max-width: 600px;
            width: 100%;
            padding-bottom: 3rem;
        }
        .title {
            color: #212121;
        }
        .box {
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.2);
            padding: 2rem;
            background: white;
        }
        .button.is-success {
            background-color: #4caf50;
            border: none;
            color: white;
        }
        .button.is-success:hover {
            background-color: #388e3c;
        }
        .button.is-light {
            background-color: #ffffff;
            color: #212121;
            border: 1px solid #dbdbdb;
        }
        .button.is-light:hover {
            background-color: #f0f0f0;
        }
        .table-container {
            margin-top: 2rem;
        }
        .table thead th {
            color: #212121;
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
                        <asp:TextBox ID="txtNomeAcao" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Tipo da Ação</label>
                    <div class="control">
                        <asp:TextBox ID="txtTipoAcao" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Descrição</label>
                    <div class="control">
                        <asp:TextBox ID="txtDescricao" runat="server" CssClass="input" TextMode="MultiLine" Rows="3"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Data da Realização</label>
                    <div class="control">
                        <asp:TextBox ID="txtDataRealizacao" runat="server" TextMode="Date" CssClass="input"></asp:TextBox>
                    </div>
                </div>

                <div class="buttons">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="button is-success" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="button is-light" OnClick="btnLimpar_Click" />
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:EcoVidaBDConnectionString %>"
                    SelectCommand="SELECT * FROM AcoesSustentaveis"
                    InsertCommand="INSERT INTO AcoesSustentaveis (NomeAcao, TipoAcao, Descricao, DataRealizacao) VALUES (@NomeAcao, @TipoAcao, @Descricao, @DataRealizacao)"
                    UpdateCommand="UPDATE AcoesSustentaveis SET NomeAcao=@NomeAcao, TipoAcao=@TipoAcao, Descricao=@Descricao, DataRealizacao=@DataRealizacao WHERE ID=@ID"
                    DeleteCommand="DELETE FROM AcoesSustentaveis WHERE ID=@ID">

                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtNomeAcao" Name="NomeAcao" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtTipoAcao" Name="TipoAcao" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDescricao" Name="Descricao" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDataRealizacao" Name="DataRealizacao" PropertyName="Text" Type="DateTime" />
                    </InsertParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="NomeAcao" Type="String" />
                        <asp:Parameter Name="TipoAcao" Type="String" />
                        <asp:Parameter Name="Descricao" Type="String" />
                        <asp:Parameter Name="DataRealizacao" Type="DateTime" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>

                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>

            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" CssClass="table is-fullwidth is-striped is-hoverable"
                    AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"
                    AllowPaging="true" AllowSorting="true">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="NomeAcao" HeaderText="Nome da Ação" SortExpression="NomeAcao" />
                        <asp:BoundField DataField="TipoAcao" HeaderText="Tipo da Ação" SortExpression="TipoAcao" />
                        <asp:BoundField DataField="Descricao" HeaderText="Descrição" SortExpression="Descricao" />
                        <asp:BoundField DataField="DataRealizacao" HeaderText="Data da Realização" SortExpression="DataRealizacao" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <footer>&copy; 2025 EcoVida. Todos os direitos reservados.</footer>
    </form>
</body>
</html>