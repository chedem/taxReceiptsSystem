window.onload = function () {
    var excel = new Excel.View.Sheets.Workbook(document.getElementById('ss'), {
        sheetCount: 1
    });
    // get excel object
    // var excel = Excel.View.Sheets.findControl(document.getElementById('ss'));
    initExcel(excel);
};

function initExcel(excel) {
    var sd = dataSource;
    var sheet = excel.getActiveSheet();
    if (sd.length > 0) {
        sheet.setDataSource(sd);
    }
    sheet.setColumnWidth(0, 160);
    sheet.setColumnWidth(1, 70);
    sheet.setColumnWidth(2, 90);
    sheet.setColumnWidth(3, 110);
    sheet.setColumnWidth(4, 80);
    sheet.setColumnWidth(6, 110);
}
