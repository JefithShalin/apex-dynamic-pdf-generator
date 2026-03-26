/*
  Function Name : fn_generate_dynamic_printable_html
  Purpose       : Generic function to generate printable HTML content
  Return Type   : CLOB
*/
/*
  APEX Usage Instructions:
  - Set Region Type to       : Dynamic Content
  - Set Source Type to       : PL/SQL Function Body returning a CLOB
*/

CREATE OR REPLACE FUNCTION fn_generate_dynamic_printable_html
(
    p_title          IN VARCHAR2 DEFAULT 'Document Title',
    p_sender_label   IN VARCHAR2 DEFAULT 'Sender Details',
    p_sender_name    IN VARCHAR2 DEFAULT 'ABC Company',
    p_receiver_label IN VARCHAR2 DEFAULT 'Receiver Details',
    p_receiver_name  IN VARCHAR2 DEFAULT 'XYZ Company'
)
RETURN CLOB
IS
    l_html CLOB;
BEGIN
    -- Main Container
    l_html := '<div style="width:100%; font-family:Arial; font-size:13px;" id="printableArea">' ||

    -- =========================
    -- Header Section
    -- =========================
    '<div style="text-align:center; margin-bottom:15px;">' ||
    '  <h2 style="margin:0;">' || p_title || '</h2>' ||
    '  <hr>' ||
    '</div>' ||

    -- =========================
    -- Dynamic Info Section
    -- =========================
    '<table style="width:100%; border-collapse:collapse; margin-bottom:15px;">' ||
    '<tr>' ||

    -- Left Section
    '<td style="width:50%; padding:6px; border:1px solid #000;">' ||
    '  <b>' || p_sender_label || '</b><br>' ||
    '  Name : ' || p_sender_name || '<br>' ||
    '  Date : ' || TO_CHAR(SYSDATE, 'DD/MM/YYYY') || '<br>' ||
    '</td>' ||

    -- Right Section
    '<td style="width:50%; padding:6px; border:1px solid #000;">' ||
    '  <b>' || p_receiver_label || '</b><br>' ||
    '  Name : ' || p_receiver_name || '<br>' ||
    '</td>' ||

    '</tr>' ||
    '</table>' ||

    -- =========================
    -- Generic Data Table
    -- =========================
    '<table style="width:100%; border-collapse:collapse;">' ||
    '<tr>' ||
    '  <th style="border:1px solid #000;">Column 1</th>' ||
    '  <th style="border:1px solid #000;">Column 2</th>' ||
    '  <th style="border:1px solid #000;">Column 3</th>' ||
    '</tr>';

    -- =========================
    -- Sample Dynamic Data Loop
    -- =========================
    FOR r IN (
        SELECT empno, ename, sal
        FROM emp
        WHERE ROWNUM <= 3
    ) LOOP
        l_html := l_html ||
        '<tr>' ||
        '  <td style="border:1px solid #000;">' || r.empno || '</td>' ||
        '  <td style="border:1px solid #000;">' || r.ename || '</td>' ||
        '  <td style="border:1px solid #000;">' || r.sal || '</td>' ||
        '</tr>';
    END LOOP;

    -- Close Table
    l_html := l_html || '</table>' ||

    -- =========================
    -- Footer Section
    -- =========================
    '<div style="margin-top:15px;">' ||
    '  <b>Note:</b> This is a system-generated document.' ||
    '</div>' ||

    '<div style="margin-top:25px; text-align:right;">' ||
    '  Authorized Signatory' ||
    '</div>' ||

    '</div>';

    RETURN l_html;
END fn_generate_dynamic_printable_html;
/
