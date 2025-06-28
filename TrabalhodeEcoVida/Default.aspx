<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>
<html lang="pt-br">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Bem-vindo ao EcoVida</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css" rel="stylesheet" />
    <style>
        html, body {
            min-height: 100vh;
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #a5d6a7 0%, #e0f7fa 100%);
            color: #212121;
        }

        header {
            background-color: #66bb6a;
            color: white;
            text-align: center;
            padding: 2rem;
            font-weight: 700;
            font-size: 2.8rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .container {
            max-width: 1100px;
            margin: 2rem auto 0;
            padding: 0 1rem 4rem;
            background: transparent;
        }

        .intro-box {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            margin-bottom: 3.5rem;
            text-align: center;
            color: #212121;
            font-size: 1.1rem;
            line-height: 1.6;
        }

        .intro-box h2 {
            font-size: 2.3rem;
            margin-bottom: 1rem;
            color: #388e3c;
            font-weight: 600;
        }

        .transition-text {
            text-align: center;
            font-size: 1.3rem;
            font-weight: 500;
            color: #212121;
            margin-bottom: 2.5rem;
        }

        .card-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
        }

        .card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .card-content {
            padding: 1.5rem;
        }

        .card-content h2 {
            font-size: 1.4rem;
            margin-bottom: 0.8rem;
            color: #388e3c;
        }

        .card-content p {
            font-size: 1.05rem;
            line-height: 1.5;
        }

        .btn-container {
            text-align: center;
            margin-top: 3rem;
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
            width: 200px;
        }

        .btn-login:hover {
            background-color: #1b5e20;
        }

        .spacer {
            height: 5px;
            background: linear-gradient(135deg, #a5d6a7 0%, #e0f7fa 100%);
        }

        footer {
            background-color: #66bb6a;
            color: white;
            text-align: center;
            padding: 2rem;
            font-weight: 600;
            width: 100%;
            margin-top: 0 !important;
            border-top: none !important;
            box-shadow: none !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>EcoVida</header>

        <div class="container">
            <!-- Card de explicação -->
            <div class="intro-box">
                <h2>O que é o EcoVida?</h2>
                <p>
                    O EcoVida é uma iniciativa dedicada à sustentabilidade, educação ambiental e convivência ecológica.
                    Por meio de oficinas, campanhas, eventos e ações práticas, buscamos incentivar atitudes conscientes e fortalecer o engajamento coletivo na preservação do meio ambiente.<br />
                    Veja os cards abaixo para entender mais!
                </p>
            </div>

            <!-- Frase inspiradora -->
            <div class="transition-text">
                Sustentabilidade começa com pequenas atitudes no dia a dia!
            </div>

            <!-- Cards -->
            <div class="card-section">
                <!-- Categorias -->
                <div class="card">
                    <img src="https://plus.unsplash.com/premium_photo-1683063005230-ec93739b6dd8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmVjaWNsYWdlbXxlbnwwfHwwfHx8MA%3D%3D" alt="Categorias" />
                    <div class="card-content">
                        <h2>Categorias</h2>
                        <p>Classificações para organizar as ações, como reciclagem, energia limpa e hortas urbanas.</p>
                    </div>
                </div>

                <!-- Ações Sustentáveis -->
                <div class="card">
                    <img src="https://plus.unsplash.com/premium_photo-1712685912274-2483dade540f?q=80&w=1475&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Ações Sustentáveis" />
                    <div class="card-content">
                        <h2>Ações Sustentáveis</h2>
                        <p>Atividades e práticas que você pode realizar para contribuir com o meio ambiente.</p>
                    </div>
                </div>

                <!-- Eventos -->
                <div class="card">
                    <img src="https://media.istockphoto.com/id/1462151129/pt/foto/prevent-global-warming-girl-planting-a-small-tree.webp?a=1&b=1&s=612x612&w=0&k=20&c=TRFGStmh318jqGZtamu24IZsLolQb7nPR16WFMQGy5I=" alt="Eventos" />
                    <div class="card-content">
                        <h2>Eventos</h2>
                        <p>Encontros, oficinas e campanhas para engajar a comunidade em ações ecológicas.</p>
                    </div>
                </div>

                <!-- Participação -->
                <div class="card">
                    <img src="https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=800&q=80" alt="Participação" />
                    <div class="card-content">
                        <h2>Participação</h2>
                        <p>Registre sua presença e colabore com o fortalecimento do movimento sustentável.</p>
                    </div>
                </div>
            </div>

            <!-- Botão -->
            <div class="btn-container">
                <asp:Button ID="btnIrLogin" runat="server" CssClass="btn-login" Text="Ir para Login" OnClick="btnIrLogin_Click" />
            </div>
        </div>

        <!-- Transição suave para o footer -->
        <div class="spacer"></div>

        <footer>&copy; 2025 EcoVida. Todos os direitos reservados.</footer>
    </form>
</body>
</html>