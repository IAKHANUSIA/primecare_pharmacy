<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NewPrescription.aspx.vb" Inherits="NewPrescriptionPage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>New Prescriptions - Primecare Pharmacy</title>
    <meta name="description" content="Submit new prescription orders online with Primecare Pharmacy Edmonton." />
    
    <!-- Google Fonts Preconnect & Styles -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="css/style.css?v=2.4" />
    <link rel="icon" href="images/logo.svg" type="image/svg+xml" />

    <style>
        .page-hero {
            position: relative;
            height: 200px;
            background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, 0.55)), url('images/prescriptions_apothecary.jpg') center center / cover no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #ffffff;
        }

        .page-hero h1 {
            font-size: 38px;
            font-weight: 800;
            letter-spacing: -0.5px;
            text-shadow: 0 4px 12px rgba(0,0,0,0.4);
        }

        .form-container {
            max-width: 900px;
            margin: 40px auto 70px auto;
            padding: 0 24px;
        }

        .form-section-title {
            font-size: 14.5px;
            font-weight: 700;
            color: #64748b;
            margin-top: 28px;
            margin-bottom: 12px;
        }

        .form-grid-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px 20px;
        }

        .form-grid-3col {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 14px 20px;
        }

        .rx-input {
            width: 100%;
            padding: 10px 14px;
            border: 1px solid #e2e8f0;
            border-radius: 4px;
            font-size: 14px;
            color: #334155;
            background-color: #ffffff;
            box-sizing: border-box;
            transition: all 0.2s ease;
        }

        .rx-input:focus {
            outline: none;
            border-color: #0e75c5;
            box-shadow: 0 0 0 3px rgba(14, 117, 197, 0.12);
        }

        .file-upload-box {
            margin-top: 8px;
        }

        .submit-btn-container {
            text-align: center;
            margin-top: 36px;
        }

        .btn-submit-green {
            background: linear-gradient(135deg, #0e75c5 0%, #004886 100%);
            color: #ffffff;
            font-weight: 700;
            font-size: 16px;
            padding: 12px 50px;
            border-radius: 30px;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 4px 14px rgba(14, 117, 197, 0.25);
        }

        .btn-submit-green:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(14, 117, 197, 0.35);
        }

        @media (max-width: 768px) {
            .form-grid-2col, .form-grid-3col {
                grid-template-columns: 1fr;
                gap: 12px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Announcement Bar -->
        <div class="edmonton-locations-bar">
            <div class="edmonton-locations-container">
                <div><strong>3 Edmonton Pharmacy Locations to Serve You:</strong></div>
                <div class="edmonton-locations-list">
                    <a href="AboutUs.aspx?loc=1" class="edmonton-location-chip">
                        <%= PrimecarePharmacy.PharmacyConfig.Location1.ChipDisplay %>
                    </a>
                    <a href="AboutUs.aspx?loc=2" class="edmonton-location-chip">
                        <%= PrimecarePharmacy.PharmacyConfig.Location2.ChipDisplay %>
                    </a>
                    <a href="AboutUs.aspx?loc=3" class="edmonton-location-chip">
                        <%= PrimecarePharmacy.PharmacyConfig.Location3.ChipDisplay %>
                    </a>
                </div>
            </div>
        </div>

        <!-- Header Nav Bar -->
        <header class="header-container">
            <div class="nav-wrapper">
                <a href="Default.aspx" class="brand-logo">
                    <img src="images/logo.svg" alt="Primecare Pharmacy" />
                </a>

                <ul class="nav-menu">
                    <li class="nav-item"><a href="Default.aspx">Home</a></li>
                    <li class="nav-item"><a href="AboutUs.aspx">About Us</a></li>
                    <li class="nav-item dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">Services</a>
                        <ul class="dropdown-menu">
                            <li><a href="Default.aspx#services" style="font-weight:700; color:var(--teal);">All Services Overview &rarr;</a></li>
                            <li><a href="Default.aspx#minor-ailments" style="font-weight:700; color:var(--primary);">Minor Ailments Prescribing</a></li>
                            <li><a href="services/prescriptions/">Prescriptions</a></li>
                            <li><a href="services/injection-travel-health/">Injection / Travel Health</a></li>
                            <li><a href="services/diabetes-management/">Diabetes Management</a></li>
                            <li><a href="services/home-health-care/">Home Health Care</a></li>
                            <li><a href="services/medication-reviews/">Medication Reviews</a></li>
                            <li><a href="services/smoking-cessation-support/">Smoking Cessation</a></li>
                            <li><a href="services/asthma-copd-management/">Asthma / COPD</a></li>
                            <li><a href="services/heart-health/">Heart Health</a></li>
                            <li><a href="services/weight-management/">Weight Management</a></li>
                            <li><a href="services/medication-compounding/">Medication Compounding</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="Default.aspx#minor-ailments">Minor Ailments</a></li>
                    <li class="nav-item dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle active" role="button" aria-haspopup="true" aria-expanded="false">Refill &amp; Transfer Rx</a>
                        <ul class="dropdown-menu">
                            <li><a href="RefillPrescription.aspx">Refill Prescription</a></li>
                            <li><a href="Default.aspx#transfer">Transfer Prescription (3-Step Guide)</a></li>
                            <li><a href="NewPrescription.aspx" class="active">New Prescription</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="Testimonials.aspx">Testimonials</a></li>
                    <li class="nav-item"><a href="Default.aspx#locations">Locations</a></li>
                    <li class="nav-item"><a href="Default.aspx#footer-contact">Contact Us</a></li>
                </ul>

                <button type="button" class="mobile-toggle" aria-label="Toggle Navigation Menu"
                    onclick="toggleMobileMenu(event);">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="3" y1="12" x2="21" y2="12"></line>
                        <line x1="3" y1="6" x2="21" y2="6"></line>
                        <line x1="3" y1="18" x2="21" y2="18"></line>
                    </svg>
                </button>
            </div>
        </header>

        <!-- Page Hero -->
        <section class="page-hero">
            <h1>New Prescriptions</h1>
        </section>

        <!-- Main Form Container -->
        <main class="rx-form-wrapper">
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" style="background:#dcfce7; border:1px solid #86efac; color:#166534; padding:18px 24px; border-radius:12px; margin-bottom:24px; text-align:center; font-weight:700; font-size:15px; box-shadow:0 4px 12px rgba(22,101,52,0.1);">
                Thank you! Your new prescription request has been submitted successfully to Primecare Pharmacy.
            </asp:Panel>

            <div class="rx-form-card">
                <div class="rx-form-header">
                    <h2 class="rx-form-title">New Prescription</h2>
                    <p class="rx-form-desc">Fast, confidential prescription uploads and transfers.</p>
                </div>

                <div class="rx-form-section-label">Contact Details</div>
                <div class="rx-grid-2col">
                    <div class="rx-form-group">
                        <label class="rx-label">First Name *</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="rx-control" placeholder="First Name *" Required="true"></asp:TextBox>
                    </div>
                    <div class="rx-form-group">
                        <label class="rx-label">Last Name *</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="rx-control" placeholder="Last Name *" Required="true"></asp:TextBox>
                    </div>
                    <div class="rx-form-group">
                        <label class="rx-label">Email Address *</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="rx-control" placeholder="Email *" Required="true"></asp:TextBox>
                    </div>
                    <div class="rx-form-group">
                        <label class="rx-label">Phone Number *</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="rx-control" placeholder="Phone *" Required="true"></asp:TextBox>
                    </div>
                </div>

                <div class="rx-form-section-label">Delivery Details</div>
                <div class="rx-grid-3col">
                    <div class="rx-form-group">
                        <label class="rx-label">Street Address *</label>
                        <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="rx-control" placeholder="Street Address *" Required="true"></asp:TextBox>
                    </div>
                    <div class="rx-form-group">
                        <label class="rx-label">City *</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="rx-control" placeholder="City *" Required="true"></asp:TextBox>
                    </div>
                    <div class="rx-form-group">
                        <label class="rx-label">Postal Code *</label>
                        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="rx-control" placeholder="Postal Code *" Required="true"></asp:TextBox>
                    </div>
                </div>

                <div class="rx-form-section-label">Prescription / Insurance Upload</div>
                <div class="rx-form-group">
                    <label class="rx-label">Upload Document / Photo *</label>
                    <asp:FileUpload ID="fileInsurance" runat="server" CssClass="rx-control" style="padding: 8px;" />
                </div>

                <asp:Button ID="btnSubmitNew" runat="server" Text="Submit New Prescription" CssClass="rx-btn-submit" OnClick="btnSubmitNew_Click" />
            </div>
        </main>

        <!-- Footer -->
        <footer id="footer-contact" class="footer">
            <div class="footer-container">
                <div class="footer-brand-col">
                    <div class="footer-logo">
                        <img src="images/logo.svg" alt="Primecare Pharmacy" />
                    </div>
                    <p class="footer-about-text">
                        Independently owned pharmacy serving Windermere & Edmonton with medication safety, prescriptions, and healthcare excellence.
                    </p>
                </div>

                <div class="footer-links-col">
                    <h3 class="footer-column-title">Quick Links</h3>
                    <ul class="quick-links-grid">
                        <li><a href="Default.aspx">Home</a></li>
                        <li><a href="Testimonials.aspx">Testimonials</a></li>
                        <li><a href="AboutUs.aspx">Meet the Pharmacist</a></li>
                        <li><a href="RefillPrescription.aspx">Re-Fill Prescription</a></li>
                        <li><a href="NewPrescription.aspx">New Prescription</a></li>
                    </ul>
                </div>
            <div class="footer-bottom">
                <div>&copy; <%= DateTime.Now.Year %> Primecare Pharmacy &amp; Travel Clinic. All Rights Reserved. Regulated by the Alberta College of Pharmacy (ACP).</div>
                <div style="display:flex; gap:16px; align-items:center;">
                    <a href="Default.aspx">Home</a>
                    <a href="Default.aspx#locations">Locations</a>
                    <a href="AdminLogin.aspx">Staff Portal</a>
                </div>
            </div>
        </footer>
    </form>
    <script src="js/script.js?v=2.4"></script>
</body>
</html>
