<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get the POST data
    $data = json_decode(file_get_contents('php://input'), true);
    $to = $data['to'];
    $subject = $data['subject'];
    $message = $data['message'];
    $headers = "From: noreplay@xn--bildsetech-4cb.dk";

    // Send the email
    if (mail($to, $subject, $message, $headers)) {
        http_response_code(200);
        echo json_encode(["message" => "Email sent successfully"]);
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Failed to send email"]);
    }
} else {
    http_response_code(405);
    echo json_encode(["message" => "Method not allowed"]);
}
?>
