Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class CadastroConvites
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("EcoVidaBDConnectionString").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CarregarEventos()
            CarregarAlunos()
            lblMensagem.Text = ""
        End If
    End Sub

    Private Sub CarregarEventos()
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT ID, NomeEvento FROM EventosSustentaveis ORDER BY NomeEvento", con)
            Dim dt As New DataTable()
            Using da As New SqlDataAdapter(cmd)
                da.Fill(dt)
            End Using
            ddlEventos.DataSource = dt
            ddlEventos.DataTextField = "NomeEvento"
            ddlEventos.DataValueField = "ID"
            ddlEventos.DataBind()
        End Using
        ddlEventos.Items.Insert(0, New ListItem("-- Selecione um Evento --", "0"))
    End Sub

    Private Sub CarregarAlunos()
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT ID, NomeCompleto FROM Alunos ORDER BY NomeCompleto", con)
            Dim dt As New DataTable()
            Using da As New SqlDataAdapter(cmd)
                da.Fill(dt)
            End Using
            ddlAlunos.DataSource = dt
            ddlAlunos.DataTextField = "NomeCompleto"
            ddlAlunos.DataValueField = "ID"
            ddlAlunos.DataBind()
        End Using
        ddlAlunos.Items.Insert(0, New ListItem("-- Selecione um Aluno --", "0"))
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs)
        lblMensagem.CssClass = "message-error"
        lblMensagem.Text = ""

        If ddlEventos.SelectedValue = "0" Then
            lblMensagem.Text = "Selecione um evento."
            Return
        End If

        If ddlAlunos.SelectedValue = "0" Then
            lblMensagem.Text = "Selecione um aluno."
            Return
        End If

        Try
            Using con As New SqlConnection(connectionString)
                Dim cmd As New SqlCommand("INSERT INTO ConvitesEvento (EventoID, AlunoID, StatusConvite, DataEnvio) VALUES (@EventoID, @AlunoID, @StatusConvite, @DataEnvio)", con)
                cmd.Parameters.AddWithValue("@EventoID", Convert.ToInt32(ddlEventos.SelectedValue))
                cmd.Parameters.AddWithValue("@AlunoID", Convert.ToInt32(ddlAlunos.SelectedValue))
                cmd.Parameters.AddWithValue("@StatusConvite", "Enviado")
                cmd.Parameters.AddWithValue("@DataEnvio", DateTime.Now)

                con.Open()
                cmd.ExecuteNonQuery()
            End Using

            ' Redirecionamento direto para a página de participação
            Response.Redirect("RegistroParticipacao.aspx")

        Catch ex As Exception
            lblMensagem.CssClass = "message-error"
            lblMensagem.Text = "Erro ao salvar convite: " & ex.Message
        End Try
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs)
        lblMensagem.Text = ""
        ddlEventos.SelectedIndex = 0
        ddlAlunos.SelectedIndex = 0
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
        Dim txtStatus As TextBox = CType(row.FindControl("txtStatusConvite"), TextBox)

        Try
            Using con As New SqlConnection(connectionString)
                Dim cmd As New SqlCommand("UPDATE ConvitesEvento SET StatusConvite=@StatusConvite WHERE ID=@ID", con)
                cmd.Parameters.AddWithValue("@StatusConvite", txtStatus.Text.Trim())
                cmd.Parameters.AddWithValue("@ID", id)

                con.Open()
                cmd.ExecuteNonQuery()
            End Using

            GridView1.EditIndex = -1
            lblMensagem.CssClass = "has-text-success"
            lblMensagem.Text = "Convite atualizado com sucesso!"
            GridView1.DataBind()
        Catch ex As Exception
            lblMensagem.CssClass = "message-error"
            lblMensagem.Text = "Erro ao atualizar convite: " & ex.Message
        End Try
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)

        Try
            Using con As New SqlConnection(connectionString)
                Dim cmd As New SqlCommand("DELETE FROM ConvitesEvento WHERE ID=@ID", con)
                cmd.Parameters.AddWithValue("@ID", id)

                con.Open()
                cmd.ExecuteNonQuery()
            End Using

            lblMensagem.CssClass = "has-text-success"
            lblMensagem.Text = "Convite excluído com sucesso!"
            GridView1.DataBind()
        Catch ex As Exception
            lblMensagem.CssClass = "message-error"
            lblMensagem.Text = "Erro ao excluir convite: " & ex.Message
        End Try
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        ' Personalizações futuras
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ' Futuro uso
    End Sub
End Class