    
    func sendEmail() {
        guard let url = URL(string: "https://serverside.send-email.php") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let emailData = [
            "to": "email@icloud.com",
            "subject": "",
            "message": ""
        ]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: emailData, options: []) else { return }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                print("Email sent successfully!")
            } else {
                print("Failed to send email.")
            }
        }.resume()
    }
