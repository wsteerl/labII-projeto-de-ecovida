Imports System.Configuration
Imports System.Data.SqlClient

Partial Class CadastroEventos
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("EcoVidaBDConnectionString").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' GridView está ligado ao SqlDataSource, não precisa carregar manualmente aqui
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs)
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("INSERT INTO EventosSustentaveis (NomeEvento, Descricao, DataEvento, LocalEvento, Responsavel) VALUES (@NomeEvento, @Descricao, @DataEvento, @LocalEvento, @Responsavel)", con)
            cmd.Parameters.AddWithValue("@NomeEvento", txtNomeEvento.Text.Trim())
            cmd.Parameters.AddWithValue("@Descricao", txtDescricao.Text.Trim())
            cmd.Parameters.AddWithValue("@DataEvento", Date.Parse(txtDataEvento.Text.Trim()))
            cmd.Parameters.AddWithValue("@LocalEvento", txtLocal.Text.Trim())
            cmd.Parameters.AddWithValue("@Responsavel", txtResponsavel.Text.Trim())

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End Using

        LimparCampos()
        GridView1.DataBind()

        ' Redireciona após salvar
        Response.Redirect("CadastroConvites.aspx")
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs)
        LimparCampos()
    End Sub

    Private Sub LimparCampos()
        txtNomeEvento.Text = ""
        txtDescricao.Text = ""
        txtDataEvento.Text = ""
        txtLocal.Text = ""
        txtResponsavel.Text = ""
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As EventArgs)
        GridView1.EditIndex = -1
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)

        Dim nomeEvento As TextBox = CType(row.Cells(1).Controls(0), TextBox)
        Dim descricao As TextBox = CType(row.Cells(2).Controls(0), TextBox)
        Dim dataEvento As TextBox = CType(row.Cells(3).Controls(0), TextBox)
        Dim localEvento As TextBox = CType(row.Cells(4).Controls(0), TextBox)
        Dim responsavel As TextBox = CType(row.Cells(5).Controls(0), TextBox)

        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("UPDATE EventosSustentaveis SET NomeEvento=@NomeEvento, Descricao=@Descricao, DataEvento=@DataEvento, LocalEvento=@LocalEvento, Responsavel=@Responsavel WHERE ID=@ID", con)
            cmd.Parameters.AddWithValue("@NomeEvento", nomeEvento.Text.Trim())
            cmd.Parameters.AddWithValue("@Descricao", descricao.Text.Trim())
            cmd.Parameters.AddWithValue("@DataEvento", Date.Parse(dataEvento.Text.Trim()))
            cmd.Parameters.AddWithValue("@LocalEvento", localEvento.Text.Trim())
            cmd.Parameters.AddWithValue("@Responsavel", responsavel.Text.Trim())
            cmd.Parameters.AddWithValue("@ID", id)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End Using

        GridView1.EditIndex = -1
        GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)

        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("DELETE FROM EventosSustentaveis WHERE ID=@ID", con)
            cmd.Parameters.AddWithValue("@ID", id)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End Using

        GridView1.DataBind()
    End Sub

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting
        ' Se houver lógica de filtro, você pode usar esse evento futuramente
    End Sub
End Class