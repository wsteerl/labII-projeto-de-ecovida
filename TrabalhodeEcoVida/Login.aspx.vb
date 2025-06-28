Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub btnEntrar_Click(sender As Object, e As EventArgs) Handles btnEntrar.Click
        Dim nomeLogin As String = txtNomeLogin.Text.Trim()
        Dim senha As String = txtSenha.Text.Trim()

        If String.IsNullOrEmpty(nomeLogin) OrElse String.IsNullOrEmpty(senha) Then
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Por favor, preencha todos os campos.');", True)
            Return
        End If

        Dim connString As String = ConfigurationManager.ConnectionStrings("EcoVidaBDConnectionString").ConnectionString

        Using conn As New SqlConnection(connString)
            Dim sql As String = "SELECT COUNT(*) FROM Alunos WHERE NomeLogin = @NomeLogin AND Senha = @Senha"
            Dim cmd As New SqlCommand(sql, conn)
            cmd.Parameters.AddWithValue("@NomeLogin", nomeLogin)
            cmd.Parameters.AddWithValue("@Senha", senha)

            Try
                conn.Open()
                Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())
                If count > 0 Then
                    ' Login válido, redireciona para a página principal
                    Response.Redirect("CadastroCategorias.aspx") ' Confirme o nome correto do arquivo
                Else
                    ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Nome de usuário ou senha inválidos.');", True)
                End If
            Catch ex As Exception
                ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Erro no login: " & ex.Message.Replace("'", "") & "');", True)
            End Try
        End Using
    End Sub
End Class