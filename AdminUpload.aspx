<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminUpload.aspx.vb" Inherits="AdminUpload" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacist License Upload Form - Admin Portal | Primecare Pharmacy</title>
    <link rel="stylesheet" href="css/style.css" />
    <style>
        :root {
            --primary-blue: #0e75c5;
            --primary-green: #1ea84c;
            --primary-green-hover: #168a3d;
            --slate-dark: #0f172a;
            --slate-gray: #475569;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
            background-color: #f8fafc;
            color: #1e293b;
        }

        .admin-upload-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .page-header-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 24px 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04);
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .page-title {
            font-size: 24px;
            font-weight: 800;
            color: var(--slate-dark);
        }
        .page-subtitle {
            font-size: 14px;
            color: var(--slate-gray);
            margin-top: 4px;
        }
        .upload-card {
            background: #ffffff;
            border-radius: 12px;
            border-left: 5px solid var(--primary-green);
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.04);
        }
        .card-heading {
            font-size: 18px;
            font-weight: 800;
            color: var(--slate-dark);
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .card-desc {
            font-size: 14px;
            color: var(--slate-gray);
            margin-bottom: 24px;
            line-height: 1.6;
        }
        .form-group-custom {
            margin-bottom: 20px;
        }
        .form-label-custom {
            display: block;
            font-size: 14px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 8px;
        }
        .form-control-custom {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            transition: border-color 0.2s;
        }
        .form-control-custom:focus {
            border-color: var(--primary-blue);
        }
        .btn-upload-submit {
            background-color: var(--primary-green);
            color: #ffffff;
            padding: 13px 28px;
            border: none;
            border-radius: 8px;
            font-weight: 700;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.2s, transform 0.1s;
        }
        .btn-upload-submit:hover {
            background-color: var(--primary-green-hover);
        }
        .published-list-card {
            margin-top: 24px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 20px;
        }
        .published-title {
            font-size: 14px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 12px;
        }
        .published-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 12px;
        }
        .published-item {
            background: #ffffff;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            padding: 12px 16px;
            font-size: 13px;
        }
        .published-item a {
            color: var(--primary-blue);
            font-weight: 700;
            text-decoration: underline;
        }
        .alert-success {
            background-color: #dcfce7;
            border: 1px solid #86efac;
            color: #166534;
            padding: 14px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 14px;
        }
        .alert-danger {
            background-color: #fef2f2;
            border: 1px solid #fecaca;
            color: #991b1b;
            padding: 14px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header-container">
            <div class="nav-wrapper">
                <a href="Default.aspx" class="brand-logo">
                    <img src="images/logo.svg" alt="Primecare Pharmacy" />
                </a>
                <ul class="nav-menu">
                    <li class="nav-item"><a href="Default.aspx">Home</a></li>
                    <li class="nav-item"><a href="AboutUs.aspx">About Us</a></li>
                    <li class="nav-item"><a href="AdminUpload.aspx" class="active" style="color: #ffffff; font-weight: 700;">Upload Form</a></li>
                    <li class="nav-item"><a href="AdminReport.aspx" style="color: #ffffff; font-weight: 700;">Report</a></li>
                </ul>
            </div>
        </header>

        <div class="admin-upload-container">
            <div class="page-header-card">
                <div>
                    <h1 class="page-title">Pharmacist License & ACP Letter Upload Form</h1>
                    <div class="page-subtitle">Admin Portal - Manage official ACP practice permits and approved letters for all store locations</div>
                </div>
                <div>
                    <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" style="background:#e2e8f0; color:#475569; border:none; padding:10px 18px; border-radius:8px; font-weight:600; cursor:pointer;" />
                </div>
            </div>

            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert-success">
                <asp:Label ID="lblSuccessMessage" runat="server" />
            </asp:Panel>

            <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert-danger">
                <asp:Label ID="lblErrorMessage" runat="server" />
            </asp:Panel>

            <div class="upload-card">
                <h2 class="card-heading">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#16a34a" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                        <polyline points="14 2 14 8 20 8"></polyline>
                        <line x1="16" y1="13" x2="8" y2="13"></line>
                        <line x1="16" y1="17" x2="8" y2="17"></line>
                    </svg>
                    Upload Store Location License / ACP Approved Letter
                </h2>
                <p class="card-desc">
                    Select your store location, choose the official Alberta College of Pharmacy (ACP) approved letter or practice permit (.pdf, .png, .jpg, .jpeg), and click upload to update the customer verification link.
                </p>

                <div class="form-group-custom">
                    <label class="form-label-custom">1. Select Pharmacy Location *</label>
                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="form-control-custom">
                        <asp:ListItem Value="1">Location 1 - Windermere (Permit #14786 - Sarafaraz Shaikh)</asp:ListItem>
                        <asp:ListItem Value="2">Location 2 - Leduc (Permit #14544 - Sakibbhai Khanusia)</asp:ListItem>
                        <asp:ListItem Value="3">Location 3 - St. Albert (Permit #15544 - Chirag Patel)</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group-custom">
                    <label class="form-label-custom">2. Select ACP Approved Document / Image File *</label>
                    <asp:FileUpload ID="fileLicense" runat="server" CssClass="form-control-custom" />
                </div>

                <div style="margin-top: 24px;">
                    <asp:Button ID="btnUploadSubmit" runat="server" Text="Upload & Publish License Document" OnClick="btnUploadSubmit_Click" CssClass="btn-upload-submit" />
                </div>

                <div class="published-list-card">
                    <div class="published-title">Current Published ACP License Letters:</div>
                    <div class="published-grid">
                        <div class="published-item">
                            <div><strong>Windermere Location</strong></div>
                            <div style="margin-top:4px;">
                                <a href="docs/pharmacy_license.html?loc=1" target="_blank" style="font-weight:700; color:#0e75c5;">[View Verification Portal]</a>
                                <span style="color:#cbd5e1; margin: 0 4px;">|</span>
                                <a href="docs/pharmacy_license_windermere.pdf?v=<%= DateTime.Now.Ticks %>" target="_blank" style="font-weight:600; color:#475569;">[Direct Document]</a>
                            </div>
                        </div>
                        <div class="published-item">
                            <div><strong>Leduc Location</strong></div>
                            <div style="margin-top:4px;">
                                <a href="docs/pharmacy_license.html?loc=2" target="_blank" style="font-weight:700; color:#0e75c5;">[View Verification Portal]</a>
                                <span style="color:#cbd5e1; margin: 0 4px;">|</span>
                                <a href="docs/pharmacy_license_leduc.pdf?v=<%= DateTime.Now.Ticks %>" target="_blank" style="font-weight:600; color:#475569;">[Direct Document]</a>
                            </div>
                        </div>
                        <div class="published-item">
                            <div><strong>St. Albert Location</strong></div>
                            <div style="margin-top:4px;">
                                <a href="docs/pharmacy_license.html?loc=3" target="_blank" style="font-weight:700; color:#0e75c5;">[View Verification Portal]</a>
                                <span style="color:#cbd5e1; margin: 0 4px;">|</span>
                                <a href="docs/pharmacy_license_stalbert.pdf?v=<%= DateTime.Now.Ticks %>" target="_blank" style="font-weight:600; color:#475569;">[Direct Document]</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
