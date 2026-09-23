<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Services_PrescriptionsPage" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Prescriptions - Primecare Pharmacy Windermere Edmonton</title>
    <meta name="description"
        content="Fast & Confidential Prescription Refills, Transfers & Prescribing Services at Primecare Pharmacy Windermere Plaza, Edmonton. Health Canada approved medications." />

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
        <section class="service-hero-section" style="background: linear-gradient(135deg, rgba(15, 23, 42, 0.45) 0%, rgba(22, 101, 52, 0.40) 100%), url('../../images/prescriptions_apothecary.jpg') center center / cover no-repeat;">
            <div class="service-hero-breadcrumb">Services / Prescriptions</div>
            <h1 class="service-hero-title">Prescriptions</h1>
        </section>

        <!-- Main Content Section -->
        <main class="service-detail-section">
            <div class="service-detail-grid">
                <div class="service-left-col">
                    <p class="service-lead-text">
                        Over half of Canadian adults aged 18 to 79 have used at least one prescription medication in the past month. When used as prescribed by a doctor, prescription medicines can be helpful in treating many illnesses. But when medicines are misused, they can have serious consequences. We're your advocate in health care, working to make prescriptions affordable. We work across the medical field to anticipate and deliver the support you need.
                    </p>

                    <div class="service-callout-box">
                        Get the right prescriptions for your medications using the best prescribing services in the city.
                    </div>
                </div>

                <div class="service-right-col">
                    <img src="../../images/prescriptions_apothecary.jpg" alt="Pharmacist dispensing prescription medications" class="service-detail-img" />
                </div>
            </div>

            <div class="service-content-body">
                <p>
                    Prescription drugs are medications prescribed to a patient by a health professional to help manage health conditions. These medications are regulated by Health Canada through the Food and Drugs Act to ensure their safety, effectiveness and quality. There is a variety of prescription drugs available on the market taking the form of capsules, syrups, skin patches and liquids for injection which are used to help patients' health conditions.
                </p>
                <p>
                    The process of prescribing a medication is complex and includes: deciding that a drug is indicated; choosing the best drug; determining a dose and schedule appropriate for the patient's physiologic status; monitoring for effectiveness and toxicity; educating the patient about expected side effects; and indications for seeking consultation.
                </p>
                <p>
                    We issue precise prescriptions for all standard medicines, and we stock the commonly prescribed medications so that you can buy them whenever you want without having to wait. We follow a rigorous procedure before prescribing the medicines, so you don't have to worry about safety or legality. Our pharmacists and healthcare professionals are skilled and certified to prescribe medications as approved by Health Canada. If you want to get your medication dispensed, the quickest way is to come to Primecare Pharmacy for prescriptions.
                </p>
            </div>

            <!-- Service Checklist Grid -->
            <div class="service-checklist-card">
                <div class="service-checklist-title">You can expect to buy the following medicines from our clinic:</div>
                <div class="service-checklist-grid">
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Antibiotics</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Antidepressants</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Anti-inflammatories and painkillers</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Antihistamines</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Basic ointments</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Nasal sprays</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Asthma inhalers</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Eye and ear drops</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Antidiabetics</span>
                    </div>
                    <div class="service-checklist-item">
                        <span class="service-checklist-icon">&rsaquo;</span>
                        <span>Contraceptives</span>
                    </div>
                </div>
            </div>

            <!-- Bottom Callout & CTA Banner -->
            <div class="service-cta-banner">
                <h2 class="service-cta-title">Let us help you take the right medications for your conditions using our prescription service approved by Health Canada.</h2>
                <p class="service-cta-desc">
                    Primecare Pharmacy is your best solution for medications in a hurry. We can help you get medications quickly and easily using an online GP. All you have to do is pick up your phone and give us a call, so you can pick up your prescription before setting out for your travel journey.
                </p>
                <button type="button" class="btn-green-pill" onclick="openPrescriptionModal();">Fill / Refill Prescription</button>
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
                        <li><a href="../medication-compounding/">Medication Compounding</a></li>
                        <li><a href="../medication-reviews/">Medication Reviews</a></li>
                        <li><a href="Default.aspx">Prescriptions</a></li>
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
                        <asp:ListItem Value="Prescriptions" Selected="True">Prescriptions</asp:ListItem>
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
