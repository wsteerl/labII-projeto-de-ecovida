Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class CadastroCategorias
    Inherits System.Web.UI.Page

    ' Página inicial
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CarregarDados()
        End If
    End Sub

    ' Botão Salvar
    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Using conexao As New SqlConnection(ConfigurationManager.ConnectionStrings("EcoVidaBD").ConnectionString)
            Dim comando As New SqlCommand("INSERT INTO CategoriasConvivencia (Nome, Descricao) VALUES (@Nome, @Descricao)", conexao)
            comando.Parameters.AddWithValue("@Nome", txtNome.Text.Trim())
            comando.Parameters.AddWithValue("@Descricao", txtDescricao.Text.Trim())
            conexao.Open()
            comando.ExecuteNonQuery()
        End Using

        txtNome.Text = ""
        txtDescricao.Text = ""
        CarregarDados()
    End Sub

    ' Botão Limpar
    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs) Handles btnLimpar.Click
        txtNome.Text = ""
        txtDescricao.Text = ""
    End Sub

    ' Carregar dados no GridView
    Sub CarregarDados()
        Using conexao As New SqlConnection(ConfigurationManager.ConnectionStrings("EcoVidaBD").ConnectionString)
            Dim comando As New SqlCommand("SELECT * FROM CategoriasConvivencia", conexao)
            Dim adapter As New SqlDataAdapter(comando)
            Dim tabela As New DataTable()
            adapter.Fill(tabela)
            GridView1.DataSource = tabela
            GridView1.DataBind()
        End Using
    End Sub

    ' Editar categoria
    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        CarregarDados()
    End Sub

    ' Cancelar edição
    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1
        CarregarDados()
    End Sub

    ' Atualizar categoria
    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Dim nome As String = CType(GridView1.Rows(e.RowIndex).Cells(1).Controls(0), TextBox).Text.Trim()
        Dim descricao As String = CType(GridView1.Rows(e.RowIndex).Cells(2).Controls(0), TextBox).Text.Trim()

        Using conexao As New SqlConnection(ConfigurationManager.ConnectionStrings("EcoVidaBD").ConnectionString)
            Dim comando As New SqlCommand("UPDATE CategoriasConvivencia SET Nome=@Nome, Descricao=@Descricao WHERE ID=@ID", conexao)
            comando.Parameters.AddWithValue("@Nome", nome)
            comando.Parameters.AddWithValue("@Descricao", descricao)
            comando.Parameters.AddWithValue("@ID", id)
            conexao.Open()
            comando.ExecuteNonQuery()
        End Using

        GridView1.EditIndex = -1
        CarregarDados()
    End Sub

    ' Deletar categoria
    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)

        Using conexao As New SqlConnection(ConfigurationManager.ConnectionStrings("EcoVidaBD").ConnectionString)
            Dim comando As New SqlCommand("DELETE FROM CategoriasConvivencia WHERE ID=@ID", conexao)
            comando.Parameters.AddWithValue("@ID", id)
            conexao.Open()
            comando.ExecuteNonQuery()
        End Using

        CarregarDados()
    End Sub
End Class