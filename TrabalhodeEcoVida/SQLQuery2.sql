CREATE TABLE [dbo].[AcoesSustentaveis] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [NomeAcao]       VARCHAR (255) NOT NULL,
    [TipoAcao]       VARCHAR (100) NOT NULL,
    [Descricao]      TEXT          NOT NULL,
    [DataRealizacao] DATE          NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE [dbo].[Alunos] (
    [ID]           INT           IDENTITY (1, 1) NOT NULL,
    [NomeLogin]    VARCHAR (255) NOT NULL,
    [NomeCompleto] VARCHAR (255) NOT NULL,
    [Turma]        VARCHAR (50)  NULL,
    [DataCadastro] DATETIME      DEFAULT (getdate()) NULL,
    [Senha]        VARCHAR (255) NOT NULL,
    [FotoPerfil]   VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE [dbo].[CategoriasConvivencia] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [NomeCategoria] VARCHAR (255) NOT NULL,
    [Descricao]     TEXT          NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE [dbo].[ConvitesEvento] (
    [ID]            INT           IDENTITY (1, 1) NOT NULL,
    [EventoID]      INT           NOT NULL,
    [AlunoID]       INT           NOT NULL,
    [StatusConvite] NVARCHAR (20) NOT NULL,
    [DataEnvio]     DATETIME      DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ConvitesEvento_Eventos] FOREIGN KEY ([EventoID]) REFERENCES [dbo].[EventosSustentaveis] ([ID]),
    CONSTRAINT [FK_ConvitesEvento_Alunos] FOREIGN KEY ([AlunoID]) REFERENCES [dbo].[Alunos] ([ID]),
    CHECK ([StatusConvite]='Recusado' OR [StatusConvite]='Aceito' OR [StatusConvite]='Enviado')
);

CREATE TABLE [dbo].[EventosSustentaveis] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [NomeEvento]  VARCHAR (255) NOT NULL,
    [Descricao]   TEXT          NULL,
    [DataEvento]  DATE          NOT NULL,
    [LocalEvento] VARCHAR (255) NULL,
    [Responsavel] VARCHAR (255) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE [dbo].[FaleConosco] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [UsuarioID]    INT            NOT NULL,
    [Mensagem]     NVARCHAR (MAX) NOT NULL,
    [DataMensagem] DATETIME       DEFAULT (getdate()) NULL,
    [Respondido]   BIT            DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_FaleConosco_Usuarios] FOREIGN KEY ([UsuarioID]) REFERENCES [dbo].[Alunos] ([ID])
);

CREATE TABLE [dbo].[RegistroParticipacao] (
    [ID]               INT IDENTITY (1, 1) NOT NULL,
    [AlunoID]          INT NOT NULL,
    [AcaoID]           INT NOT NULL,
    [CategoriaID]      INT NOT NULL,
    [PontuacaoImpacto] INT DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RegistroParticipacao_Alunos] FOREIGN KEY ([AlunoID]) REFERENCES [dbo].[Alunos] ([ID]),
    CONSTRAINT [FK_RegistroParticipacao_Categorias] FOREIGN KEY ([CategoriaID]) REFERENCES [dbo].[CategoriasConvivencia] ([ID])
);
