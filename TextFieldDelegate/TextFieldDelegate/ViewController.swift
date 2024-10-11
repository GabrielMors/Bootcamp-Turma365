
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configTextFields(textField: emailTextField, placeholder: "Digite seu e-mail:", keyboard: .emailAddress, isSecure: false)
        configTextFields(textField: passwordTextField, placeholder: "Digite sua senha:", keyboard: .default, isSecure: true)
        configButton()
    }

    // Toda vez que criar um textField nao podemos esquecer de declarar o (Delegate = self)
    // Isso para cada textField
    private func configTextFields(textField: UITextField, placeholder: String, keyboard: UIKeyboardType, isSecure: Bool) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboard
        textField.isSecureTextEntry = isSecure
        textField.autocorrectionType = .no
        // Assinando o protocolo
        textField.delegate = self
        
        
//        emailTextField.delegate = self
//        passwordTextField.delegate = self
    }
    
    private func configButton() {
        enterButton.isEnabled = false
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    // Esse método é disparado quando o teclado sobe
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderWidth = 2.0
        
        // Exemplo com If else
//        if textField == emailTextField {
//            textField.layer.borderColor = UIColor.blue.cgColor
//        } else {
//            textField.layer.borderColor = UIColor.purple.cgColor
//        }
        
        // Exemplo com Switch case
        switch textField {
        case emailTextField:
            textField.layer.borderColor = UIColor.blue.cgColor
        case passwordTextField:
            textField.layer.borderColor = UIColor.purple.cgColor
        default:
            print("Nao é nenhum deles!!!!")
        }
    }
    
    // Esse método é disparado quando o teclado abaixa/some
    // O DidEnd SEMPRE é utilizado para realizar validações!!!!!!!
    // Nao recomendamos criar validacoes no textFieldShouldReturn
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
        
        if emailTextField.hasText && passwordTextField.hasText {
            enterButton.isEnabled = true
        } else {
            enterButton.isEnabled = false
        }
        
        print(#function)
    }
    
    // Esse método é disparado quando o clico no botao Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        // faz o teclado se abaixar quando clicar nele
        textField.resignFirstResponder()
        return true
    }

    // Esse método é disparado assim que é feito qualquer alteracao de texto no TextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
            let newText = text.replacingCharacters(in: range, with: string)
            print(newText)
        }
        return true
    }
}



