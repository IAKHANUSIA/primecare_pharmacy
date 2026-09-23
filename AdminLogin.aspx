<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminLogin.aspx.vb" Inherits="AdminLogin" %>

    <!DOCTYPE html>
    <html lang="en">

    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin Login - Primecare Pharmacy Reports Portal</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="icon" href="images/logo.svg" type="image/svg+xml" />
        <style>
            .login-wrapper {
                min-height: 80vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 40px 20px;
            }

            .login-card {
                background: #ffffff;
                border-radius: 16px;
                box-shadow: 0 20px 40px -10px rgba(0, 43, 85, 0.15);
                border: 1px solid #e2e8f0;
                width: 100%;
                max-width: 420px;
                padding: 35px 30px;
                text-align: center;
            }

            .login-logo {
                max-height: 55px;
                margin: 0 auto 20px auto;
            }

            .login-title {
                font-size: 22px;
                font-weight: 800;
                color: var(--dark-navy);
                margin-bottom: 6px;
            }

            .login-desc {
                font-size: 13.5px;
                color: var(--text-muted);
                margin-bottom: 25px;
            }

            .form-group-login {
                text-align: left;
                margin-bottom: 18px;
            }

            .login-btn {
                width: 100%;
                padding: 12px;
                background-color: var(--primary-green);
                color: #ffffff;
                font-weight: 700;
                font-size: 15px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: var(--transition-smooth);
                margin-top: 10px;
            }

            .login-btn:hover {
                background-color: var(--primary-green-hover);
            }

            .alert-error {
                background-color: #fef2f2;
                color: #991b1b;
                border: 1px solid #fecaca;
                padding: 12px;
                border-radius: 8px;
                font-size: 13.5px;
                margin-bottom: 20px;
                text-align: left;
            }
        </style>
    </head>

    <body style="background-color: #f8fafc;">
        <form id="form1" runat="server">
            <header class="header-container">
                <div class="nav-wrapper">
                    <a href="Default.aspx" class="brand-logo">
                        <img src="images/logo.svg" alt="Primecare Pharmacy" />
                    </a>
                    <ul class="nav-menu">
                        <li class="nav-item"><a href="Default.aspx">Home</a></li>
                        <li class="nav-item"><a href="AboutUs.aspx">About Us</a></li>
                        <li class="nav-item"><a href="AdminLogin.aspx" class="active"
                                style="color: #ffffff; font-weight: 700;">Admin Login</a></li>
                        <li class="nav-item"><a href="AdminUpload.aspx" style="color: #ffffff; font-weight: 700;">Upload
                                License</a></li>
                        <li class="nav-item"><a href="AdminReport.aspx"
                                style="color: #ffffff; font-weight: 700;">Report</a></li>
                    </ul>
                </div>
            </header>

            <div class="login-wrapper">
                <div class="login-card">
                    <img src="images/logo.svg" alt="Primecare Pharmacy" class="login-logo" />
                    <h1 class="login-title">Admin Reports Portal</h1>
                    <p class="login-desc">Enter your administrator credentials to access booking data reports.</p>

                    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert-error">
                        <asp:Label ID="lblErrorMessage" runat="server" Text="Invalid username or password."></asp:Label>
                    </asp:Panel>

                    <div class="form-group-login">
                        <label class="form-label">Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"
                            placeholder="Enter Admin Username"></asp:TextBox>
                    </div>

                    <div class="form-group-login">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"
                            placeholder="Enter Admin Password"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Log In to Admin Portal" OnClick="btnLogin_Click"
                        CssClass="login-btn" />
                </div>
            </div>
        </form>
    </body>

    </html>