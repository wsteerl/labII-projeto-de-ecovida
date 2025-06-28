<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroEventos.aspx.vb" Inherits="CadastroEventos" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Cadastro de Eventos - EcoVida</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" rel="stylesheet" />
    <style>
        html, body { height: 110%; margin: 0; padding: 0; }
        body {
            background: linear-gradient(135deg, #a5d6a7 0%, #e0f7fa 100%);
            font-family: 'Poppins', sans-serif;
            display: flex; flex-direction: column; min-height: 100vh;
            padding-bottom: 4.5rem; /* espaço footer */
        }
        header {
            background-color: #66bb6a;
            color: white;
            text-align: center;
            padding: 2rem;
            font-weight: 700;
            font-size: 2.8rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        footer {
            background-color: #66bb6a;
            color: white;
            text-align: center;
            font-weight: 600;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.2);
            position: fixed;
            bottom: 0; 
            left: 0; 
            width: 100%;
            z-index: 999;
            padding: 1rem 0;
        }
        .container {
            margin: 2rem auto;
            max-width: 400px;
            width: 100%;
            min-height: 850px;
            padding-bottom: 3rem;
        }
        .title {
            color: #212121;
        }
        .box {
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.2);
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
                <h1 class="title is-3 has-text-centered">Cadastro de Eventos Sustentáveis</h1>

                <div class="field">
                    <label class="label">Nome do Evento</label>
                    <div class="control">
                        <asp:TextBox ID="txtNomeEvento" runat="server" CssClass="input" placeholder="Digite o nome do evento"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Descrição</label>
                    <div class="control">
                        <asp:TextBox ID="txtDescricao" runat="server" CssClass="input" TextMode="MultiLine" Rows="3" placeholder="Descreva o evento"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Data do Evento</label>
                    <div class="control">
                        <asp:TextBox ID="txtDataEvento" runat="server" TextMode="Date" CssClass="input"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Local</label>
                    <div class="control">
                        <asp:TextBox ID="txtLocal" runat="server" CssClass="input" placeholder="Informe o local do evento"></asp:TextBox>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Responsável</label>
                    <div class="control">
                        <asp:TextBox ID="txtResponsavel" runat="server" CssClass="input" placeholder="Nome do responsável"></asp:TextBox>
                    </div>
                </div>

                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="button is-success" OnClick="btnSalvar_Click" />
                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="button is-light" OnClick="btnLimpar_Click" />

            </div>

            <div class="table-container">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:EcoVidaBDConnectionString %>"
                    SelectCommand="SELECT * FROM EventosSustentaveis ORDER BY ID DESC"
                    InsertCommand="INSERT INTO EventosSustentaveis (NomeEvento, Descricao, DataEvento, LocalEvento, Responsavel) VALUES (@NomeEvento, @Descricao, @DataEvento, @LocalEvento, @Responsavel)"
                    UpdateCommand="UPDATE EventosSustentaveis SET NomeEvento=@NomeEvento, Descricao=@Descricao, DataEvento=@DataEvento, LocalEvento=@LocalEvento, Responsavel=@Responsavel WHERE ID=@ID"
                    DeleteCommand="DELETE FROM EventosSustentaveis WHERE ID=@ID">
                    
                    <InsertParameters>
                        <asp:Parameter Name="NomeEvento" Type="String" />
                        <asp:Parameter Name="Descricao" Type="String" />
                        <asp:Parameter DbType="Date" Name="DataEvento" />
                        <asp:Parameter Name="LocalEvento" Type="String" />
                        <asp:Parameter Name="Responsavel" Type="String" />
                    </InsertParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="NomeEvento" Type="String" />
                        <asp:Parameter Name="Descricao" Type="String" />
                        <asp:Parameter DbType="Date" Name="DataEvento" />
                        <asp:Parameter Name="LocalEvento" Type="String" />
                        <asp:Parameter Name="Responsavel" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>

                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server" CssClass="table is-fullwidth is-striped is-hoverable"
                    AutoGenerateColumns="False" DataKeyNames="ID"
                    DataSourceID="SqlDataSource1"
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDeleting="GridView1_RowDeleting">

                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="NomeEvento" HeaderText="Nome do Evento" SortExpression="NomeEvento" />
                        <asp:BoundField DataField="Descricao" HeaderText="Descrição" SortExpression="Descricao" />
                        <asp:BoundField DataField="DataEvento" HeaderText="Data do Evento" SortExpression="DataEvento" DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="LocalEvento" HeaderText="Local" SortExpression="LocalEvento" />
                        <asp:BoundField DataField="Responsavel" HeaderText="Responsável" SortExpression="Responsavel" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <footer>&copy; 2025 EcoVida. Todos os direitos reservados.</footer>
    </form>
</body>
</html>