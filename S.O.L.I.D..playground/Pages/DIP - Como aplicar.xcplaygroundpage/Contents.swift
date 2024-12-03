import Foundation

protocol MessageService {
    func sendMessage(message: String)
}

class EmailService: MessageService {
    
    func sendMessage(message: String) {
        print("Sending email: \(message)")
    }
}

class SMSService: MessageService {
    
    func sendMessage(message: String) {
        print("Sending SMS: \(message)")
    }
}

class NotificationManager {
    private let emailService: MessageService
    
    init(emailService: MessageService) {
        self.emailService = emailService
    }
    
    func sendNotification(message: String) {
        emailService.sendMessage(message: message)
    }
}

let emailService = EmailService() // Objeto
let smsService = SMSService() // Objeto

let notificationWithEmail = NotificationManager(emailService: emailService)
notificationWithEmail.sendNotification(message: "Welcome to our app!")

let notificationWithSMS = NotificationManager(emailService: smsService)
notificationWithSMS.sendNotification(message: "Welcome to our app via SMS!")

