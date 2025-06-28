<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FaleConosco.aspx.vb" Inherits="FaleConosco" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Fale Conosco - EcoVida</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" rel="stylesheet" />
    <style>
        html, body { height: 100%; margin: 0; padding: 0; }
        body {
            background: linear-gradient(135deg, #a5d6a7 0%, #e0f7fa 100%);
            font-family: 'Poppins', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            padding-bottom: 4.5rem;
            color: #212121;
        }
        header {
            background-color: #66bb6a;
            color: white;
            text-align: center;
            padding: 2rem 1rem 1rem 1rem;
            font-weight: 700;
            font-size: 2.5rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        nav.menu-links {
            background-color: #66bb6a;
            text-align: center;
            padding-bottom: 1rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        nav.menu-links a {
            color: white;
            margin: 0 1rem;
            font-weight: 600;
            font-size: 1.1rem;
            text-decoration: none;
        }
        nav.menu-links a:hover {
            text-decoration: underline;
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
            max-width: 600px;
            width: 100%;
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
        .has-text-red {
            color: #cc0000;
            font-weight: 600;
            margin-bottom: 1rem;
            display: block;
            text-align: center;
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

        <nav class="menu-links">
            <a href="RegistroParticipacao.aspx">Participações</a>
            <a href="FaleConosco.aspx">Fale Conosco</a>
        </nav>

        <div class="container">
            <div class="box">
                <h1 class="title is-3 has-text-centered">Fale Conosco</h1>

                <asp:Label ID="lblMensagem" runat="server" CssClass="has-text-red"></asp:Label>

                <div class="field">
                    <label class="label" for="txtMensagem">Mensagem</label>
                    <div class="control">
                        <asp:TextBox ID="txtMensagem" runat="server" CssClass="textarea" TextMode="MultiLine" Rows="5" placeholder="Digite sua mensagem..."></asp:TextBox>
                    </div>
                </div>

                <div class="buttons">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar Mensagem" CssClass="button is-success" OnClick="btnEnviar_Click" />
                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="button is-light" OnClick="btnLimpar_Click" />

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:EcoVidaBDConnectionString %>"
                    SelectCommand="SELECT * FROM [FaleConosco]"
                    DeleteCommand="DELETE FROM [FaleConosco] WHERE [ID] = @original_ID"
                    InsertCommand="INSERT INTO [FaleConosco] ([UsuarioID], [Mensagem], [DataMensagem], [Respondido]) VALUES (@UsuarioID, @Mensagem, @DataMensagem, @Respondido)"
                    UpdateCommand="UPDATE [FaleConosco] SET [UsuarioID] = @UsuarioID, [Mensagem] = @Mensagem, [DataMensagem] = @DataMensagem, [Respondido] = @Respondido WHERE [ID] = @original_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="UsuarioID" Type="Int32" />
                        <asp:Parameter Name="Mensagem" Type="String" />
                        <asp:Parameter Name="DataMensagem" Type="DateTime" />
                        <asp:Parameter Name="Respondido" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="UsuarioID" Type="Int32" />
                        <asp:Parameter Name="Mensagem" Type="String" />
                        <asp:Parameter Name="DataMensagem" Type="DateTime" />
                        <asp:Parameter Name="Respondido" Type="Boolean" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
            </div>

            <div class="table-container">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" CssClass="table is-fullwidth is-striped is-hoverable"
                    OnRowDeleting="GridView1_RowDeleting" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="ID" />
                        <asp:BoundField DataField="UsuarioID" HeaderText="UsuarioID" SortExpression="UsuarioID" />
                        <asp:BoundField DataField="Mensagem" HeaderText="Mensagem" SortExpression="Mensagem" />
                        <asp:BoundField DataField="DataMensagem" HeaderText="DataMensagem" SortExpression="DataMensagem" DataFormatString="{0:dd/MM/yyyy HH:mm}" />
                        <asp:CheckBoxField DataField="Respondido" HeaderText="Respondido" SortExpression="Respondido" />
                        
                        <asp:TemplateField HeaderText="Ações">
                            <ItemTemplate>
                                <div style="text-align:right; white-space: nowrap;">
                                    <asp:LinkButton ID="SelectButton" runat="server" CommandName="Select" Text="Selecionar" />
                                    <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Editar" />
                                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Excluir" OnClientClick="return confirm('Confirma exclusão?');" />
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="text-align:right; white-space: nowrap;">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Atualizar" />
                                    <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                                </div>
                            </EditItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

            </div>
        </div>

        <footer>&copy; 2025 EcoVida. Todos os direitos reservados.</footer>
    </form>
</body>
</html>