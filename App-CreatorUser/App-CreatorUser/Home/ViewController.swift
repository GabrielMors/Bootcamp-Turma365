//
//  ViewController.swift
//  App-CreatorUser
//
//  Created by Gabriel Mors  on 9/6/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var editPhotoButton: UIButton!
    @IBOutlet weak var nameUserTextField: UITextField!
    @IBOutlet weak var addUserButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var userList: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        configImage(image: userImage)
        configButtons(button: editPhotoButton, title: "Editar imagem", color: UIColor(red: 155/255, green: 212/255, blue: 244, alpha: 1.0))
        configButtons(button: addUserButton, title: "Adicionar", color: UIColor(red: 155/255, green: 212/255, blue: 244, alpha: 1.0))
        configTextField(textField: nameUserTextField)
        configTableView()
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .purple
    }
    
    private func configImage(image: UIImageView) {
        image.image = UIImage(named: "user")
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
    }
    
    private func configButtons(button: UIButton, title: String, color: UIColor) {
        button.tintColor = color
        button.setTitle(title, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
    }
    
    private func configTextField(textField: UITextField) {
        textField.placeholder = "Digite seu nome:"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 15
        textField.backgroundColor = .systemGray6
        textField.delegate = self
    }
    
    private func configTableView() {
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    
    @IBAction func tappedEditButton(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    
    @IBAction func tappedAddUserButton(_ sender: Any) {
        addUser(image: userImage.image ?? UIImage(named: "user")!, name: nameUserTextField.text ?? "")
        nameUserTextField.text = ""
        userImage.image = UIImage(named: "user")
    }
    
    
    private func addUser(image: UIImage, name: String) {
        let user = User(image: image, name: name)
        userList.append(user)
        tableView.reloadData()
    }
    
    func showEditAlert(for indexPath: IndexPath) {
        let alert = UIAlertController(title: "Editar Nome", message: "Digite o novo nome do usuário", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.text = self.userList[indexPath.row].name // Preenche o textField com o nome atual
        }
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) { _ in
            if let newName = alert.textFields?.first?.text, !newName.isEmpty {
                // Atualiza o nome do usuário
                self.userList[indexPath.row].name = newName
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func shareUser(at indexPath: IndexPath) {
        let user = userList[indexPath.row]
        
        // Itens a serem compartilhados (nome e imagem)
        var itemsToShare: [Any] = [user.name]
        
//        if let userImage = user.image {
//            itemsToShare.append(userImage) // Adiciona a imagem ao compartilhamento, se houver
//        }
        
        let activityController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
        
        // Para iPad, evitar crash ao abrir
        if let popoverController = activityController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = tableView.rectForRow(at: indexPath)
        }
        
        present(activityController, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
        cell?.setupCell(user: userList[indexPath.row])
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // AÇAO DE DELETAR
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Deletar") { _, _, completionHandler in
            self.userList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red
        
        // AÇAO DE EDITAR
        
        let editAction = UIContextualAction(style: .destructive, title: "Editar") { _, _, completionHandler in
            self.showEditAlert(for: indexPath)
            completionHandler(true)
        }
        editAction.backgroundColor = .blue
        
        // AÇAO DE COMPARTILHAR
        
        let shareAction = UIContextualAction(style: .destructive, title: "Compartilhar") { _, _, completionHandler in
            self.shareUser(at: indexPath)
            completionHandler(true)
        }
        shareAction.backgroundColor = .orange
        
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction, editAction, shareAction])
        swipeAction.performsFirstActionWithFullSwipe = false
        
        return swipeAction
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.image = image
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        true
    }
}
