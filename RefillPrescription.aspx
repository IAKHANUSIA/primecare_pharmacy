<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RefillPrescription.aspx.vb" Inherits="RefillPrescriptionPage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Refill Prescription - Primecare Pharmacy</title>
    <meta name="description" content="Refill your prescription online with Primecare Pharmacy Edmonton. Fast, convenient, and safe medication delivery." />
    
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
            margin: 0;
            letter-spacing: -0.5px;
            text-shadow: 0 4px 12px rgba(0,0,0,0.4);
        }

        .rx-form-wrapper {
            max-width: 900px;
            margin: 40px auto 70px auto;
            padding: 0 24px;
        }

        .rx-form-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 35px 40px;
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.08);
        }

        .rx-form-header {
            text-align: center;
            margin-bottom: 28px;
            padding-bottom: 16px;
            border-bottom: 2px solid #e2e8f0;
        }

        .rx-form-title {
            font-size: 26px;
            font-weight: 800;
            color: #002b55;
            margin-bottom: 6px;
        }

        .rx-form-desc {
            font-size: 14.5px;
            color: #64748b;
        }

        .rx-form-section-label {
            font-size: 14.5px;
            font-weight: 800;
            color: #0e75c5;
            margin-top: 24px;
            margin-bottom: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .rx-form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
            margin-bottom: 14px;
        }

        .rx-label {
            font-size: 13.5px;
            font-weight: 700;
            color: #334155;
        }

        .rx-control {
            width: 100%;
            padding: 11px 15px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 14px;
            color: #0f172a;
            background-color: #ffffff;
            box-sizing: border-box;
            transition: all 0.2s ease;
        }

        .rx-control:focus {
            outline: none;
            border-color: #0e75c5;
            box-shadow: 0 0 0 3px rgba(14, 117, 197, 0.15);
        }

        .rx-grid-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px 20px;
        }

        .rx-grid-3col {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 14px 20px;
        }

        .rx-btn-submit {
            background: linear-gradient(135deg, #0e75c5 0%, #004886 100%);
            color: #ffffff;
            font-weight: 800;
            font-size: 16px;
            padding: 13px 50px;
            border-radius: 30px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-top: 24px;
            box-shadow: 0 4px 14px rgba(14, 117, 197, 0.35);
            transition: all 0.2s ease;
        }

        .rx-btn-submit:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(14, 117, 197, 0.45);
        }

        @media (max-width: 768px) {
            .rx-form-card { padding: 25px 20px; }
            .rx-grid-2col, .rx-grid-3col { grid-template-columns: 1fr; gap: 12px; }
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
                            <li><a href="RefillPrescription.aspx" class="active">Refill Prescription</a></li>
                            <li><a href="Default.aspx#transfer">Transfer Prescription (3-Step Guide)</a></li>
                            <li><a href="NewPrescription.aspx">New Prescription</a></li>
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
            <h1>Refill Prescription & Appointment Booking</h1>
        </section>

        <!-- Main Form Container -->
        <main class="rx-form-wrapper">
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" style="background:#dcfce7; border:1px solid #86efac; color:#166534; padding:18px 24px; border-radius:12px; margin-bottom:24px; text-align:center; font-weight:700; font-size:15px; box-shadow:0 4px 12px rgba(22,101,52,0.1);">
                Thank you! Your prescription refill request has been submitted successfully to Primecare Pharmacy.
            </asp:Panel>

            <div class="rx-form-card">
                <div class="rx-form-header">
                    <h2 class="rx-form-title">Refill Prescription</h2>
                    <p class="rx-form-desc">Quick, confidential prescription refills and transfers.</p>
                </div>

                <div class="rx-form-section-label">Pharmacy Location</div>
                <div class="rx-form-group">
                    <label class="rx-label">Select Location *</label>
                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="rx-control">
                        <asp:ListItem Value="Location 1 - Windermere">Location 1 - Windermere (5594 Windermere Blvd)</asp:ListItem>
                        <asp:ListItem Value="Location 2 - Leduc">Location 2 - Leduc (3610 Rollyview Rd #103)</asp:ListItem>
                        <asp:ListItem Value="Location 3 - St. Albert">Location 3 - St. Albert (1115 St Albert Trl #670)</asp:ListItem>
                    </asp:DropDownList>
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

                <div class="rx-form-section-label">Prescription Details</div>
                <div class="rx-grid-2col">
                    <div class="rx-form-group">
                        <label class="rx-label">Medication Name / Rx # *</label>
                        <asp:TextBox ID="txtMed1" runat="server" CssClass="rx-control" placeholder="Medication Name or Rx #" Required="true"></asp:TextBox>
                    </div>
                    <div class="rx-form-group">
                        <label class="rx-label">Quantity to Fill *</label>
                        <asp:TextBox ID="txtQty1" runat="server" CssClass="rx-control" placeholder="Quantity *" Required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="rx-form-group" style="margin-top: 12px;">
                    <label class="rx-label">Additional Medications / Notes (Optional)</label>
                    <asp:TextBox ID="txtMed2" runat="server" TextMode="MultiLine" Rows="2" CssClass="rx-control" placeholder="List any additional medications or instructions..."></asp:TextBox>
                </div>

                <asp:Button ID="btnSubmitRefill" runat="server" Text="Submit Refill Request" CssClass="rx-btn-submit" OnClick="btnSubmitRefill_Click" />
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
