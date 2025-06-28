<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadastroConvites.aspx.vb" Inherits="CadastroConvites" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Cadastro de Convites - EcoVida</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" rel="stylesheet" />
    <style>
        html, body { height: 100%; margin: 0; padding: 0; }
        body {
            background: linear-gradient(135deg, #a5d6a7 0%, #e0f7fa 100%);
            font-family: 'Poppins', sans-serif;
            display: flex; flex-direction: column; min-height: 100vh;
            padding-bottom: 4.5rem;
            color: #212121;
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
            padding: 2rem;
            font-weight: 600;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.2);
            position: fixed; bottom: 0; left: 0; width: 100%; z-index: 999;
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
            background: white;
        }
        .button.is-success {
            background-color: #2e7d32;
            border: none;
            color: white;
        }
        .button.is-success:hover {
            background-color: #1b5e20;
        }
        .button.is-light {
            background-color: #f5f5f5;
            color: #212121;
            border: 1px solid #dbdbdb;
        }
        .button.is-light:hover {
            background-color: #e8e8e8;
        }
        .table-container {
            margin-top: 2rem;
        }
        .table thead th {
            color: #212121;
        }
        .message-error {
            margin-bottom: 1rem;
            font-weight: 600;
            color: #cc0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>EcoVida</header>
        <div class="container">
            <div class="box">
                <h1 class="title is-3 has-text-centered">Cadastro de Convites</h1>

                <asp:Label ID="lblMensagem" runat="server" CssClass="message-error" />

                <div class="field">
                    <label class="label">Evento</label>
                    <div class="control">
                        <asp:DropDownList ID="ddlEventos" runat="server" CssClass="input"></asp:DropDownList>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Aluno</label>
                    <div class="control">
                        <asp:DropDownList ID="ddlAlunos" runat="server" CssClass="input"></asp:DropDownList>
                    </div>
                </div>

                <!-- Status fixo ao criar, não no formulário -->

                <div class="buttons">
                    <asp:Button ID="btnSalvar" runat="server" Text="Enviar" CssClass="button is-success" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="button is-light" OnClick="btnLimpar_Click" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EcoVidaBDConnectionString %>" DeleteCommand="DELETE FROM [ConvitesEvento] WHERE [ID] = @original_ID AND [EventoID] = @original_EventoID AND [AlunoID] = @original_AlunoID AND [StatusConvite] = @original_StatusConvite AND (([DataEnvio] = @original_DataEnvio) OR ([DataEnvio] IS NULL AND @original_DataEnvio IS NULL))" InsertCommand="INSERT INTO [ConvitesEvento] ([EventoID], [AlunoID], [StatusConvite], [DataEnvio]) VALUES (@EventoID, @AlunoID, @StatusConvite, @DataEnvio)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ConvitesEvento]" UpdateCommand="UPDATE [ConvitesEvento] SET [EventoID] = @EventoID, [AlunoID] = @AlunoID, [StatusConvite] = @StatusConvite, [DataEnvio] = @DataEnvio WHERE [ID] = @original_ID AND [EventoID] = @original_EventoID AND [AlunoID] = @original_AlunoID AND [StatusConvite] = @original_StatusConvite AND (([DataEnvio] = @original_DataEnvio) OR ([DataEnvio] IS NULL AND @original_DataEnvio IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ID" Type="Int32" />
                            <asp:Parameter Name="original_EventoID" Type="Int32" />
                            <asp:Parameter Name="original_AlunoID" Type="Int32" />
                            <asp:Parameter Name="original_StatusConvite" Type="String" />
                            <asp:Parameter Name="original_DataEnvio" Type="DateTime" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="EventoID" Type="Int32" />
                            <asp:Parameter Name="AlunoID" Type="Int32" />
                            <asp:Parameter Name="StatusConvite" Type="String" />
                            <asp:Parameter Name="DataEnvio" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EventoID" Type="Int32" />
                            <asp:Parameter Name="AlunoID" Type="Int32" />
                            <asp:Parameter Name="StatusConvite" Type="String" />
                            <asp:Parameter Name="DataEnvio" Type="DateTime" />
                            <asp:Parameter Name="original_ID" Type="Int32" />
                            <asp:Parameter Name="original_EventoID" Type="Int32" />
                            <asp:Parameter Name="original_AlunoID" Type="Int32" />
                            <asp:Parameter Name="original_StatusConvite" Type="String" />
                            <asp:Parameter Name="original_DataEnvio" Type="DateTime" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" CssClass="table is-fullwidth is-striped is-hoverable"
    AutoGenerateColumns="False" DataKeyNames="ID"
    DataSourceID="SqlDataSource1"
    OnRowEditing="GridView1_RowEditing"
    OnRowUpdating="GridView1_RowUpdating"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    OnRowDeleting="GridView1_RowDeleting">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="StatusConvite" HeaderText="Status do Convite" SortExpression="StatusConvite" />
        <asp:BoundField DataField="DataEnvio" HeaderText="Data de Envio" SortExpression="DataEnvio" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
    </Columns>
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EcoVidaBDConnectionString %>"
    SelectCommand="SELECT * FROM ConvitesEvento"
    InsertCommand="INSERT INTO ConvitesEvento (EventoID, AlunoID, StatusConvite, DataEnvio) VALUES (@EventoID, @AlunoID, @StatusConvite, @DataEnvio)"
    UpdateCommand="UPDATE ConvitesEvento SET EventoID=@EventoID, AlunoID=@AlunoID, StatusConvite=@StatusConvite, DataEnvio=@DataEnvio WHERE ID=@ID"
    DeleteCommand="DELETE FROM ConvitesEvento WHERE ID=@ID">
    <InsertParameters>
        <asp:Parameter Name="EventoID" Type="Int32" />
        <asp:Parameter Name="AlunoID" Type="Int32" />
        <asp:Parameter Name="StatusConvite" Type="String" />
        <asp:Parameter Name="DataEnvio" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="EventoID" Type="Int32" />
        <asp:Parameter Name="AlunoID" Type="Int32" />
        <asp:Parameter Name="StatusConvite" Type="String" />
        <asp:Parameter Name="DataEnvio" Type="DateTime" />
        <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    <DeleteParameters>
        <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>

            </div>
        </div>
        <footer>&copy; 2025 EcoVida. Todos os direitos reservados.</footer>
    </form>
</body>
</html>