Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class CadastroEventos
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("EcoVidaBD").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CarregarEventos()
        End If
    End Sub

    Private Sub CarregarEventos()
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT * FROM EventosSustentaveis ORDER BY ID DESC", con)
            Dim dt As New DataTable()
            Using da As New SqlDataAdapter(cmd)
                da.Fill(dt)
            End Using
            GridView1.DataSource = dt
            GridView1.DataBind()
        End Using
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs)
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("INSERT INTO EventosSustentaveis (NomeEvento, Descricao, DataEvento, Local) VALUES (@NomeEvento, @Descricao, @DataEvento, @Local)", con)
            cmd.Parameters.AddWithValue("@NomeEvento", txtNomeEvento.Text.Trim())
            cmd.Parameters.AddWithValue("@Descricao", txtDescricao.Text.Trim())
            cmd.Parameters.AddWithValue("@DataEvento", Date.Parse(txtDataEvento.Text.Trim()))
            cmd.Parameters.AddWithValue("@Local", txtLocal.Text.Trim())

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End Using
        LimparCampos()
        CarregarEventos()
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs)
        LimparCampos()
    End Sub

    Private Sub LimparCampos()
        txtNomeEvento.Text = ""
        txtDescricao.Text = ""
        txtDataEvento.Text = ""
        txtLocal.Text = ""
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        CarregarEventos()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As EventArgs)
        GridView1.EditIndex = -1
        CarregarEventos()
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)

        Dim nomeEvento As TextBox = CType(row.FindControl("txtNomeEvento"), TextBox)
        Dim descricao As TextBox = CType(row.FindControl("txtDescricao"), TextBox)
        Dim dataEvento As TextBox = CType(row.FindControl("txtDataEvento"), TextBox)
        Dim local As TextBox = CType(row.FindControl("txtLocal"), TextBox)

        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("UPDATE EventosSustentaveis SET NomeEvento=@NomeEvento, Descricao=@Descricao, DataEvento=@DataEvento, Local=@Local WHERE ID=@ID", con)
            cmd.Parameters.AddWithValue("@NomeEvento", nomeEvento.Text.Trim())
            cmd.Parameters.AddWithValue("@Descricao", descricao.Text.Trim())
            cmd.Parameters.AddWithValue("@DataEvento", Date.Parse(dataEvento.Text.Trim()))
            cmd.Parameters.AddWithValue("@Local", local.Text.Trim())
            cmd.Parameters.AddWithValue("@ID", id)

            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
        End Using

        GridView1.EditIndex = -1
        CarregarEventos()
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

        CarregarEventos()
    End Sub
End Class