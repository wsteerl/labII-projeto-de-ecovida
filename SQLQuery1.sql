INSERT INTO Alunos (NomeLogin, NomeCompleto, Turma, Senha, FotoPerfil)
VALUES
('admin', 'Administrador EcoVida', '3A', '1234', NULL),
('maria', 'Maria Silva', '2B', 'senha123', NULL),
('joao', 'João Pereira', '1C', 'abc123', NULL);

INSERT INTO AcoesSustentaveis (NomeAcao, TipoAcao, Descricao, DataRealizacao)
VALUES
('Mutirão de Reciclagem', 'Coletiva', 'Coleta e separação de resíduos recicláveis no bairro.', '2025-05-10'),
('Mutirão de Reciclagem', 'Coletiva', 'Coleta e separação de resíduos recicláveis no bairro.', '2025-10-05'),
('Mutirão de Reciclagem', 'Coletiva', 'Coleta e separação de resíduos recicláveis no bairro.', '2025-10-05'),
('Mutirão de Reciclagem', 'Coletiva', 'Coleta e separação de resíduos recicláveis no bairro.', '2025-06-05'),
('a', 'a', 'a', '2025-06-12');

INSERT INTO Alunos (NomeLogin, NomeCompleto, Turma, DataCadastro, Senha, FotoPerfil)
VALUES
('admin', 'Administrador EcoVida', '3A', '2025-06-22 13:42:51', '1234', NULL),
('maria', 'Maria Silva', '2B', '2025-06-22 13:42:51', 'senha123', NULL),
('joao', 'João Pereira', '1C', '2025-06-22 13:42:51', 'abc123', NULL),
('admin', 'Administrador EcoVida', '3A', '2025-06-22 13:43:48', '1234', NULL),
('maria', 'Maria Silva', '2B', '2025-06-22 13:43:48', 'senha123', NULL),
('joao', 'João Pereira', '1C', '2025-06-22 13:43:48', 'abc123', NULL);

INSERT INTO CategoriasConvivencia (NomeCategoria, Descricao)
VALUES
('Cuidando do Planeta', 'Palestra para abordar o tema da poluição.'),
('Reciclagem', 'Ações voltadas à separação e reaproveitamento de resíduos.'),
('Consumo Consciente', 'Mudanças nos hábitos de consumo visando a sustentabilidade.'),
('Horta Urbana', 'Atividades relacionadas ao cultivo de alimentos em espaços urbanos.'),
('Energia Limpa', 'Conscientização e uso de fontes de energia renováveis.'),
('Cuidando do Planeta', 'Palestra para abordar o tema da poluição.'),
('Energia Limpa', 'Conscientização e uso de fontes de energia renováveis.'),
('Cuidando do Planeta', 'Palestra para abordar o tema da poluição.'),
('a', 'a');

INSERT INTO ConvitesEvento (EventoID, AlunoID, StatusConvite, DataEnvio)
VALUES
(5, 6, 'Enviado', '2025-06-27 20:47:55'),
(5, 6, 'Enviado', '2025-06-27 20:53:11'),
(5, 6, 'Enviado', '2025-06-27 20:56:14'),
(5, 6, 'Enviado', '2025-06-27 20:57:33'),
(5, 3, 'Enviado', '2025-06-27 21:03:13'),
(5, 4, 'Enviado', '2025-06-27 21:27:28'),
(6, 6, 'Enviado', '2025-06-27 21:30:19');

INSERT INTO EventosSustentaveis (NomeEvento, Descricao, DataEvento, LocalEvento, Responsavel)
VALUES
('Dia do Meio Ambiente', 'Palestras e exposições sobre preservação ambiental.', '2025-06-05', 'Auditório EcoVida', 'Administrador EcoVida'),
('Semana da Água', 'Atividades educativas sobre o uso racional da água.', '2025-06-10', 'Sala 3A', 'Maria Silva'),
('Virada Sustentável', 'Evento com oficinas, arte e debates sobre ecologia.', '2025-06-20', 'Praça Central', 'João Pereira'),
('Semana da Água', 'Atividades educativas sobre o uso racional da água.', '2025-06-12', 'Sala 3A', 'Maria Silva'),
('Virada Sustentável', 'Evento com oficinas, arte e debates sobre ecologia.', '2025-06-04', 'Praça Central', 'João Pereira'),
('Semana da Água', 'Atividades educativas sobre o uso racional da água.', '2025-06-08', 'Sala 3A', 'Silva'),
('a', 'a', '2025-06-12', 'a', 'a');

INSERT INTO FaleConosco (UsuarioID, Mensagem, DataMensagem, Respondido)
VALUES
(2, 'Gostaria de sugerir uma oficina sobre hortas verticais.', '2025-06-25 14:51:34', 0),
(4, 'Tive problemas ao fazer login na plataforma.', '2025-06-25 14:51:34', 1),
(6, 'Parabéns pelo evento do Dia do Meio Ambiente!', '2025-06-25 14:51:34', 0),
(1, 'asdwqda', '2025-06-27 21:26:51', 0),
(1, 'a', '2025-06-27 21:27:06', 0),
(1, 'asdasd', '2025-06-27 21:30:26', 0);

INSERT INTO RegistroParticipacao (AlunoID, AcaoID, CategoriaID, PontuacaoImpacto)
VALUES
(5, 1, 2, 2),
(2, 12, 19, 5),
(5, 16, 15, 2),
(4, 12, 2, 3),
(3, 17, 22, 2);
