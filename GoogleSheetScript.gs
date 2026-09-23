/**
 * Primecare Pharmacy Edmonton - Google Apps Script Integration
 * Instructions:
 * 1. Open Google Sheets (https://sheets.google.com) and create a new sheet named "Primecare Submissions".
 * 2. Click Extensions -> Apps Script.
 * 3. Replace all code in Code.gs with this script.
 * 4. Click Deploy -> New deployment -> Select type "Web app".
 * 5. Set Execute as: "Me" and Who has access: "Anyone".
 * 6. Click Deploy, copy the Web App URL, and paste it into Web.config under <appSettings key="GoogleSheetWebAppUrl" value="YOUR_DEPLOYED_URL" />
 */

function doPost(e) {
  var lock = LockService.getScriptLock();
  lock.tryLock(10000);

  try {
    var doc = SpreadsheetApp.getActiveSpreadsheet();
    var sheet = doc.getSheetByName("Submissions") || doc.getActiveSheet();

    // Setup headers if sheet is newly created
    if (sheet.getLastRow() === 0) {
      sheet.appendRow(["Timestamp", "FormType", "FullName", "Phone", "Email", "ServiceType", "PrescriptionNo", "PreferredDate", "Notes"]);
      sheet.getRange(1, 1, 1, 9).setFontWeight("bold").setBackground("#1ea84c").setFontColor("#ffffff");
    }

    var data = JSON.parse(e.postData.contents);
    var timestamp = new Date().toLocaleString("en-CA", { timeZone: "America/Edmonton" });

    sheet.appendRow([
      timestamp,
      data.FormType || "General Contact",
      data.FullName || "",
      data.Phone || "",
      data.Email || "",
      data.ServiceType || "",
      data.PrescriptionNo || "",
      data.PreferredDate || "",
      data.Notes || ""
    ]);

    return ContentService.createTextOutput(JSON.stringify({ "result": "success", "row": sheet.getLastRow() }))
      .setMimeType(ContentService.MimeType.JSON);

  } catch (err) {
    return ContentService.createTextOutput(JSON.stringify({ "result": "error", "error": err.toString() }))
      .setMimeType(ContentService.MimeType.JSON);
  } finally {
    lock.releaseLock();
  }
}

function doGet(e) {
  return ContentService.createTextOutput("Primecare Pharmacy Web App API Endpoint is Active.");
}
