<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AboutUs.aspx.vb" Inherits="AboutUsPage" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About Us - Primecare Pharmacy Windermere Edmonton</title>
    <meta name="description" content="Learn about Primecare Pharmacy in Windermere Plaza, Edmonton. Licensed Pharmacist & Proprietor Sakibbhai Khanusia, Practice Permit #14544." />
    
    <!-- Google Fonts Preconnect & Styles -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="css/style.css?v=2.1" />
    <link rel="icon" href="images/logo.svg" type="image/svg+xml" />

    <style>
        /* Dedicated Styles for About Us Page */
        .about-hero {
            position: relative;
            height: 220px;
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.6)), url('images/about_storefront_hero.jpg') center center / cover no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #ffffff;
        }

        .about-hero h1 {
            font-size: 42px;
            font-weight: 800;
            letter-spacing: -0.5px;
            text-shadow: 0 4px 12px rgba(0,0,0,0.4);
        }

        .about-page-container {
            max-width: 1140px;
            margin: 50px auto 80px auto;
            padding: 0 24px;
        }

        .about-top-grid {
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            gap: 40px;
            align-items: start;
            margin-bottom: 50px;
        }

        .about-intro-p {
            font-size: 15px;
            line-height: 1.7;
            color: #475569;
            margin-bottom: 24px;
        }

        .proprietor-card {
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 24px;
            text-align: center;
        }

        .proprietor-name {
            font-size: 18px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 4px;
        }

        .proprietor-title {
            font-size: 14px;
            font-weight: 700;
            color: #0c76c6;
            margin-bottom: 6px;
        }

        .permit-number {
            font-size: 14px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 8px;
        }

        .proprietor-address {
            font-size: 13px;
            color: #64748b;
            margin-bottom: 16px;
        }

        .store-interior-img {
            width: 100%;
            height: auto;
            max-height: 440px;
            object-fit: contain;
            background-color: #f1f5f9;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        /* Services Checklist Box */
        .services-section-title {
            font-size: 20px;
            font-weight: 800;
            color: #1e293b;
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .services-section-title::before {
            content: '';
            display: inline-block;
            width: 4px;
            height: 24px;
            background-color: #1ea84c;
            border-radius: 2px;
        }

        .services-checklist-box {
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            margin-bottom: 40px;
        }

        .services-checklist-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px 30px;
        }

        .checklist-item {
            font-size: 14.5px;
            color: #334155;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .checklist-item::before {
            content: '>';
            font-weight: 800;
            color: #64748b;
            font-size: 13px;
        }

        /* Bottom Inquiry & ACP Regulatory Disclosure Box */
        .inquiry-notice {
            font-size: 14px;
            line-height: 1.6;
            color: #475569;
            margin-bottom: 12px;
        }

        .acp-link {
            font-size: 14px;
            font-weight: 700;
            color: #0c76c6;
            text-decoration: underline;
            margin-bottom: 30px;
            display: inline-block;
        }

        .regulatory-disclosure-box {
            background-color: #f1f5f9;
            border-radius: 8px;
            padding: 24px 30px;
            text-align: center;
            font-size: 13px;
            line-height: 1.6;
            color: #475569;
        }

        .regulatory-header {
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 10px;
            font-size: 14px;
        }

        .btn-blue-pill {
            background-color: #0c76c6;
            color: #ffffff;
            font-weight: 700;
            font-size: 13px;
            padding: 8px 24px;
            border-radius: 50px;
            display: inline-block;
            margin-top: 14px;
            border: none;
            cursor: pointer;
        }

        .btn-blue-pill:hover {
            background-color: #095996;
        }

        @media (max-width: 992px) {
            .about-top-grid {
                grid-template-columns: 1fr;
            }
            .services-checklist-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Top 3 Edmonton Pharmacy Locations Announcement Bar -->
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

        <!-- Header Navigation Bar -->
        <header class="header-container">
            <div class="nav-wrapper">
                <a href="Default.aspx" class="brand-logo">
                    <img src="images/logo.svg" alt="Primecare Pharmacy - Your health is our focus" />
                </a>

                <ul class="nav-menu">
                    <li class="nav-item"><a href="Default.aspx">Home</a></li>
                    <li class="nav-item"><a href="AboutUs.aspx" class="active">About Us</a></li>
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
                        <a href="javascript:void(0);" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">Refill &amp; Transfer Rx</a>
                        <ul class="dropdown-menu">
                            <li><a href="RefillPrescription.aspx">Refill Prescription</a></li>
                            <li><a href="Default.aspx#transfer">Transfer Prescription (3-Step Guide)</a></li>
                            <li><a href="NewPrescription.aspx">New Prescription</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="Testimonials.aspx">Testimonials</a></li>
                    <li class="nav-item"><a href="Default.aspx#locations">Locations</a></li>
                    <li class="nav-item"><a href="#footer-contact">Contact Us</a></li>
                </ul>

                <button type="button" class="mobile-toggle" aria-label="Toggle Navigation Menu"
                    onclick="document.querySelector('.nav-menu').classList.toggle('mobile-active');">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="3" y1="12" x2="21" y2="12"></line>
                        <line x1="3" y1="6" x2="21" y2="6"></line>
                        <line x1="3" y1="18" x2="21" y2="18"></line>
                    </svg>
                </button>
            </div>
        </header>

        <!-- About Us Hero Banner -->
        <section class="about-hero">
            <h1 id="aboutHeroTitle">About Us - <%= SelectedLocation.ShortName %> Location</h1>
        </section>

        <!-- Main About Us Content -->
        <main class="about-page-container">
            <!-- Location Switcher Tabs -->
            <div class="location-switcher-bar" style="margin-bottom: 30px; text-align: center;">
                <div style="font-size: 13px; font-weight: 800; color: #15803d; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 12px;">Select Edmonton Location:</div>
                <div style="display: flex; gap: 12px; justify-content: center; flex-wrap: wrap;">
                    <a href="AboutUs.aspx?loc=1" class="btn-location-tab <%= If(SelectedLocation.Id = 1, "active", "") %>" data-loc="1">Windermere</a>
                    <a href="AboutUs.aspx?loc=2" class="btn-location-tab <%= If(SelectedLocation.Id = 2, "active", "") %>" data-loc="2">Leduc</a>
                    <a href="AboutUs.aspx?loc=3" class="btn-location-tab <%= If(SelectedLocation.Id = 3, "active", "") %>" data-loc="3">St. Albert</a>
                </div>
            </div>

            <div class="about-top-grid">
                <!-- Left Column -->
                <div>
                    <p class="about-intro-p">
                        Primecare Pharmacy is proud to serve our community across Edmonton. We pride ourselves as independently owned pharmacies focusing on patient-centered customer service to promote medication safety and healthcare excellence at our <strong id="locPharmacyName"><%= SelectedLocation.Name %></strong> location.
                    </p>
                    <div class="proprietor-card">
                        <div id="locPharmacistName" class="proprietor-name pharmacist-highlight"><%= SelectedLocation.PharmacistName %></div>
                        <div id="locProprietorTitle" class="proprietor-title">Pharmacist & Proprietor - <%= SelectedLocation.ShortName %></div>
                        <div class="permit-number permit-highlight">Practice permit number <span id="locPermitNumber"><%= SelectedLocation.PracticePermitNumber %></span></div>
                        <div class="proprietor-address">Address: <span id="locAddress"><%= SelectedLocation.Address %> <%= SelectedLocation.CityStateZip %></span></div>
                        <div style="margin-bottom: 14px; font-size: 13px; color: #475569;">Phone: <strong id="locPhone"><%= SelectedLocation.Phone %></strong> | Fax: <strong id="locFax"><%= SelectedLocation.Fax %></strong></div>
                    </div>
                </div>

                <!-- Right Column: Store Interior Photography -->
                <div>
                    <img id="locStoreImg" src="<%= If(SelectedLocation.Id = 2, "images/leduc_pharmacy-1.jpg", If(SelectedLocation.Id = 3, "images/albert-ph-1.jpg", "images/wind-ph-1.jpg")) %>" alt="Primecare Pharmacy Store Interior Aisles" class="store-interior-img" style="transition: opacity 0.3s ease;" />
                </div>
            </div>

            <!-- Services Offered Checklist Box -->
            <div class="services-section-title">
                Primecare Pharmacy is proud to offer the following services:
            </div>

            <div class="services-checklist-box">
                <div class="services-checklist-grid">
                    <div>
                        <div class="checklist-item">City-wide Free Delivery</div>
                        <div class="checklist-item" style="margin-top:12px;">Medication Reviews</div>
                        <div class="checklist-item" style="margin-top:12px;">Flu Shot And Travel vaccination</div>
                        <div class="checklist-item" style="margin-top:12px;">Easy Prescription Transfer</div>
                    </div>
                    <div>
                        <div class="checklist-item">Compliance Packaging (i.e. Blister Pack)</div>
                        <div class="checklist-item" style="margin-top:12px;">Pharmacist Home visit</div>
                        <div class="checklist-item" style="margin-top:12px;">Smoking Cessation Program</div>
                        <div class="checklist-item" style="margin-top:12px;">Free Blood sugar and Free Blood pressure Monitoring</div>
                    </div>
                </div>
            </div>

            <!-- Bottom Inquiry Note -->
            <p class="inquiry-notice">
                If there are any other services that would help to manage your health, medications, or medication budget please do not hesitate to inquire with us. We want to know how we can better serve you and your health needs!
            </p>

            <a href="https://abpharmacy.ca" target="_blank" class="acp-link">Click here to go to the Alberta College of Pharmacy website to view the Patient Concerns poster</a>

            <!-- Alberta College of Pharmacy Regulatory Disclosure Box -->
            <div class="regulatory-disclosure-box">
                <div class="regulatory-header">
                    <span id="regPharmacistName" class="pharmacist-highlight"><%= SelectedLocation.PharmacistName %></span>, Practice Permit #<span id="regPermitNumber" class="permit-highlight"><%= SelectedLocation.PracticePermitNumber %></span>, <span id="regAddress"><%= SelectedLocation.Address %> <%= SelectedLocation.CityStateZip %></span>
                </div>
                <p>
                    The Licensee is required to provide, on the request of a patient, the name and practice permit number of any regulated member who provides a pharmacy service to the patient; the name and practice permit number of any regulated member who provides a pharmacy service to the patient or who engages in the practice of pharmacy with respect to a patient. <a href="https://abpharmacy.ca" target="_blank" style="color:#0c76c6; text-decoration:underline;">Patient Concerns</a>
                </p>
                <a id="regLicenseLink" href="<%= SelectedLocation.LicenseFileUrl %>" target="_blank" class="btn-blue-pill" style="display:inline-block; text-decoration:none;">Pharmacy License</a>
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
                        <li><a href="#footer-contact">Contact Us</a></li>
                        <li><a href="AboutUs.aspx">Meet the Pharmacist</a></li>
                        <li><a href="services/asthma-copd-management/">Asthma/COPD Management</a></li>
                        <li><a href="services/diabetes-management/">Diabetes Management</a></li>
                        <li><a href="services/heart-health/">Heart Health</a></li>
                        <li><a href="services/home-health-care/">Home Health Care</a></li>
                        <li><a href="services/injection-travel-health/">Injection / Travel Health</a></li>
                        <li><a href="services/medication-compounding/">Medication Compounding</a></li>
                        <li><a href="services/medication-reviews/">Medication Reviews</a></li>
                        <li><a href="services/prescriptions/">Prescriptions</a></li>
                        <li><a href="services/smoking-cessation-support/">Smoking Cessation Support</a></li>
                        <li><a href="services/weight-management/">Weight Management</a></li>
                    </ul>
                </div>

                <div class="footer-contact-col">
                    <h3 class="footer-column-title">Primecare Pharmacy</h3>
                    <ul class="contact-info-list">
                        <li>
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="contact-icon"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                            <span>5594 Windermere Blvd, Edmonton, AB T6W 2Z8</span>
                        </li>
                        <li>
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="contact-icon"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
                            <span>(780) 435-3030</span>
                        </li>
                        <li>
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="contact-icon"><path d="M18 8H6a2 2 0 0 0-2 2v7a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-7a2 2 0 0 0-2-2z"></path><path d="M6 8V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v4"></path><line x1="6" y1="12" x2="18" y2="12"></line><line x1="6" y1="15" x2="14" y2="15"></line></svg>
                            <span>(780) 435-2830</span>
                        </li>
                        <li>
                            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="contact-icon"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                            <span>primecarepharmacy5594@gmail.com</span>
                        </li>
                    </ul>

                    <div class="social-links">
                        <a href="https://facebook.com" target="_blank" class="social-icon" aria-label="Facebook">f</a>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div>&copy; <%= DateTime.Now.Year %> Primecare Pharmacy &amp; Travel Clinic. All Rights Reserved. Regulated by the Alberta College of Pharmacy (ACP).</div>
                <div style="display:flex; gap:16px; align-items:center;">
                    <a href="Default.aspx">Home</a>
                    <a href="Default.aspx#locations">Locations</a>
                    <a href="AdminLogin.aspx">Staff Portal</a>
                    <span class="social-icon" style="width:28px; height:28px; font-size:14px; cursor:pointer;" onclick="window.scrollTo({top:0, behavior:'smooth'});">↑</span>
                </div>
            </div>
        </footer>

    </form>

    <script src="js/script.js?v=2.1"></script>
</body>
</html>
