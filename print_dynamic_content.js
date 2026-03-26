// Function and Global Variable Declaration

/*
  Function Name : printDiv
  Purpose       : Print specific region content in Oracle APEX or any web page

  Usage:
  - Pass the ID of the div/container to print
  - Example: printDiv('printableArea')
*/

// ==============================
// Function Definition
// ==============================
function printDiv(printableArea) {

    // Get the content of the target div
    var printContents = document.getElementById(printableArea).innerHTML;

    // Open a new window for printing
    var printWindow = window.open('', '', 'height=600,width=800');

    // Write content into the new window
    printWindow.document.write('<html><head><title>Print</title></head><body>');
    printWindow.document.write(printContents);
    printWindow.document.write('</body></html>');

    // Close document and trigger print
    printWindow.document.close();
    printWindow.print();
}

//Create Print Button & Dynamic Action
//Action: Execute JavaScript Code
printDiv('printableArea');
