<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RegistroParticipacao.aspx.vb" Inherits="RegistroParticipacao" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Registro de Participação - EcoVida</title>
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
            max-width: 800px;
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
        .table-container {
            margin-top: 2rem;
        }
        .label {
            font-weight: 600;
        }
        .mensagem {
            color: red;
            margin-bottom: 1rem;
            text-align: center;
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
                <h1 class="title is-3 has-text-centered">Registro de Participações</h1>

                <asp:Label ID="lblMensagem" runat="server" CssClass="mensagem"></asp:Label>

                <div class="field">
                    <label class="label">Aluno</label>
                    <div class="control">
                        <asp:DropDownList ID="ddlAlunos" runat="server" CssClass="input"></asp:DropDownList>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Ação</label>
                    <div class="control">
                        <asp:DropDownList ID="ddlAcoes" runat="server" CssClass="input"></asp:DropDownList>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Categoria</label>
                    <div class="control">
                        <asp:DropDownList ID="ddlCategorias" runat="server" CssClass="input"></asp:DropDownList>
                    </div>
                </div>

                <div class="field">
                    <label class="label">Pontuação de Impacto</label>
                    <div class="control">
                        <asp:TextBox ID="txtPontuacao" runat="server" CssClass="input" placeholder="Ex: 10"></asp:TextBox>
                    </div>
                </div>

                <div class="buttons">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="button is-success" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="button is-light" OnClick="btnLimpar_Click" />
                </div>
            </div>

            <div class="table-container">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:EcoVidaBDConnectionString %>"
                    ConflictDetection="CompareAllValues"
                    SelectCommand="
                        SELECT RP.ID, 
                               A.NomeCompleto AS NomeAluno, 
                               AC.NomeAcao, 
                               C.NomeCategoria, 
                               RP.PontuacaoImpacto
                        FROM RegistroParticipacao RP
                        INNER JOIN Alunos A ON RP.AlunoID = A.ID
                        INNER JOIN AcoesSustentaveis AC ON RP.AcaoID = AC.ID
                        INNER JOIN CategoriasConvivencia C ON RP.CategoriaID = C.ID
                    "
                    InsertCommand="INSERT INTO RegistroParticipacao (AlunoID, AcaoID, CategoriaID, PontuacaoImpacto) VALUES (@AlunoID, @AcaoID, @CategoriaID, @PontuacaoImpacto)"
                    UpdateCommand="UPDATE RegistroParticipacao SET AlunoID=@AlunoID, AcaoID=@AcaoID, CategoriaID=@CategoriaID, PontuacaoImpacto=@PontuacaoImpacto WHERE ID=@original_ID"
                    DeleteCommand="DELETE FROM RegistroParticipacao WHERE ID=@original_ID"
                    OldValuesParameterFormatString="original_{0}">
                    <InsertParameters>
                        <asp:Parameter Name="AlunoID" Type="Int32" />
                        <asp:Parameter Name="AcaoID" Type="Int32" />
                        <asp:Parameter Name="CategoriaID" Type="Int32" />
                        <asp:Parameter Name="PontuacaoImpacto" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AlunoID" Type="Int32" />
                        <asp:Parameter Name="AcaoID" Type="Int32" />
                        <asp:Parameter Name="CategoriaID" Type="Int32" />
                        <asp:Parameter Name="PontuacaoImpacto" Type="Int32" />
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="GridView1" runat="server"
                    CssClass="table is-fullwidth is-striped is-hoverable"
                    AutoGenerateColumns="False" DataKeyNames="ID"
                    DataSourceID="SqlDataSource1"
                    OnRowEditing="GridView1_RowEditing"
                    OnRowUpdating="GridView1_RowUpdating"
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDeleting="GridView1_RowDeleting">

                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />

                        <asp:BoundField DataField="NomeAluno" HeaderText="Aluno" ReadOnly="True" />
                        <asp:BoundField DataField="NomeAcao" HeaderText="Ação" ReadOnly="True" />
                        <asp:BoundField DataField="NomeCategoria" HeaderText="Categoria" ReadOnly="True" />

                        <asp:BoundField DataField="PontuacaoImpacto" HeaderText="Pontuação" />

                        <asp:TemplateField HeaderText="Aluno" Visible="False">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlAlunoEdit" runat="server" CssClass="input"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Ação" Visible="False">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlAcaoEdit" runat="server" CssClass="input"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Categoria" Visible="False">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCategoriaEdit" runat="server" CssClass="input"></asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Pontuação">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPontuacaoEdit" runat="server" CssClass="input"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <%# Eval("PontuacaoImpacto") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <footer>&copy; 2025 EcoVida. Todos os direitos reservados.</footer>
    </form>
</body>
</html>