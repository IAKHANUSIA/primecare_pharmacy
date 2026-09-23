<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="DefaultPage" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0" />
    <title>Primecare Pharmacy - Windermere Plaza, Edmonton</title>
    <meta name="description"
        content="Primecare Pharmacy & Travel Clinic at Windermere Plaza, Building 3, Edmonton, AB. Prescriptions, Flu Shots, Covid-19 Vaccinations, Diabetes Management & Home Health Care." />

    <!-- Google Fonts Preconnect & Styles -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <!-- CSS Dependencies -->
    <link rel="stylesheet" href="css/style.css?v=2.3" />
    <link rel="icon" href="images/logo.svg" type="image/svg+xml" />
</head>

<body>
    <form id="form1" runat="server">

        <!-- System Notification Message Panel -->
        <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="alert"
            style="position: fixed; top: 80px; right: 20px; z-index: 3000; max-width: 450px; padding: 15px 20px; border-radius: 8px; box-shadow: 0 10px 25px rgba(0,0,0,0.15); background-color: #d1e7dd; color: #0f5132; border: 1px solid #badbcc;">
            <asp:Label ID="lblStatusMessage" runat="server" />
            <button type="button"
                onclick="document.getElementById('<%= pnlMessage.ClientID %>').style.display='none';"
                style="float: right; background: none; border: none; font-size: 16px; cursor: pointer;">&times;</button>
        </asp:Panel>

        <!-- Top 3 Edmonton Pharmacy Locations Announcement Bar -->
        <div class="edmonton-locations-bar">
            <div class="edmonton-locations-container">
                <div class="edmonton-locations-title">
                    <span class="pulse-dot"></span>
                    <strong>3 Edmonton &amp; Area Locations to Serve You:</strong>
                </div>
                <div class="edmonton-locations-list">
                    <a href="AboutUs.aspx?loc=1" class="edmonton-location-chip" title="Windermere Location">
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                        <%= PrimecarePharmacy.PharmacyConfig.Location1.ChipDisplay %>
                    </a>
                    <a href="AboutUs.aspx?loc=2" class="edmonton-location-chip" title="Leduc Location">
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                        <%= PrimecarePharmacy.PharmacyConfig.Location2.ChipDisplay %>
                    </a>
                    <a href="AboutUs.aspx?loc=3" class="edmonton-location-chip" title="St. Albert Location">
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                        <%= PrimecarePharmacy.PharmacyConfig.Location3.ChipDisplay %>
                    </a>
                </div>
            </div>
        </div>

        <!-- Modern Header Navigation Bar -->
        <header class="header-container">
            <div class="nav-wrapper">
                <a href="Default.aspx" class="brand-logo" aria-label="Primecare Pharmacy Home">
                    <img src="images/logo.svg" alt="Primecare Pharmacy - Your health is our focus" />
                </a>

                <ul class="nav-menu">
                    <li class="nav-item"><a href="Default.aspx" class="active">Home</a></li>
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

                <div class="header-cta-group">
                    <button type="button" class="btn-header-cta" onclick="openBookingModal();">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                        Book Appointment
                    </button>
                </div>

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

        <!-- Hero Section with Auto Image Slider -->
        <section class="hero-section">
            <div class="hero-slides">
                <div class="hero-slide active"
                    style="background-image: url('images/hero_pharmacist.jpg'); background-position: center top;">
                </div>
                <div class="hero-slide"
                    style="background-image: url('images/about_storefront_hero.jpg'); background-position: center center;">
                </div>
                <div class="hero-slide"
                    style="background-image: url('images/about_store_interior.jpg'); background-position: center center;">
                </div>
                <div class="hero-slide"
                    style="background-image: url('images/prescription_compounding.jpg'); background-position: center center;">
                </div>
                <div class="hero-slide"
                    style="background-image: url('images/travel_health_vials.jpg'); background-position: center center;">
                </div>
                <div class="hero-slide"
                    style="background-image: url('images/leduc_pharmacy-1.jpg'); background-position: center center;">
                </div>
                <div class="hero-slide"
                    style="background-image: url('images/diabetes_blood_test.jpg'); background-position: center center;">
                </div>
            </div>
            <div class="hero-overlay-card">
                <div class="hero-badge">
                    <span class="pulse-dot"></span>
                    Community Pharmacy &amp; Travel Clinic
                </div>
                <div class="hero-subtitle">Windermere &bull; Leduc &bull; St. Albert</div>
                <h1 class="hero-title">Your Health, Our Focus <span>Excellence in Care</span></h1>
                <p class="hero-text">
                    Dedicated independently owned Edmonton pharmacies providing expert prescriptions, certified travel vaccines, diabetes education, and city-wide free delivery.
                </p>
                <div class="hero-actions-row">
                    <button type="button" class="btn-green-pill"
                        onclick="openBookingModal('Flu Shot & Covid-19 Vaccination');">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                        Book Vaccine / Injection
                    </button>
                    <a href="RefillPrescription.aspx" class="btn-outline-pill">
                        Refill Prescription
                    </a>
                </div>
                <div class="hero-trust-badges">
                    <div class="trust-badge-item">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><rect x="1" y="3" width="15" height="13"></rect><polygon points="16 8 20 8 23 11 23 16 16 16 8"></polygon><circle cx="5.5" cy="18.5" r="2.5"></circle><circle cx="18.5" cy="18.5" r="2.5"></circle></svg>
                        Free City-Wide Delivery
                    </div>
                    <div class="trust-badge-item">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                        Certified Travel Clinic
                    </div>
                    <div class="trust-badge-item">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                        5-Star Rated Service
                    </div>
                </div>
            </div>
            <div class="hero-slider-pagination">
                <span class="hero-dot active" data-slide="0"></span>
                <span class="hero-dot" data-slide="1"></span>
                <span class="hero-dot" data-slide="2"></span>
                <span class="hero-dot" data-slide="3"></span>
                <span class="hero-dot" data-slide="4"></span>
                <span class="hero-dot" data-slide="5"></span>
                <span class="hero-dot" data-slide="6"></span>
            </div>
        </section>

        <!-- Services Section ("We are your pharmacy") -->
        <section id="services" class="services-section">
            <span class="section-tag">Our Healthcare Services</span>
            <h2 class="section-heading-blue">We Are Your Pharmacy</h2>
            <p class="section-desc">Comprehensive patient-focused medical care, compounding, and chronic disease support.</p>

            <div class="services-carousel-wrapper">
                <button type="button" class="carousel-nav-btn carousel-prev" aria-label="Previous Services">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="15 18 9 12 15 6"></polyline></svg>
                </button>

                <div class="services-grid">
                    <div class="service-card" onclick="window.location.href='services/prescriptions/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-prescriptions.svg" alt="Prescriptions" class="service-icon" />
                        </div>
                        <div class="service-title">Prescriptions</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/injection-travel-health/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-injection.svg" alt="Injection / Travel Health" class="service-icon" />
                        </div>
                        <div class="service-title">Injection &amp; Travel</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/home-health-care/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-homehealth.svg" alt="Home Health Care" class="service-icon" />
                        </div>
                        <div class="service-title">Home Health Care</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/diabetes-management/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-diabetes.svg" alt="Diabetes Management" class="service-icon" />
                        </div>
                        <div class="service-title">Diabetes Support</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/medication-reviews/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-medreviews.svg" alt="Medication Reviews" class="service-icon" />
                        </div>
                        <div class="service-title">Medication Reviews</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/smoking-cessation-support/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-smoking.svg" alt="Smoking Cessation Support" class="service-icon" />
                        </div>
                        <div class="service-title">Smoking Cessation</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/asthma-copd-management/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-asthma.svg" alt="Asthma/COPD Management" class="service-icon" />
                        </div>
                        <div class="service-title">Asthma / COPD</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/heart-health/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-heart.svg" alt="Heart Health" class="service-icon" />
                        </div>
                        <div class="service-title">Heart Health</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/weight-management/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-weight.svg" alt="Weight Management" class="service-icon" />
                        </div>
                        <div class="service-title">Weight Management</div>
                    </div>

                    <div class="service-card" onclick="window.location.href='services/medication-compounding/';">
                        <div class="service-icon-wrapper">
                            <img src="images/icon-compounding.svg" alt="Medication Compounding" class="service-icon" />
                        </div>
                        <div class="service-title">Compounding</div>
                    </div>
                </div>

                <button type="button" class="carousel-nav-btn carousel-next" aria-label="Next Services">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="9 18 15 12 9 6"></polyline></svg>
                </button>
            </div>
        </section>

        <!-- Minor Ailments Prescribing Section (Alberta APA) -->
        <section id="minor-ailments" class="minor-ailments-section">
            <div class="minor-ailments-container">
                <span class="section-tag">Alberta Pharmacist Prescribing</span>
                <h2 class="section-heading-blue">Minor Ailments Assessment &amp; Prescribing</h2>
                <p class="section-desc">
                    Skip the doctor's waiting room. Under Alberta Health regulations, our certified Additional Prescribing Authorization (APA) pharmacists can assess symptoms and prescribe treatment directly.
                </p>

                <div class="ailments-grid">
                    <div class="ailment-card">
                        <div class="ailment-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                        </div>
                        <div class="ailment-info">
                            <h4>Urinary Tract Infections</h4>
                            <p>Fast assessment &amp; treatment for uncomplicated UTIs</p>
                        </div>
                    </div>

                    <div class="ailment-card">
                        <div class="ailment-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><path d="M8 14s1.5 2 4 2 4-2 4-2"></path><line x1="9" y1="9" x2="9.01" y2="9"></line><line x1="15" y1="9" x2="15.01" y2="9"></line></svg>
                        </div>
                        <div class="ailment-info">
                            <h4>Cold Sores</h4>
                            <p>Antiviral therapy at first sign of outbreak</p>
                        </div>
                    </div>

                    <div class="ailment-card">
                        <div class="ailment-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 20A7 7 0 0 1 9.8 6.1C15.5 5 17 4.48 19 2c1 2 2 4.18 2 8 0 5.5-4.78 10-10 10Z"></path><path d="M2 21c0-3 1.85-5.36 5.08-6C9.5 14.52 12 13 13 12"></path></svg>
                        </div>
                        <div class="ailment-info">
                            <h4>Seasonal Allergies</h4>
                            <p>Prescription antihistamines &amp; nasal sprays</p>
                        </div>
                    </div>

                    <div class="ailment-card">
                        <div class="ailment-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                        </div>
                        <div class="ailment-info">
                            <h4>Skin Eczema &amp; Rashes</h4>
                            <p>Targeted topical treatments &amp; dermatitis care</p>
                        </div>
                    </div>

                    <div class="ailment-card">
                        <div class="ailment-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path></svg>
                        </div>
                        <div class="ailment-info">
                            <h4>Acid Reflux &amp; GERD</h4>
                            <p>Effective management for frequent heartburn</p>
                        </div>
                    </div>

                    <div class="ailment-card">
                        <div class="ailment-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                        </div>
                        <div class="ailment-info">
                            <h4>Shingles Treatment</h4>
                            <p>Prompt prescription antivirals &amp; pain relief</p>
                        </div>
                    </div>

                    <div class="ailment-card">
                        <div class="ailment-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-4 8"></path></svg>
                        </div>
                        <div class="ailment-info">
                            <h4>Tick Bites &amp; Lyme</h4>
                            <p>Post-exposure prophylaxis assessment</p>
                        </div>
                    </div>

                    <div class="ailment-card">
                        <div class="ailment-icon">
                            <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="9"></circle><path d="M12 8v4"></path><path d="M12 16h.01"></path></svg>
                        </div>
                        <div class="ailment-info">
                            <h4>Mild Acne &amp; Rosacea</h4>
                            <p>Clinical therapies to clear and soothe skin</p>
                        </div>
                    </div>
                </div>

                <div style="display:flex; justify-content:center; gap:14px; flex-wrap:wrap;">
                    <button type="button" class="btn-green-pill" onclick="openBookingModal('Minor Ailment Assessment');">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                        Book Ailment Assessment
                    </button>
                    <a href="tel:17804353030" class="btn-outline-pill">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
                        Call Pharmacist: (780) 435-3030
                    </a>
                </div>
            </div>
        </section>

        <!-- Vaccination Booking Banner -->
        <section class="vaccine-banner">
            <div class="vaccine-banner-content">
                <span class="banner-badge">Seasonal &amp; Travel Immunization</span>
                <h2 class="vaccine-banner-title">Book Your Flu Shot &amp; Covid-19 Vaccination</h2>
                <p class="vaccine-banner-desc">Fast, professional, and administered by certified licensed pharmacists. Appointments and walk-ins welcome.</p>
                <button type="button" class="btn-white-pill"
                    onclick="openBookingModal('Flu Shot & Covid-19 Vaccination');">Book Your Shot Now</button>
            </div>
        </section>

        <!-- About Us Section -->
        <section id="about-us" class="about-section">
            <div class="about-grid">
                <div class="about-text-content">
                    <div class="about-subtitle">ABOUT US</div>
                    <h2 class="about-title">Primecare Pharmacy</h2>
                    <p class="about-text">
                        Primecare Pharmacy opened in January 2018 at Windermere Plaza, Building 3. We are proud to serve our community across Edmonton as independently owned community pharmacies, focusing on personalized customer service, medication safety, and patient health education.
                    </p>
                    <div class="about-highlights-list">
                        <div class="about-highlight-item">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            <span>City-Wide Free Delivery</span>
                        </div>
                        <div class="about-highlight-item">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            <span>Direct Insurance Billing</span>
                        </div>
                        <div class="about-highlight-item">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            <span>Certified Travel Clinic</span>
                        </div>
                        <div class="about-highlight-item">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="20 6 9 17 4 12"></polyline></svg>
                            <span>Compliance Blister Packs</span>
                        </div>
                    </div>
                    <a href="AboutUs.aspx" class="btn-green-pill">Read More About Us</a>
                </div>

                <div class="about-image-wrapper">
                    <img src="images/about_thermometer.jpg" alt="Clinical thermometer over pills and tablets" />
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section id="testimonials" class="testimonials-section">
            <span class="section-tag">Patient Reviews</span>
            <h2 class="section-heading-blue">What Our Patients Say</h2>
            <p class="section-desc">Real stories from the Edmonton community we proudly care for every day.</p>

            <div class="testimonials-grid">
                <div class="testimonial-card">
                    <div>
                        <div class="testimonial-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                        <p class="testimonial-quote">
                            &ldquo;Very nice place. The pharmacist there is very knowledgeable and is very quick. I would
                            definitely choose this pharmacy over any other pharmacy. They even offered me home
                            delivery as per my schedule. Thanks again.&rdquo;
                        </p>
                    </div>
                    <div class="testimonial-author-row">
                        <div class="testimonial-avatar">AG</div>
                        <div>
                            <div class="testimonial-author-name">Akhtarhusain G.</div>
                            <div class="testimonial-author-tag">Verified Edmonton Patient</div>
                        </div>
                    </div>
                </div>

                <div class="testimonial-card">
                    <div>
                        <div class="testimonial-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                        <p class="testimonial-quote">
                            &ldquo;I would highly recommend this pharmacy. Knowledgeable pharmacists, friendly service, and
                            home delivery available. An added bonus, supporting local business. Try them out!&rdquo;
                        </p>
                    </div>
                    <div class="testimonial-author-row">
                        <div class="testimonial-avatar">AM</div>
                        <div>
                            <div class="testimonial-author-name">Abid M.</div>
                            <div class="testimonial-author-tag">Verified Edmonton Patient</div>
                        </div>
                    </div>
                </div>
            </div>

            <a href="Testimonials.aspx" class="btn-white-pill">View All Testimonials</a>
        </section>

        <!-- Travel Health Banner Callout -->
        <section class="travel-health-banner">
            <div class="travel-health-card">
                <div class="travel-banner-text">
                    <span class="section-tag">Travel Medicine</span>
                    <h2>Book Your Injection &amp; Travel Health Consultation</h2>
                    <p>Going abroad? Consult our certified pharmacists for destination-specific travel vaccinations, malaria prevention, and immunization records.</p>
                    <button type="button" class="btn-green-pill"
                        onclick="openBookingModal('Injection / Travel Health');">Schedule Consultation</button>
                </div>
                <img src="images/travel_health_vials.jpg" alt="Vaccine Vials and Syringe" class="travel-banner-img" />
            </div>
        </section>

        <!-- Prescription Transfer 3-Step Process Section -->
        <section id="transfer" class="transfer-steps-section">
            <div class="transfer-steps-container">
                <span class="section-tag">Hassle-Free Switch</span>
                <h2 class="section-heading-blue">Switching to Primecare is Simple</h2>
                <p class="section-desc">Transferring your prescriptions from another pharmacy takes less than 2 minutes. We take care of all the paperwork and phone calls with your previous pharmacy.</p>

                <div class="steps-grid">
                    <div class="step-card">
                        <div class="step-number">1</div>
                        <h3 class="step-title">Provide Your Details</h3>
                        <p class="step-desc">Tell us your name, contact info, and current pharmacy name or prescription numbers.</p>
                    </div>

                    <div class="step-card">
                        <div class="step-number">2</div>
                        <h3 class="step-title">We Contact Your Pharmacy</h3>
                        <p class="step-desc">Our licensed pharmacists securely contact your previous pharmacy to transfer your files and remaining refills.</p>
                    </div>

                    <div class="step-card">
                        <div class="step-number">3</div>
                        <h3 class="step-title">Pick Up or Free Delivery</h3>
                        <p class="step-desc">Your medications are prepared with direct billing to your insurance, ready for pickup or free city-wide home delivery.</p>
                    </div>
                </div>

                <div style="display:flex; justify-content:center; gap:14px; flex-wrap:wrap;">
                    <button type="button" class="btn-green-pill" onclick="openPrescriptionModal();">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
                        Start Transfer Online
                    </button>
                    <a href="RefillPrescription.aspx" class="btn-outline-pill">
                        Refill Existing Prescription
                    </a>
                </div>
            </div>
        </section>

        <!-- Canadian Direct Insurance Billing Section -->
        <section class="insurance-billing-section">
            <div class="insurance-container">
                <span class="section-tag">Direct Insurance Billing</span>
                <h2 class="section-heading-blue">We Bill Directly to Major Canadian Insurers</h2>
                <p class="section-desc">Zero out-of-pocket hassle. We direct-bill all major private insurance plans, provincial healthcare programs, and employer benefit providers across Canada.</p>

                <div class="insurance-badges-grid">
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> Alberta Blue Cross
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> Sun Life Financial
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> Canada Life (Great-West)
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> Manulife Financial
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> Green Shield Canada
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> Medavie Blue Cross
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> NIHB (Non-Insured Health)
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> Alberta Seniors &amp; AISH
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> WCB Alberta
                    </div>
                    <div class="insurance-pill-badge">
                        <span class="insurance-dot"></span> ClaimSecure
                    </div>
                </div>
            </div>
        </section>

        <!-- 3 Edmonton Pharmacy Locations Section -->
        <section class="edmonton-locations-section" id="locations">
            <div style="max-width:1280px; margin:0 auto; text-align:center; margin-bottom:28px;">
                <span class="section-tag">Convenient Care</span>
                <h2 class="section-heading-blue" style="margin-bottom:8px;">Our 3 Edmonton &amp; Area Pharmacy Locations</h2>
                <p style="color:#64748b; font-size:15.5px;">Visit any of our 3 conveniently located Alberta pharmacies for personal, expert care.</p>
            </div>
                <div class="edmonton-locations-grid">
                    <div class="edmonton-location-card">
                        <div>
                            <span class="edmonton-location-badge">Location 1 - Primary</span>
                            <div class="edmonton-location-name">
                                <%= PrimecarePharmacy.PharmacyConfig.Location1.Name %>
                            </div>
                            <div class="edmonton-location-address">
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#0e75c5"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                        <circle cx="12" cy="10" r="3"></circle>
                                    </svg>
                                    <span class="info-text location-street">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location1.Address %>
                                    </span>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#64748b"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path d="M3 21h18"></path>
                                        <path d="M5 21V7l8-4v18"></path>
                                        <path d="M19 21V11l-6-3"></path>
                                        <path d="M9 9v.01"></path>
                                        <path d="M9 12v.01"></path>
                                        <path d="M9 15v.01"></path>
                                        <path d="M9 18v.01"></path>
                                    </svg>
                                    <span class="info-text location-city">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location1.CityStateZip %>
                                    </span>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#1ea84c"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z">
                                        </path>
                                    </svg>
                                    <a href="tel:<%= PrimecarePharmacy.PharmacyConfig.Location1.RawPhone %>"
                                        class="info-text location-phone">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location1.Phone %>
                                    </a>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#64748b"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M18 8H6a2 2 0 0 0-2 2v7a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-7a2 2 0 0 0-2-2z">
                                        </path>
                                        <path d="M6 8V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v4"></path>
                                        <line x1="6" y1="12" x2="18" y2="12"></line>
                                        <line x1="6" y1="15" x2="14" y2="15"></line>
                                    </svg>
                                    <a href="fax:<%= PrimecarePharmacy.PharmacyConfig.Location1.Fax %>"
                                        class="info-text location-fax">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location1.Fax %>
                                    </a>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#0e75c5"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                                        </path>
                                        <polyline points="22,6 12,13 2,6"></polyline>
                                    </svg>
                                    <a href="mailto:<%= PrimecarePharmacy.PharmacyConfig.Location1.Email %>"
                                        class="info-text location-email">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location1.Email %>
                                    </a>
                                </div>
                            </div>
                            <div class="edmonton-location-hours">
                                <strong>Hours:</strong>
                                <span class="hours-value">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location1.HoursWeekdays %>
                                </span><br />
                                <span class="hours-value">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location1.HoursSaturday %>
                                </span><br />
                                <span class="hours-value hours-closed">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location1.HoursSunday %>
                                </span>
                            </div>
                            <div
                                style="font-size:12.5px; color:#475569; margin-top:8px; padding-top:8px; border-top:1px solid #f1f5f9;">
                                <strong class="label-blue">Pharmacist / Licensee:</strong> <span
                                    class="pharmacist-highlight">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location1.PharmacistName %>
                                </span><br />
                                <strong>Proprietor:</strong>
                                <%= PrimecarePharmacy.PharmacyConfig.Location1.ProprietorName %><br />
                                    <strong class="label-blue">Permit #:</strong> <span class="permit-highlight">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location1.PracticePermitNumber %>
                                    </span>
                            </div>
                        </div>
                        <div class="edmonton-location-actions"
                            style="margin-top:14px; display:flex; gap:8px; flex-wrap:wrap;">
                            <a href="tel:<%= PrimecarePharmacy.PharmacyConfig.Location1.RawPhone %>"
                                class="btn-location-phone">Call Store</a>
                            <a href="<%= PrimecarePharmacy.PharmacyConfig.Location1.GoogleMapUrl %>" target="_blank"
                                class="btn-white-pill" style="padding: 7px 12px; font-size: 13px;">View Map</a>
                            <a href="<%= PrimecarePharmacy.PharmacyConfig.Location1.LicenseFileUrl %>" target="_blank"
                                class="btn-green-pill" style="padding: 7px 12px; font-size: 13px;">Pharmacy License</a>
                        </div>
                    </div>

                    <div class="edmonton-location-card">
                        <div>
                            <span class="edmonton-location-badge">Location 2 - Central</span>
                            <div class="edmonton-location-name">
                                <%= PrimecarePharmacy.PharmacyConfig.Location2.Name %>
                            </div>
                            <div class="edmonton-location-address">
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#0e75c5"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                        <circle cx="12" cy="10" r="3"></circle>
                                    </svg>
                                    <span class="info-text location-street">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location2.Address %>
                                    </span>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#64748b"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path d="M3 21h18"></path>
                                        <path d="M5 21V7l8-4v18"></path>
                                        <path d="M19 21V11l-6-3"></path>
                                        <path d="M9 9v.01"></path>
                                        <path d="M9 12v.01"></path>
                                        <path d="M9 15v.01"></path>
                                        <path d="M9 18v.01"></path>
                                    </svg>
                                    <span class="info-text location-city">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location2.CityStateZip %>
                                    </span>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#1ea84c"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z">
                                        </path>
                                    </svg>
                                    <a href="tel:<%= PrimecarePharmacy.PharmacyConfig.Location2.RawPhone %>"
                                        class="info-text location-phone">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location2.Phone %>
                                    </a>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#64748b"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M18 8H6a2 2 0 0 0-2 2v7a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-7a2 2 0 0 0-2-2z">
                                        </path>
                                        <path d="M6 8V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v4"></path>
                                        <line x1="6" y1="12" x2="18" y2="12"></line>
                                        <line x1="6" y1="15" x2="14" y2="15"></line>
                                    </svg>
                                    <a href="fax:<%= PrimecarePharmacy.PharmacyConfig.Location2.Fax %>"
                                        class="info-text location-fax">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location2.Fax %>
                                    </a>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#0e75c5"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                                        </path>
                                        <polyline points="22,6 12,13 2,6"></polyline>
                                    </svg>
                                    <a href="mailto:<%= PrimecarePharmacy.PharmacyConfig.Location2.Email %>"
                                        class="info-text location-email">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location2.Email %>
                                    </a>
                                </div>
                            </div>
                            <div class="edmonton-location-hours">
                                <strong>Hours:</strong>
                                <span class="hours-value">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location2.HoursWeekdays %>
                                </span><br />
                                <span class="hours-value">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location2.HoursSaturday %>
                                </span><br />
                                <span class="hours-value hours-closed">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location2.HoursSunday %>
                                </span>
                            </div>
                            <div
                                style="font-size:12.5px; color:#475569; margin-top:8px; padding-top:8px; border-top:1px solid #f1f5f9;">
                                <strong class="label-blue">Pharmacist / Licensee:</strong> <span
                                    class="pharmacist-highlight">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location2.PharmacistName %>
                                </span><br />
                                <strong>Proprietor:</strong>
                                <%= PrimecarePharmacy.PharmacyConfig.Location2.ProprietorName %><br />
                                    <strong class="label-blue">Permit #:</strong> <span class="permit-highlight">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location2.PracticePermitNumber %>
                                    </span>
                            </div>
                        </div>
                        <div class="edmonton-location-actions"
                            style="margin-top:14px; display:flex; gap:8px; flex-wrap:wrap;">
                            <a href="tel:<%= PrimecarePharmacy.PharmacyConfig.Location2.RawPhone %>"
                                class="btn-location-phone">Call Store</a>
                            <a href="<%= PrimecarePharmacy.PharmacyConfig.Location2.GoogleMapUrl %>" target="_blank"
                                class="btn-white-pill" style="padding: 7px 12px; font-size: 13px;">View Map</a>
                            <a href="<%= PrimecarePharmacy.PharmacyConfig.Location2.LicenseFileUrl %>" target="_blank"
                                class="btn-green-pill" style="padding: 7px 12px; font-size: 13px;">Pharmacy License</a>
                        </div>
                    </div>

                    <div class="edmonton-location-card">
                        <div>
                            <span class="edmonton-location-badge">Location 3 - West</span>
                            <div class="edmonton-location-name">
                                <%= PrimecarePharmacy.PharmacyConfig.Location3.Name %>
                            </div>
                            <div class="edmonton-location-address">
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#0e75c5"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                        <circle cx="12" cy="10" r="3"></circle>
                                    </svg>
                                    <span class="info-text location-street">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location3.Address %>
                                    </span>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#64748b"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path d="M3 21h18"></path>
                                        <path d="M5 21V7l8-4v18"></path>
                                        <path d="M19 21V11l-6-3"></path>
                                        <path d="M9 9v.01"></path>
                                        <path d="M9 12v.01"></path>
                                        <path d="M9 15v.01"></path>
                                        <path d="M9 18v.01"></path>
                                    </svg>
                                    <span class="info-text location-city">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location3.CityStateZip %>
                                    </span>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#1ea84c"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z">
                                        </path>
                                    </svg>
                                    <a href="tel:<%= PrimecarePharmacy.PharmacyConfig.Location3.RawPhone %>"
                                        class="info-text location-phone">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location3.Phone %>
                                    </a>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#64748b"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M18 8H6a2 2 0 0 0-2 2v7a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-7a2 2 0 0 0-2-2z">
                                        </path>
                                        <path d="M6 8V4a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v4"></path>
                                        <line x1="6" y1="12" x2="18" y2="12"></line>
                                        <line x1="6" y1="15" x2="14" y2="15"></line>
                                    </svg>
                                    <a href="fax:<%= PrimecarePharmacy.PharmacyConfig.Location3.Fax %>"
                                        class="info-text location-fax">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location3.Fax %>
                                    </a>
                                </div>
                                <div class="location-info-item">
                                    <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#0e75c5"
                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                        style="margin-top: 3px; flex-shrink: 0;">
                                        <path
                                            d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z">
                                        </path>
                                        <polyline points="22,6 12,13 2,6"></polyline>
                                    </svg>
                                    <a href="mailto:<%= PrimecarePharmacy.PharmacyConfig.Location3.Email %>"
                                        class="info-text location-email">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location3.Email %>
                                    </a>
                                </div>
                            </div>
                            <div class="edmonton-location-hours">
                                <strong>Hours:</strong>
                                <span class="hours-value">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location3.HoursWeekdays %>
                                </span><br />
                                <span class="hours-value">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location3.HoursSaturday %>
                                </span><br />
                                <span class="hours-value hours-closed">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location3.HoursSunday %>
                                </span>
                            </div>
                            <div
                                style="font-size:12.5px; color:#475569; margin-top:8px; padding-top:8px; border-top:1px solid #f1f5f9;">
                                <strong class="label-blue">Pharmacist / Licensee:</strong> <span
                                    class="pharmacist-highlight">
                                    <%= PrimecarePharmacy.PharmacyConfig.Location3.PharmacistName %>
                                </span><br />
                                <strong>Proprietor:</strong>
                                <%= PrimecarePharmacy.PharmacyConfig.Location3.ProprietorName %><br />
                                    <strong class="label-blue">Permit #:</strong> <span class="permit-highlight">
                                        <%= PrimecarePharmacy.PharmacyConfig.Location3.PracticePermitNumber %>
                                    </span>
                            </div>
                        </div>
                        <div class="edmonton-location-actions"
                            style="margin-top:14px; display:flex; gap:8px; flex-wrap:wrap;">
                            <a href="tel:<%= PrimecarePharmacy.PharmacyConfig.Location3.RawPhone %>"
                                class="btn-location-phone">Call Store</a>
                            <a href="<%= PrimecarePharmacy.PharmacyConfig.Location3.GoogleMapUrl %>" target="_blank"
                                class="btn-white-pill" style="padding: 7px 12px; font-size: 13px;">View Map</a>
                            <a href="<%= PrimecarePharmacy.PharmacyConfig.Location3.LicenseFileUrl %>" target="_blank"
                                class="btn-green-pill" style="padding: 7px 12px; font-size: 13px;">Pharmacy License</a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Community Harm Reduction: Free Naloxone Kits -->
            <div style="padding: 0 20px;">
                <div class="naloxone-card">
                    <div class="naloxone-info">
                        <div class="naloxone-icon">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><path d="M22 12h-4l-3 9L9 3l-3 9H2"></path></svg>
                        </div>
                        <div>
                            <h4>Free Naloxone Kits Available (Alberta Harm Reduction)</h4>
                            <p>Free injectable and nasal Narcan / Naloxone kits are available in-store for all Alberta residents. Confidential, no prescription required, with certified pharmacist training included.</p>
                        </div>
                    </div>
                    <a href="tel:17804353030" class="btn-location-phone" style="flex-shrink:0; background-color:#dc2626; box-shadow:0 2px 8px rgba(220,38,38,0.3);">
                        Inquire in Store
                    </a>
                </div>
            </div>

            <!-- Footer -->
            <footer id="footer-contact" class="footer">
                <div class="footer-container">
                    <!-- Column 1: Brand & Slogan -->
                    <div class="footer-brand-col">
                        <div class="footer-logo">
                            <img src="images/logo.svg" alt="Primecare Pharmacy" />
                        </div>
                        <p class="footer-about-text">
                            Independently owned pharmacy serving Windermere, Leduc, St. Albert &amp; Edmonton with medication safety, prescriptions, and healthcare excellence.
                        </p>
                    </div>

                    <!-- Column 2: Quick Links Grid -->
                    <div class="footer-links-col">
                        <h3 class="footer-column-title">Quick Links</h3>
                        <ul class="quick-links-grid">
                            <li><a href="Default.aspx">Home</a></li>
                            <li><a href="#minor-ailments">Minor Ailments Prescribing</a></li>
                            <li><a href="RefillPrescription.aspx">Refill Prescription</a></li>
                            <li><a href="#transfer">Transfer Prescription</a></li>
                            <li><a href="#locations">Store Locations</a></li>
                            <li><a href="AboutUs.aspx">About Us</a></li>
                            <li><a href="#testimonials">Testimonials</a></li>
                            <li><a href="#footer-contact">Contact Us</a></li>
                            <li><a href="services/injection-travel-health/">Injection / Travel Health</a></li>
                            <li><a href="services/diabetes-management/">Diabetes Management</a></li>
                            <li><a href="services/medication-reviews/">Medication Reviews</a></li>
                            <li><a href="services/medication-compounding/">Medication Compounding</a></li>
                            <li><a href="services/home-health-care/">Home Health Care</a></li>
                            <li><a href="services/asthma-copd-management/">Asthma / COPD</a></li>
                        </ul>
                    </div>

                    <!-- Column 3: Social Links & Contact -->
                    <div class="footer-contact-col">
                        <h3 class="footer-column-title">Connect With Us</h3>
                        <p style="font-size:13.5px; color:#94a3b8; line-height:1.5; margin-bottom:12px;">
                            Questions? Call our primary Windermere clinic at <strong style="color:#ffffff;">(780) 435-3030</strong> or email <strong style="color:#ffffff;">primecarepharmacy5594@gmail.com</strong>.
                        </p>
                        <div class="social-links" style="margin-top:0;">
                            <a href="https://facebook.com" target="_blank" class="social-icon"
                                aria-label="Facebook">f</a>
                        </div>
                    </div>
                </div>

                <div class="footer-bottom">
                    <div>&copy; <%= DateTime.Now.Year %> Primecare Pharmacy &amp; Travel Clinic. All Rights Reserved. Regulated by the Alberta College of Pharmacy (ACP).</div>
                    <div style="display:flex; gap:16px; align-items:center;">
                        <a href="AboutUs.aspx">About Us</a>
                        <a href="#locations">Locations</a>
                        <a href="AdminLogin.aspx">Staff Portal</a>
                    </div>
                </div>

                <!-- Modal 1: Vaccination / Service Booking Form -->
                <div id="bookingModal" class="modal-overlay">
                    <div class="modal-box">
                        <button type="button" class="modal-close-btn" onclick="closeBookingModal();">&times;</button>
                        <h3 class="modal-title">Book an Appointment</h3>
                        <p class="modal-desc">Schedule your appointment with our pharmacist</p>

                        <div class="form-grid-2col">
                            <div class="form-group">
                                <label class="form-label">Full Name *</label>
                                <asp:TextBox ID="txtBookingName" runat="server" CssClass="form-control"
                                    placeholder="e.g. Sarah Jenkins"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Phone Number *</label>
                                <asp:TextBox ID="txtBookingPhone" runat="server" CssClass="form-control"
                                    placeholder="(780) 000-0000"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Email Address</label>
                                <asp:TextBox ID="txtBookingEmail" runat="server" TextMode="Email"
                                    CssClass="form-control" placeholder="sarah@example.com"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Select Service *</label>
                                <asp:DropDownList ID="ddlServiceType" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="Flu Shot & Covid-19 Vaccination">Flu Shot &amp; Covid-19 Vaccination</asp:ListItem>
                                    <asp:ListItem Value="Minor Ailments Assessment">Minor Ailments Assessment (Alberta APA)</asp:ListItem>
                                    <asp:ListItem Value="Prescription Transfer">Prescription Transfer</asp:ListItem>
                                    <asp:ListItem Value="Injection / Travel Health">Injection / Travel Health</asp:ListItem>
                                    <asp:ListItem Value="Home Health Care">Home Health Care</asp:ListItem>
                                    <asp:ListItem Value="Diabetes Management">Diabetes Management</asp:ListItem>
                                    <asp:ListItem Value="Medication Reviews">Medication Reviews</asp:ListItem>
                                    <asp:ListItem Value="Medication Compounding">Medication Compounding</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Preferred Date</label>
                                <asp:TextBox ID="txtBookingDate" runat="server" TextMode="Date" CssClass="form-control">
                                </asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Additional Notes</label>
                                <asp:TextBox ID="txtBookingNotes" runat="server" TextMode="MultiLine" Rows="1"
                                    CssClass="form-control" placeholder="Any specific requirements..."></asp:TextBox>
                            </div>
                        </div>

                        <asp:Button ID="btnSubmitBooking" runat="server" Text="Submit Booking"
                            OnClick="btnSubmitBooking_Click" CssClass="btn-green-pill"
                            Style="width: 100%; border-radius: 8px; margin-top: 8px;" />
                    </div>
                </div>

                <!-- Modal 2: Prescription Refill / Transfer Form -->
                <div id="prescriptionModal" class="modal-overlay">
                    <div class="modal-box">
                        <button type="button" class="modal-close-btn"
                            onclick="closePrescriptionModal();">&times;</button>
                        <h3 class="modal-title">Fill / Transfer Prescription</h3>
                        <p class="modal-desc">Fast, confidential prescription refills and transfers.</p>

                        <div class="form-group">
                            <label class="form-label">Full Name *</label>
                            <asp:TextBox ID="txtRxName" runat="server" CssClass="form-control"
                                placeholder="Full Patient Name"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Phone Number *</label>
                            <asp:TextBox ID="txtRxPhone" runat="server" CssClass="form-control"
                                placeholder="Phone Number">
                            </asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Email Address</label>
                            <asp:TextBox ID="txtRxEmail" runat="server" TextMode="Email" CssClass="form-control">
                            </asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Prescription Number / Current Pharmacy</label>
                            <asp:TextBox ID="txtRxNumber" runat="server" CssClass="form-control"
                                placeholder="e.g. Rx #123456 or Name of previous pharmacy"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Notes / Medication List</label>
                            <asp:TextBox ID="txtRxNotes" runat="server" TextMode="MultiLine" Rows="3"
                                CssClass="form-control" placeholder="List medications to refill or transfer details...">
                            </asp:TextBox>
                        </div>

                        <asp:Button ID="btnSubmitPrescription" runat="server" Text="Submit Prescription Request"
                            OnClick="btnSubmitPrescription_Click" CssClass="btn-green-pill"
                            style="width: 100%; border-radius: 8px;" />
                    </div>
                </div>

<%--                <!-- Modal 3: Contact Form -->
                <div id="contactModal" class="modal-overlay">
                  <div class="modal-box">
                        <button type="button" class="modal-close-btn" onclick="closeContactModal();">&times;</button>
                        <h3 class="modal-title">Contact Primecare Pharmacy</h3>
                        <p class="modal-desc">5594 Windermere Blvd, Edmonton, AB T6W 2Z8 | (780) 435-3030</p>
                        <p style="font-size: 14px; color: #555; margin-bottom: 20px;">
                            Have a question for our licensed pharmacists? Give us a call at <strong>(780)
                                435-3030</strong>
                            or send an email to <strong>primecarepharmacy5594@gmail.com</strong>.
                        </p>
                        <button type="button" class="btn-green-pill" style="width:100%; border-radius:8px;"
                            onclick="closeContactModal();">Close</button>
                    </div>
                </div>--%>

                <!-- Floating Action Buttons -->
                <div class="floating-widgets">
                    <a href="https://wa.me/17804353030" target="_blank" class="whatsapp-float-btn"
                        title="Chat on WhatsApp">
                        <svg width="28" height="28" viewBox="0 0 24 24" fill="currentColor">
                            <path
                                d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.891 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.481 5.236 3.48 8.414-.003 6.557-5.338 11.892-11.893 11.892-1.99-.001-3.951-.5-5.688-1.448l-6.305 1.654zm6.597-3.807c1.676.995 3.276 1.591 5.392 1.592 5.448 0 9.886-4.434 9.889-9.885.002-5.462-4.415-9.89-9.881-9.892-5.452 0-9.887 4.434-9.889 9.884-.001 2.225.651 3.891 1.746 5.634l-.999 3.648 3.742-.981z" />
                        </svg>
                    </a>
                </div>

        </form>

        <script src="js/script.js?v=2.3"></script>
    </body>

    </html>