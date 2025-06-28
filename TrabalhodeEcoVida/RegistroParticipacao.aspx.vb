Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient

Partial Class RegistroParticipacao
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("EcoVidaBDConnectionString").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CarregarAlunos()
            CarregarAcoes()
            CarregarCategorias()
            LimparCampos()

            Dim alunoID As String = Request.QueryString("alunoID")
            If Not String.IsNullOrEmpty(alunoID) Then
                If ddlAlunos.Items.FindByValue(alunoID) IsNot Nothing Then
                    ddlAlunos.SelectedValue = alunoID
                End If
            End If
        End If
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

    Private Sub CarregarAcoes()
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT ID, NomeAcao FROM AcoesSustentaveis ORDER BY NomeAcao", con)
            Dim dt As New DataTable()
            Using da As New SqlDataAdapter(cmd)
                da.Fill(dt)
            End Using
            ddlAcoes.DataSource = dt
            ddlAcoes.DataTextField = "NomeAcao"
            ddlAcoes.DataValueField = "ID"
            ddlAcoes.DataBind()
        End Using
        ddlAcoes.Items.Insert(0, New ListItem("-- Selecione uma Ação --", "0"))
    End Sub

    Private Sub CarregarCategorias()
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT ID, NomeCategoria FROM CategoriasConvivencia ORDER BY NomeCategoria", con)
            Dim dt As New DataTable()
            Using da As New SqlDataAdapter(cmd)
                da.Fill(dt)
            End Using
            ddlCategorias.DataSource = dt
            ddlCategorias.DataTextField = "NomeCategoria"
            ddlCategorias.DataValueField = "ID"
            ddlCategorias.DataBind()
        End Using
        ddlCategorias.Items.Insert(0, New ListItem("-- Selecione uma Categoria --", "0"))
    End Sub

    Private Sub LimparCampos()
        ddlAlunos.SelectedIndex = 0
        ddlAcoes.SelectedIndex = 0
        ddlCategorias.SelectedIndex = 0
        txtPontuacao.Text = ""
        lblMensagem.Text = ""
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        lblMensagem.CssClass = "message-error"
        lblMensagem.Text = ""

        If ddlAlunos.SelectedValue = "0" Then
            lblMensagem.Text = "Selecione um aluno."
            Return
        End If
        If ddlAcoes.SelectedValue = "0" Then
            lblMensagem.Text = "Selecione uma ação."
            Return
        End If
        If ddlCategorias.SelectedValue = "0" Then
            lblMensagem.Text = "Selecione uma categoria."
            Return
        End If
        If String.IsNullOrWhiteSpace(txtPontuacao.Text) Then
            lblMensagem.Text = "Informe a pontuação de impacto."
            Return
        End If

        Try
            Using con As New SqlConnection(connectionString)
                Dim cmd As New SqlCommand("INSERT INTO RegistroParticipacao (AlunoID, AcaoID, CategoriaID, PontuacaoImpacto) VALUES (@AlunoID, @AcaoID, @CategoriaID, @PontuacaoImpacto)", con)
                cmd.Parameters.AddWithValue("@AlunoID", Convert.ToInt32(ddlAlunos.SelectedValue))
                cmd.Parameters.AddWithValue("@AcaoID", Convert.ToInt32(ddlAcoes.SelectedValue))
                cmd.Parameters.AddWithValue("@CategoriaID", Convert.ToInt32(ddlCategorias.SelectedValue))
                cmd.Parameters.AddWithValue("@PontuacaoImpacto", Convert.ToInt32(txtPontuacao.Text))

                con.Open()
                cmd.ExecuteNonQuery()
            End Using

            Response.Redirect("FaleConosco.aspx")
        Catch ex As Exception
            lblMensagem.CssClass = "message-error"
            lblMensagem.Text = "Erro ao salvar participação: " & ex.Message
        End Try
    End Sub

    Protected Sub btnLimpar_Click(sender As Object, e As EventArgs) Handles btnLimpar.Click
        LimparCampos()
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow AndAlso e.Row.RowState.HasFlag(DataControlRowState.Edit) Then
            ' Alunos
            Dim ddlAluno As DropDownList = CType(e.Row.FindControl("ddlAlunoEdit"), DropDownList)
            If ddlAluno IsNot Nothing Then
                ddlAluno.DataSource = ddlAlunos.Items
                ddlAluno.DataTextField = "Text"
                ddlAluno.DataValueField = "Value"
                ddlAluno.DataBind()

                Dim nomeAluno As String = DataBinder.Eval(e.Row.DataItem, "NomeAluno").ToString()
                Dim itemSelecionado = ddlAluno.Items.FindByText(nomeAluno)
                If itemSelecionado IsNot Nothing Then ddlAluno.SelectedValue = itemSelecionado.Value
            End If

            ' Ações
            Dim ddlAcao As DropDownList = CType(e.Row.FindControl("ddlAcaoEdit"), DropDownList)
            If ddlAcao IsNot Nothing Then
                ddlAcao.DataSource = ddlAcoes.Items
                ddlAcao.DataTextField = "Text"
                ddlAcao.DataValueField = "Value"
                ddlAcao.DataBind()

                Dim nomeAcao As String = DataBinder.Eval(e.Row.DataItem, "NomeAcao").ToString()
                Dim itemSelecionado = ddlAcao.Items.FindByText(nomeAcao)
                If itemSelecionado IsNot Nothing Then ddlAcao.SelectedValue = itemSelecionado.Value
            End If

            ' Categorias
            Dim ddlCategoria As DropDownList = CType(e.Row.FindControl("ddlCategoriaEdit"), DropDownList)
            If ddlCategoria IsNot Nothing Then
                ddlCategoria.DataSource = ddlCategorias.Items
                ddlCategoria.DataTextField = "Text"
                ddlCategoria.DataValueField = "Value"
                ddlCategoria.DataBind()

                Dim nomeCategoria As String = DataBinder.Eval(e.Row.DataItem, "NomeCategoria").ToString()
                Dim itemSelecionado = ddlCategoria.Items.FindByText(nomeCategoria)
                If itemSelecionado IsNot Nothing Then ddlCategoria.SelectedValue = itemSelecionado.Value
            End If
        End If
    End Sub

    Protected Sub GridView1_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim row As GridViewRow = GridView1.Rows(e.RowIndex)

        Dim ddlAlunoEdit As DropDownList = CType(row.FindControl("ddlAlunoEdit"), DropDownList)
        Dim ddlAcaoEdit As DropDownList = CType(row.FindControl("ddlAcaoEdit"), DropDownList)
        Dim ddlCategoriaEdit As DropDownList = CType(row.FindControl("ddlCategoriaEdit"), DropDownList)
        Dim txtPontuacaoEdit As TextBox = CType(row.FindControl("txtPontuacaoEdit"), TextBox)

        e.NewValues("AlunoID") = Convert.ToInt32(ddlAlunoEdit.SelectedValue)
        e.NewValues("AcaoID") = Convert.ToInt32(ddlAcaoEdit.SelectedValue)
        e.NewValues("CategoriaID") = Convert.ToInt32(ddlCategoriaEdit.SelectedValue)
        e.NewValues("PontuacaoImpacto") = Convert.ToInt32(txtPontuacaoEdit.Text)
    End Sub

    Protected Sub GridView1_RowEditing(sender As Object, e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        lblMensagem.CssClass = "has-text-success"
        lblMensagem.Text = "Participação excluída com sucesso!"
    End Sub
End Class