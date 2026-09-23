<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Services_MedicationCompoundingPage" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medication Compounding - Primecare Pharmacy Windermere Edmonton</title>
    <meta name="description"
        content="Custom Pharmaceutical Compounding Services at Primecare Pharmacy Windermere Plaza, Edmonton. Specialized dosage strengths, allergy-free formulations, and NAPRA approved ingredients." />

        <!-- Google Fonts Preconnect & Styles -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />

    <!-- CSS Dependencies -->
    <link rel="stylesheet" href="../../css/style.css?v=2.3" />
    <link rel="icon" href="../../images/logo.svg" type="image/svg+xml" />
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
                    <a href="../../AboutUs.aspx?loc=1" class="edmonton-location-chip" title="Windermere Location">
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                        <%= PrimecarePharmacy.PharmacyConfig.Location1.ChipDisplay %>
                    </a>
                    <a href="../../AboutUs.aspx?loc=2" class="edmonton-location-chip" title="Leduc Location">
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                        <%= PrimecarePharmacy.PharmacyConfig.Location2.ChipDisplay %>
                    </a>
                    <a href="../../AboutUs.aspx?loc=3" class="edmonton-location-chip" title="St. Albert Location">
                        <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                        <%= PrimecarePharmacy.PharmacyConfig.Location3.ChipDisplay %>
                    </a>
                </div>
            </div>
        </div>

        <!-- Modern Header Navigation Bar -->
        <header class="header-container">
            <div class="nav-wrapper">
                <a href="../../Default.aspx" class="brand-logo" aria-label="Primecare Pharmacy Home">
                    <img src="../../images/logo.svg" alt="Primecare Pharmacy - Your health is our focus" />
                </a>

                <ul class="nav-menu">
                    <li class="nav-item"><a href="../../Default.aspx">Home</a></li>
                    <li class="nav-item"><a href="../../AboutUs.aspx">About Us</a></li>
                    <li class="nav-item dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle active" role="button" aria-haspopup="true" aria-expanded="false">Services</a>
                        <ul class="dropdown-menu">
                            <li><a href="../../Default.aspx#services" style="font-weight:700; color:var(--teal);">All Services Overview &rarr;</a></li>
                            <li><a href="../../Default.aspx#minor-ailments" style="font-weight:700; color:var(--primary);">Minor Ailments Prescribing</a></li>
                            <li><a href="../prescriptions/">Prescriptions</a></li>
                            <li><a href="../injection-travel-health/">Injection / Travel Health</a></li>
                            <li><a href="../diabetes-management/">Diabetes Management</a></li>
                            <li><a href="../home-health-care/">Home Health Care</a></li>
                            <li><a href="../medication-reviews/">Medication Reviews</a></li>
                            <li><a href="../smoking-cessation-support/">Smoking Cessation</a></li>
                            <li><a href="../asthma-copd-management/">Asthma / COPD</a></li>
                            <li><a href="../heart-health/">Heart Health</a></li>
                            <li><a href="../weight-management/">Weight Management</a></li>
                            <li><a href="../medication-compounding/">Medication Compounding</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="../../Default.aspx#minor-ailments">Minor Ailments</a></li>
                    <li class="nav-item dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle" role="button" aria-haspopup="true" aria-expanded="false">Refill &amp; Transfer Rx</a>
                        <ul class="dropdown-menu">
                            <li><a href="../../RefillPrescription.aspx">Refill Prescription</a></li>
                            <li><a href="../../Default.aspx#transfer">Transfer Prescription (3-Step Guide)</a></li>
                            <li><a href="../../NewPrescription.aspx">New Prescription</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a href="../../Testimonials.aspx">Testimonials</a></li>
                    <li class="nav-item"><a href="../../Default.aspx#locations">Locations</a></li>
                    <li class="nav-item"><a href="../../Default.aspx#footer-contact">Contact Us</a></li>
                </ul>

                <div class="header-cta-group">
                    <button type="button" class="btn-header-cta" onclick="openBookingModal();">
                        <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                        Book Appointment
                    </button>
                </div>

                <button type="button" class="mobile-toggle" aria-label="Toggle Navigation Menu">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="3" y1="12" x2="21" y2="12"></line>
                        <line x1="3" y1="6" x2="21" y2="6"></line>
                        <line x1="3" y1="18" x2="21" y2="18"></line>
                    </svg>
                </button>
            </div>
        </header>

        <!-- Service Hero Banner -->
        <section class="service-hero-section" style="background: linear-gradient(135deg, rgba(15, 23, 42, 0.45) 0%, rgba(22, 101, 52, 0.40) 100%), url('../../images/medication_compounding.jpg') center center / cover no-repeat;">
            <div class="service-hero-breadcrumb">Services / Medication Compounding</div>
            <h1 class="service-hero-title">Medication Compounding</h1>
        </section>

        <!-- Main Content Section -->
        <main class="service-detail-section">
            <div class="service-detail-grid">
                <div class="service-left-col">
                    <p class="service-lead-text">
                        Compounding is often required for medical reasons; some patients require a particular non-essential ingredient to be removed from their medication to prevent an allergic reaction. Others require compounded medication to acquire an exact dosage amount that is unique to their own personal needs and which may not be available in the available marketed drugs.
                    </p>

                    <div class="service-callout-box">
                        Use the right kind of medication to treat your illness without any risks of side effects, allergies, or delayed cure with medication compounding.
                    </div>
                </div>

                <div class="service-right-col">
                    <img src="../../images/medication_compounding.jpg" alt="Pharmacists compounding specialized medications under microscope" class="service-detail-img" />
                </div>
            </div>

            <div class="service-content-body">
                <p>
                    Compounding is the process of creating unique medicines that suit you individually. It is meticulous, where we test the active ingredients, measure them precisely, and mix them the right way to produce effective compound medicines. Our compound medicines are suitable for you if you can't find your medication anywhere or if you have medication intolerances, suffer gastrointestinal side effects or allergic reactions.
                </p>
                <p>
                    Pharmaceutical compounding is also used to change the taste and colour of medications, to make it more palatable and aesthetically appealing to patients. We advocate for, promote, and preserve the historical art of compounding, consistent with professional standards of practice. We are here to offer the specialized pharmaceutical care that you deserve.
                </p>
                <p>
                    Primecare Pharmacy uses the best equipment and high-quality ingredients to make medications for you at the best prices. Our main goal is to keep patients comfortable. We care for you and offer the most comprehensive services for the best support you need for consuming or finding the right medications.
                </p>
            </div>

            <!-- Service Checklist Grid -->
            <div class="service-checklist-card">
                <div class="service-checklist-title">You can expect the following things from our medication compounding services:</div>
                <div class="service-checklist-grid">
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Compounding medication for specific, unique dosage strengths</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Difficult flavours or formats of medications</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Medications excluding ingredients that cause sensitivities or allergic reactions</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Medications with alternative routes of administration</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Comprehensive consultation with experts before developing compounding medications</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>NAPRA approved ingredients</span>
                    </div>
                    <div class="service-checklist-item" style="grid-column: span 2;">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Delivery of compound medications within 48 hours in most cases</span>
                    </div>
                </div>
            </div>

            <!-- Bottom Callout & CTA Banner -->
            <div class="service-cta-banner">
                <h2 class="service-cta-title">Don't rely on luck when consuming medications. Let us help you use the right medicines that suit you.</h2>
                <p class="service-cta-desc">
                    Compound medications that we develop are safe and have no side effects. We only use certified ingredients approved by the National Association of Pharmacy Regulatory Authorities (NAPRA) for our medications. Give us a call now to know more.
                </p>
                <button type="button" class="btn-green-pill" onclick="openBookingModal('Medication Compounding');">Inquire About Compounding</button>
            </div>
        </main>

        <!-- Footer -->
        <footer id="footer-contact" class="footer">
            <div class="footer-container">
                <div class="footer-brand-col">
                    <div class="footer-logo">
                        <img src="../../images/logo.svg" alt="Primecare Pharmacy" />
                    </div>
                    <p class="footer-about-text">
                        Independently owned pharmacy serving Windermere & Edmonton with medication safety, prescriptions, and healthcare excellence.
                    </p>
                </div>

                <div class="footer-links-col">
                    <h3 class="footer-column-title">Quick Links</h3>
                    <ul class="quick-links-grid">
                        <li><a href="../../Default.aspx">Home</a></li>
                        <li><a href="../../Testimonials.aspx">Testimonials</a></li>
                        <li><a href="../../Default.aspx#footer-contact">Contact Us</a></li>
                        <li><a href="../../AboutUs.aspx">Meet the Pharmacist</a></li>
                        <li><a href="../asthma-copd-management/">Asthma/COPD Management</a></li>
                        <li><a href="../diabetes-management/">Diabetes Management</a></li>
                        <li><a href="../heart-health/">Heart Health</a></li>
                        <li><a href="../home-health-care/">Home Health Care</a></li>
                        <li><a href="../injection-travel-health/">Injection / Travel Health</a></li>
                        <li><a href="Default.aspx">Medication Compounding</a></li>
                        <li><a href="../medication-reviews/">Medication Reviews</a></li>
                        <li><a href="../prescriptions/">Prescriptions</a></li>
                        <li><a href="../smoking-cessation-support/">Smoking Cessation Support</a></li>
                        <li><a href="../weight-management/">Weight Management</a></li>
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
                <div class="social-icon" style="width:28px; height:28px; font-size:14px; cursor:pointer;" onclick="window.scrollTo({top:0, behavior:'smooth'});">?</div>
            </div>
        </footer>

        <!-- Modal 1: Booking Form -->
        <div id="bookingModal" class="modal-overlay">
            <div class="modal-box">
                <button type="button" class="modal-close-btn" onclick="closeBookingModal();">&times;</button>
                <h3 class="modal-title">Book an Appointment</h3>
                <p class="modal-desc">Schedule your appointment with our pharmacist at Windermere Plaza.</p>

                <div class="form-group">
                    <label class="form-label">Full Name *</label>
                    <asp:TextBox ID="txtBookingName" runat="server" CssClass="form-control" placeholder="e.g. Sarah Jenkins"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Phone Number *</label>
                    <asp:TextBox ID="txtBookingPhone" runat="server" CssClass="form-control" placeholder="(780) 000-0000"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtBookingEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="sarah@example.com"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Select Service *</label>
                    <asp:DropDownList ID="ddlServiceType" runat="server" CssClass="form-control">
                        <asp:ListItem Value="Medication Compounding" Selected="True">Medication Compounding</asp:ListItem>
                        <asp:ListItem Value="Diabetes Management">Diabetes Management</asp:ListItem>
                        <asp:ListItem Value="Flu Shot & Covid-19 Vaccination">Flu Shot & Covid-19 Vaccination</asp:ListItem>
                        <asp:ListItem Value="Injection / Travel Health">Injection / Travel Health</asp:ListItem>
                        <asp:ListItem Value="Medication Reviews">Medication Reviews</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="form-label">Preferred Date</label>
                    <asp:TextBox ID="txtBookingDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Additional Notes</label>
                    <asp:TextBox ID="txtBookingNotes" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control" placeholder="Any specific requirements..."></asp:TextBox>
                </div>

                <asp:Button ID="btnSubmitBooking" runat="server" Text="Submit Booking" OnClick="btnSubmitBooking_Click" CssClass="btn-green-pill" style="width: 100%; border-radius: 8px;" />
            </div>
        </div>

        <!-- Modal 2: Prescription Refill / Transfer Form -->
        <div id="prescriptionModal" class="modal-overlay">
            <div class="modal-box">
                <button type="button" class="modal-close-btn" onclick="closePrescriptionModal();">&times;</button>
                <h3 class="modal-title">Fill / Transfer Prescription</h3>
                <p class="modal-desc">Fast, confidential prescription refills and transfers.</p>

                <div class="form-group">
                    <label class="form-label">Full Name *</label>
                    <asp:TextBox ID="txtRxName" runat="server" CssClass="form-control" placeholder="Full Patient Name"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Phone Number *</label>
                    <asp:TextBox ID="txtRxPhone" runat="server" CssClass="form-control" placeholder="Phone Number"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <asp:TextBox ID="txtRxEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Prescription Number / Current Pharmacy</label>
                    <asp:TextBox ID="txtRxNumber" runat="server" CssClass="form-control" placeholder="e.g. Rx #123456 or Name of previous pharmacy"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="form-label">Notes / Medication List</label>
                    <asp:TextBox ID="txtRxNotes" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="List medications to refill or transfer details..."></asp:TextBox>
                </div>

                <asp:Button ID="btnSubmitPrescription" runat="server" Text="Submit Prescription Request" OnClick="btnSubmitPrescription_Click" CssClass="btn-green-pill" style="width: 100%; border-radius: 8px;" />
            </div>
        </div>

    </form>

    <script src="../../js/script.js?v=2.3"></script>
</body>
</html>
