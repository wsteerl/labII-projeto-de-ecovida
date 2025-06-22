Imports System.Data
Imports System.Data.SqlClient

Partial Class CadastroAcoes
    Inherits System.Web.UI.Page

    Dim connString As String = "Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\EcoVidaDB.mdf;Integrated Security=True"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CarregarGrid()
        End If
    End Sub

    Private Sub CarregarGrid()
        Using conn As New SqlConnection(connString)
            Dim cmd As New SqlCommand("SELECT * FROM AcoesSustentaveis", conn)
            Dim da As New SqlDataAdapter(cmd)
            Dim dt As New DataTable()
            GridView1.DataSource = dt
            GridView1.DataBind()
        End Using
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs)
        Using conn As New SqlConnection(connString)
            conn.Open()
            Dim cmd As New SqlCommand("INSERT INTO AcoesSustentaveis (NomeAcao, TipoAcao, Descricao, DataRealizacao) VALUES (@NomeAcao, @TipoAcao, @Descricao, @Data)", conn)
            cmd.Parameters.AddWithValue("@NomeAcao", txtNomeAcao.Text)
            cmd.Parameters.AddWithValue("@TipoAcao", txtTipoAcao.Text)
            cmd.Parameters.AddWithValue("@Descricao", txtDescricao.Text)
            cmd.Parameters.AddWithValue("@Data", txtData.Text)
            cmd.ExecuteNonQuery()
        End Using
        LimparCampos()
        CarregarGrid()
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs)
        LimparCampos()
    End Sub

    Private Sub LimparCampos()
        txtNomeAcao.Text = ""
        txtTipoAcao.Text = ""
        txtDescricao.Text = ""
        txtData.Text = ""
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        CarregarGrid()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
        CarregarGrid()
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)
        Dim nomeAcao As String = CType(row.Cells(1).Controls(0), TextBox).Text
        Dim tipoAcao As String = CType(row.Cells(2).Controls(0), TextBox).Text
        Dim descricao As String = CType(row.Cells(3).Controls(0), TextBox).Text
        Dim data As String = CType(row.Cells(4).Controls(0), TextBox).Text

        Using conn As New SqlConnection(connString)
            conn.Open()
            Dim cmd As New SqlCommand("UPDATE AcoesSustentaveis SET NomeAcao=@NomeAcao, TipoAcao=@TipoAcao, Descricao=@Descricao, DataRealizacao=@Data WHERE ID=@ID", conn)
            cmd.Parameters.AddWithValue("@NomeAcao", nomeAcao)
            cmd.Parameters.AddWithValue("@TipoAcao", tipoAcao)
            cmd.Parameters.AddWithValue("@Descricao", descricao)
            cmd.Parameters.AddWithValue("@Data", data)
            cmd.Parameters.AddWithValue("@ID", id)
            cmd.ExecuteNonQuery()
        End Using

        GridView1.EditIndex = -1
        CarregarGrid()
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)
        Using conn As New SqlConnection(connString)
            conn.Open()
            Dim cmd As New SqlCommand("DELETE FROM AcoesSustentaveis WHERE ID=@ID", conn)
            cmd.Parameters.AddWithValue("@ID", id)
            cmd.ExecuteNonQuery()
        End Using
        CarregarGrid()
    End Sub
End Class
