Partial Class CadastroAcoes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Nenhum c�digo necess�rio aqui, pois o SqlDataSource cuida do carregamento
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs)
        ' Insere os dados usando o SqlDataSource
        SqlDataSource1.Insert()
        LimparCampos()

        ' Redireciona para a pr�xima p�gina ap�s salvar
        Response.Redirect("CadastroEventos.aspx")
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs)
        LimparCampos()
    End Sub

    Private Sub LimparCampos()
        txtNomeAcao.Text = ""
        txtTipoAcao.Text = ""
        txtDescricao.Text = ""
        txtDataRealizacao.Text = ""
    End Sub
End Class