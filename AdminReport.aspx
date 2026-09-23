<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminReport.aspx.vb" Inherits="AdminReport" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Booking & Prescription Data Report - Primecare Pharmacy</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="icon" href="images/logo.svg" type="image/svg+xml" />
    <style>
        .report-container {
            max-width: 1280px;
            margin: 40px auto;
            padding: 0 20px;
        }
        .report-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }
        .report-title {
            font-size: 28px;
            font-weight: 800;
            color: var(--dark-navy);
            margin: 0;
        }
        .report-subtitle {
            color: var(--text-muted);
            font-size: 14px;
            margin-top: 4px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: var(--card-shadow);
            border: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            background: #e0f2fe;
            color: var(--primary-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            font-weight: bold;
        }
        .stat-icon.green { background: #dcfce7; color: var(--primary-green); }
        .stat-icon.navy { background: #e0e7ff; color: var(--dark-navy); }
        .stat-icon.orange { background: #ffedd5; color: #c2410c; }
        .stat-val {
            font-size: 26px;
            font-weight: 800;
            color: var(--dark-navy);
            line-height: 1;
        }
        .stat-label {
            font-size: 13px;
            color: var(--text-muted);
            margin-top: 4px;
        }
        .filter-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: var(--card-shadow);
            border: 1px solid #e2e8f0;
            margin-bottom: 25px;
        }
        .filter-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            align-items: end;
        }
        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .filter-label {
            font-size: 13px;
            font-weight: 600;
            color: var(--dark-navy);
        }
        .table-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            border: 1px solid #e2e8f0;
            overflow: hidden;
        }
        .report-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-size: 14px;
        }
        .report-table th {
            background: #f8fafc;
            color: var(--dark-navy);
            font-weight: 700;
            padding: 14px 16px;
            border-bottom: 2px solid #e2e8f0;
            white-space: nowrap;
        }
        .report-table td {
            padding: 14px 16px;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: middle;
        }
        .report-table tr:hover {
            background-color: #f8fafc;
        }
        .badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
        .badge-green { background: #dcfce7; color: #15803d; }
        .badge-blue { background: #e0f2fe; color: #0369a1; }
        .badge-navy { background: #e0e7ff; color: #3730a3; }
        .badge-orange { background: #ffedd5; color: #9a3412; }
        .btn-export {
            background-color: var(--primary-green);
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        .btn-export:hover {
            background-color: var(--primary-green-hover);
        }
        .btn-filter {
            background-color: var(--primary-blue);
            color: #ffffff;
            padding: 10px 16px;
            border-radius: 8px;
            border: none;
            font-weight: 600;
            cursor: pointer;
        }
        .btn-reset {
            background-color: #e2e8f0;
            color: #475569;
            padding: 10px 16px;
            border-radius: 8px;
            border: none;
            font-weight: 600;
            cursor: pointer;
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
                    <li class="nav-item"><a href="AdminUpload.aspx" style="color: #ffffff; font-weight: 700;">Upload Form</a></li>
                    <li class="nav-item"><a href="AdminReport.aspx" class="active" style="color: #ffffff; font-weight: 700;">Report</a></li>
                </ul>
            </div>
        </header>

        <div class="report-container">
            <div class="report-header">
                <div>
                    <h1 class="report-title">Booking & Prescription Data Report</h1>
                    <div class="report-subtitle">Real-time statistics & appointment submissions for Primecare Pharmacy & Travel Clinic</div>
                </div>
                <div style="display: flex; gap: 10px; align-items: center;">
                    <asp:Button ID="btnExport" runat="server" Text="Export Report to CSV" OnClick="btnExport_Click" CssClass="btn-export" />
                    <asp:Button ID="btnLogout" runat="server" Text="Log Out" OnClick="btnLogout_Click" CssClass="btn-reset" style="padding: 10px 16px;" />
                </div>
            </div>

            <!-- Summary Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon green">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#15803d" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="18" y1="20" x2="18" y2="10"></line>
                            <line x1="12" y1="20" x2="12" y2="4"></line>
                            <line x1="6" y1="20" x2="6" y2="14"></line>
                        </svg>
                    </div>
                    <div>
                        <div class="stat-val"><asp:Literal ID="litTotalCount" runat="server">0</asp:Literal></div>
                        <div class="stat-label">Total Submissions</div>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon blue">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#0369a1" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                    </div>
                    <div>
                        <div class="stat-val"><asp:Literal ID="litBookingsCount" runat="server">0</asp:Literal></div>
                        <div class="stat-label">Service Appointments</div>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon navy">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#3730a3" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M10.5 20.5l10-10a4.95 4.95 0 1 0-7-7l-10 10a4.95 4.95 0 1 0 7 7z"></path>
                            <line x1="8.5" y1="8.5" x2="15.5" y2="15.5"></line>
                        </svg>
                    </div>
                    <div>
                        <div class="stat-val"><asp:Literal ID="litRefillsCount" runat="server">0</asp:Literal></div>
                        <div class="stat-label">Refills & Transfers</div>
                    </div>
                </div>

                <div class="stat-card">
                    <div class="stat-icon orange">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#c2410c" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path>
                        </svg>
                    </div>
                    <div>
                        <div class="stat-val"><asp:Literal ID="litUploadsCount" runat="server">0</asp:Literal></div>
                        <div class="stat-label">Uploaded Prescriptions</div>
                    </div>
                </div>
            </div>

            <!-- Filters -->
            <div class="filter-card">
                <div class="filter-grid" style="grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));">
                    <div class="filter-group">
                        <label class="filter-label">Search Patient / Contact</label>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="e.g. Khanusia or 780..."></asp:TextBox>
                    </div>

                    <div class="filter-group">
                        <label class="filter-label">From Booking Date</label>
                        <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="filter-group">
                        <label class="filter-label">To Booking Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="filter-group">
                        <label class="filter-label">Filter by Service</label>
                        <asp:DropDownList ID="ddlServiceFilter" runat="server" CssClass="form-control">
                            <asp:ListItem Value="ALL">All Services</asp:ListItem>
                            <asp:ListItem Value="Prescriptions">Prescriptions</asp:ListItem>
                            <asp:ListItem Value="Diabetes Management">Diabetes Management</asp:ListItem>
                            <asp:ListItem Value="Flu Shot & Covid-19 Vaccination">Vaccination</asp:ListItem>
                            <asp:ListItem Value="Injection / Travel Health">Injection / Travel Health</asp:ListItem>
                            <asp:ListItem Value="Smoking Cessation Support">Smoking Cessation</asp:ListItem>
                            <asp:ListItem Value="Asthma/COPD Management">Asthma/COPD</asp:ListItem>
                            <asp:ListItem Value="Heart Health">Heart Health</asp:ListItem>
                            <asp:ListItem Value="Weight Management">Weight Management</asp:ListItem>
                            <asp:ListItem Value="Medication Compounding">Medication Compounding</asp:ListItem>
                            <asp:ListItem Value="Home Health Care">Home Health Care</asp:ListItem>
                            <asp:ListItem Value="Medication Reviews">Medication Reviews</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="filter-group">
                        <label class="filter-label">Filter by Form Category</label>
                        <asp:DropDownList ID="ddlFormFilter" runat="server" CssClass="form-control">
                            <asp:ListItem Value="ALL">All Form Types</asp:ListItem>
                            <asp:ListItem Value="Appointment Booking">Appointment Booking</asp:ListItem>
                            <asp:ListItem Value="Prescription Refill">Prescription Refill / Transfer</asp:ListItem>
                            <asp:ListItem Value="New Prescription">New Prescription Upload</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="filter-group" style="flex-direction: row; gap: 10px; align-items: flex-end;">
                        <asp:Button ID="btnFilter" runat="server" Text="Apply Filter" OnClick="btnFilter_Click" CssClass="btn-filter" style="flex:1;" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CssClass="btn-reset" style="flex:1;" />
                    </div>
                </div>
            </div>

            <!-- Report Table -->
            <div class="table-card">
                <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="false" CssClass="report-table" GridLines="None" EmptyDataText="No booking data records found matching the criteria.">
                    <Columns>
                        <asp:BoundField DataField="Timestamp" HeaderText="Submission Time" />
                        <asp:TemplateField HeaderText="Form Type">
                            <ItemTemplate>
                                <span class='<%# GetBadgeClass(Eval("FormType").ToString()) %>'>
                                    <%# Eval("FormType") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FullName" HeaderText="Patient Name" />
                        <asp:TemplateField HeaderText="Phone / Email">
                            <ItemTemplate>
                                <div><strong><%# Eval("Phone") %></strong></div>
                                <div style="font-size:12px; color:#64748b;"><%# Eval("Email") %></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ServiceType" HeaderText="Service / Prescription" />
                        <asp:BoundField DataField="PreferredDate" HeaderText="Preferred Date" />
                        <asp:TemplateField HeaderText="Notes / Uploaded File">
                            <ItemTemplate>
                                <%# FormatNotesOrFile(Eval("PrescriptionNo").ToString(), Eval("Notes").ToString()) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
