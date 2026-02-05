(function() {

    // Step 1: find the container DIV with "body" in class
    let bodies = document.querySelectorAll("div[class*='body']");
    if (bodies.length === 0) return "[]";
    let body = bodies[0];

    // Step 2: get all tables inside this body
    let tables = body.getElementsByTagName("table");
    let rows = [];

    for (let i = 0; i < tables.length; i++) {

        let t = tables[i];

        // Step 3: get all cells of this table
        let cells = t.getElementsByTagName("td");

        // Skip empty or layout tables
        if (cells.length < 2) continue;

        // Step 4: extract row as array
        let row = [];
        for (let c = 0; c < cells.length; c++) {
            row.push(cells[c].innerText.trim());
        }

        rows.push(row);
    }

    // Return structured JSON
    return JSON.stringify(rows);
})();
