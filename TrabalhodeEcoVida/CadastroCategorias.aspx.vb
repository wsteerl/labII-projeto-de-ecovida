Partial Class CadastroCategorias
    Inherits System.Web.UI.Page

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs)
        If String.IsNullOrWhiteSpace(txtNomeCategoria.Text) Then
            ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Por favor, preencha o nome da categoria.');", True)
            Return
        End If

        SqlDataSourceCategorias.Insert()

        ' Limpa os campos após salvar
        txtNomeCategoria.Text = ""
        txtDescricao.Text = ""

        ' Redireciona para a próxima página após salvar
        Response.Redirect("CadastroAcoes.aspx")
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs)
        txtNomeCategoria.Text = ""
        txtDescricao.Text = ""
    End Sub
End Class