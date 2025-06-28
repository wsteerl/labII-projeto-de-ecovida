Imports System.Configuration
Imports System.Data.SqlClient

Partial Class FaleConosco
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("EcoVidaBDConnectionString").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Nenhuma ação especial no carregamento inicial
        lblMensagem.Text = ""
    End Sub

    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs)
        lblMensagem.Text = ""

        If String.IsNullOrWhiteSpace(txtMensagem.Text) Then
            lblMensagem.CssClass = "has-text-red"
            lblMensagem.Text = "Por favor, digite uma mensagem."
            Return
        End If

        Try
            Dim usuarioID As Integer = 1 ' Aqui você deve pegar o usuário autenticado, se tiver autenticação

            Using con As New SqlConnection(connectionString)
                Dim query As String = "INSERT INTO FaleConosco (UsuarioID, Mensagem, DataMensagem, Respondido) VALUES (@UsuarioID, @Mensagem, @DataMensagem, 0)"
                Using cmd As New SqlCommand(query, con)
                    cmd.Parameters.AddWithValue("@UsuarioID", usuarioID)
                    cmd.Parameters.AddWithValue("@Mensagem", txtMensagem.Text.Trim())
                    cmd.Parameters.AddWithValue("@DataMensagem", DateTime.Now)

                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            ' Redireciona para RegistroParticipacao.aspx com mensagem de sucesso via query string
            Response.Redirect("RegistroParticipacao.aspx?msg=" & Server.UrlEncode("Mensagem enviada com sucesso!"))

        Catch ex As Exception
            lblMensagem.CssClass = "has-text-red"
            lblMensagem.Text = "Erro ao enviar mensagem: " & ex.Message
        End Try
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs)
        lblMensagem.Text = ""
        txtMensagem.Text = ""
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Try
            Dim id As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Value)

            Using con As New SqlConnection(connectionString)
                Using cmd As New SqlCommand("DELETE FROM FaleConosco WHERE ID=@ID", con)
                    cmd.Parameters.AddWithValue("@ID", id)
                    con.Open()
                    cmd.ExecuteNonQuery()
                End Using
            End Using

            lblMensagem.CssClass = "has-text-success"
            lblMensagem.Text = "Mensagem excluída com sucesso!"

            GridView1.DataBind()
        Catch ex As Exception
            lblMensagem.CssClass = "has-text-red"
            lblMensagem.Text = "Erro ao excluir mensagem: " & ex.Message
        End Try
    End Sub
End Class