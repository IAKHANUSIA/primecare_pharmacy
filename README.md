# 🏥 Primecare Pharmacy & Travel Clinic — Edmonton, AB

[![Primecare Pharmacy](images/logo.svg)](https://github.com/IAKHANUSIA/primecare_pharmacy)

The modern, responsive web application for **Primecare Pharmacy & Travel Clinic**, serving the Edmonton, Windermere, Leduc, and St. Albert communities in Alberta, Canada.

---

## 📍 Locations & Contacts (Alberta, Canada)

| Location | Address | Phone | Fax |
| :--- | :--- | :--- | :--- |
| **Windermere Plaza** *(Building 3)* | 5594 Windermere Blvd, Edmonton, AB T6W 2Z8 | [+1 (780) 435-3030](tel:17804353030) | (780) 435-3031 |
| **Leduc Location** | 5406 50th Street, Leduc, AB T9E 6Z6 | [+1 (780) 769-1090](tel:17807691090) | (780) 769-1091 |
| **St. Albert Location** | 140 St. Albert Trail, St. Albert, AB T8N 7C8 | [+1 (780) 459-3030](tel:17804593030) | (780) 459-3031 |

- **Official Email:** `primecarepharmacy5594@gmail.com`
- **WhatsApp Support:** [+1 (780) 435-3030](https://wa.me/17804353030)

---

## ✨ Key Features & Services

1. **Minor Ailments Prescribing**: Direct consultation with prescribing pharmacists for urinary tract infections (UTIs), cold sores, allergic rhinitis, seasonal allergies, acid reflux, eczema, tick bites, and skin conditions.
2. **Prescription Refill & Transfer**: 3-step prescription transfer process and fast online refill request portal.
3. **Flu Shots & COVID-19 Vaccinations**: Online appointment scheduling and walk-in consultation booking.
4. **Clinical Health Services**:
   - Diabetes Management & Blood Glucose Tracking
   - Asthma & COPD Inhaler Action Plans
   - Heart Health, Cholesterol & Hypertension Monitoring
   - Travel Health Vaccines & Consultations
   - Specialized Medication Compounding (custom creams, liquids, suspensions)
   - Medication Reviews & Comprehensive Annual Care Plans (CACP)
   - Smoking Cessation Support
   - Weight Management Consultations
   - Home Health Care Supplies & Compression Stockings
5. **Modern Universal Navigation**:
   - Universal click & hover dropdown system with zero-gap hover bridge.
   - 100% mobile, tablet, laptop, and desktop responsive layout.
   - Native modal dialogs for appointment booking and prescription submissions.
6. **Regulatory Compliance**: Alberta College of Pharmacy (ACP) licensed pharmacy documentation and patient privacy protection.

---

## 🛠️ Technology Stack

- **Backend:** ASP.NET Web Forms (.NET Framework 4.7.2 / 4.8), VB.NET
- **Frontend:** Semantic HTML5, Vanilla CSS3 (Custom Design System, CSS variables), Vanilla JavaScript (ES6)
- **Typography:** Google Fonts (`Plus Jakarta Sans`, `Inter`)
- **Data Storage:**
  - Microsoft Access Database (`App_Data/PrimecareBookings.mdb`)
  - Google Apps Script Web App Integration (`GoogleSheetScript.gs`) for Google Sheets synchronization
- **Web Server:** Microsoft IIS 10 / IIS Express

---

## 🚀 How to Run Locally

### Prerequisites
- Windows 10/11
- Visual Studio 2019 / 2022 (with ASP.NET and web development workload) or IIS Express
- .NET Framework 4.7.2 or higher

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/IAKHANUSIA/primecare_pharmacy.git
   ```
2. Open `PrimecarePharmacy.sln` in Visual Studio.
3. Press `F5` or `Ctrl + F5` to launch in IIS Express.
4. Navigate to `http://localhost:8088/Default.aspx`.

---

## 🌐 Deployment Options

### Option 1: Microsoft IIS / Windows Server
1. In IIS Manager, create a new Website or Application pointing to the project root folder.
2. Set the Application Pool to `.NET CLR Version v4.0.30319`, Pipeline mode `Integrated`.
3. Ensure `IIS_IUSRS` has Read/Write permissions to the `App_Data` and `UploadDoc` directories.
4. Browse to your domain or server IP.

### Option 2: Azure App Service (Windows Plan)
1. In Azure Portal, create an App Service on a Windows App Service Plan (.NET Framework 4.8).
2. Connect Deployment Center to this GitHub repository (`main` branch).
3. Configure application settings in Azure portal to match `Web.config`.

### Option 3: GitHub Pages (Static Preview)
The root `index.html` file provides an instant static presentation of the website for GitHub Pages:
1. Go to repository **Settings** -> **Pages**.
2. Under **Build and deployment** > **Branch**, select `main` / `root`.
3. Click **Save**. Your site will be published at:
   `https://iakhanusia.github.io/primecare_pharmacy/`

---

## 📄 License & Rights
© Primecare Pharmacy & Travel Clinic Edmonton. All Rights Reserved.
Licensed by the Alberta College of Pharmacy (ACP).
