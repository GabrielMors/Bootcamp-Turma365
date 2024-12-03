//MARK: Dependency Inversion Principle (DIP) Princípio da Invesão de Dependência



class EmailService {
    func sendEmail(message: String) {
        print("Sending email: \(message)")
    }
    
}

class NotificationManager {
    private let emailService = EmailService()
    
    func sendNotification(message: String) {
        emailService.sendEmail(message: message)
    }
}

let notificationManager = NotificationManager()
notificationManager.sendNotification(message: "Welcome to our app!")

//MARK: Problema

// Acoplamento forte: A classe NotificationManager depende diretamente da classe EmailService. Se vc quiser adicionar suporte para SMS ou Push notification, precisará modificar o NotificationManager, violando o pricipio Open/Closed
// Dificil para teste
