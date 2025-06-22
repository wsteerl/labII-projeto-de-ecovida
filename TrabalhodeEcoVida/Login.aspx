<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login - EcoVida</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100%;
            background: linear-gradient(135deg, #a5d6a7 0%, #e0f7fa 100%);
            font-family: 'Poppins', sans-serif;
        }

        header {
            background-color: #66bb6a;
            color: white;
            text-align: center;
            padding: 1.5rem 0;
            font-size: 2.5rem;
            font-weight: bold;
            flex-shrink: 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 10px;
            min-height: calc(100vh - 120px);
        }

        .wrapper {
            width: 400px;
            border-radius: 15px;
            padding: 40px;
            background-color: #ffffff;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
        }

        h2 {
            font-size: 2.2rem;
            margin-bottom: 25px;
            color: #212121;
            letter-spacing: 1px;
            font-weight: 600;
            text-align: center;
        }

        .input-fields-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .input-field {
            margin: 0;
        }

            .input-field input {
                width: 100%;
                height: 40px;
                background: transparent;
                border: none;
                border-bottom: 2px solid #aaa;
                outline: none;
                font-size: 16px;
                color: #333;
                padding: 0 5px;
            }

            .input-field label {
                display: block;
                color: #666;
                margin-bottom: 5px;
                text-align: left;
                font-size: 14px;
            }

        .forget {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 15px 0 25px 0;
            font-size: 0.9rem;
            color: #444;
        }

            .forget label {
                display: flex;
                align-items: center;
                gap: 5px;
            }

            .forget a {
                color: #2e7d32;
                text-decoration: none;
            }

                .forget a:hover {
                    text-decoration: underline;
                }

        .btn-login {
            background-color: #2e7d32;
            color: #ffffff;
            font-weight: 600;
            border: none;
            padding: 15px 25px;
            cursor: pointer;
            border-radius: 25px;
            font-size: 18px;
            transition: all 0.3s ease;
            width: 100%;
        }

            .btn-login:hover {
                background-color: #1b5e20;
            }

        .register {
            text-align: center;
            margin-top: 20px;
            color: #444;
            font-size: 0.95rem;
        }

            .register a {
                color: #2e7d32;
                text-decoration: none;
                font-weight: 600;
            }

                .register a:hover {
                    text-decoration: underline;
                }

        footer {
            background-color: #66bb6a;
            color: white;
            padding: 1rem 0;
            text-align: center;
            width: 100%;
            flex-shrink: 0;
            box-shadow: 0 -2px 10px rgba(0,0,0,0.2);
            position: fixed;
            bottom: 0;
            left: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>EcoVida</header>

        <main>
            <div class="wrapper">
                <h2>Login</h2>

                <div class="input-fields-group">
                    <div class="input-field">
                        <label for="txtNomeLogin">Digite seu nome de usuario</label>
                        <asp:TextBox ID="txtNomeLogin" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <div class="input-field">
                        <label for="txtSenha">Digite sua senha</label>
                        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                    </div>
                </div>

                <div class="forget">
                    <label>
                        <asp:CheckBox ID="chkLembrar" runat="server" />
                        Lembre de mim
                    </label>
                    <a href="#">Esqueceu a senha?</a>
                </div>

                <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn-login" OnClick="btnEntrar_Click" />

                <div class="register">
                    <p>Sem conta ainda? <a href="#">Cadastre-se</a></p>
                </div>
            </div>
        </main>

        <footer>
            <p>&copy; 2025 EcoVida. Todos os direitos reservados.</p>
        </footer>
    </form>
</body>
</html>