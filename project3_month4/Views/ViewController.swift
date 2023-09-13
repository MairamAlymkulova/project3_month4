import UIKit


class ViewController: UIViewController {
    private var check = false
    private let topLabel = MakerView.shared.makeLabel(text: "Create New Password 🔐", textAlign: .left, font: .boldSystemFont(ofSize: 32), textColor: Colors.black)
    
    private let instructionLabel = MakerView.shared.makeLabel(text: "Enter your password. If you forget it, then\n you have to do forgot password.", textAlign: .left, font: .systemFont(ofSize: 18), textColor: Colors.black)
    
    private let passwordLabel = MakerView.shared.makeLabel(text: "Password", textAlign: .left, font: .boldSystemFont(ofSize: 16), textColor: Colors.black)
    
    private let passwordTF = MakerView.shared.makeTF(textColor: Colors.black,font: .systemFont(ofSize: 20), textALign: .left, secureTextEntry: true)
    
    private let confirmPasswordLabel = MakerView.shared.makeLabel(text: "Confirm Password", textAlign: .left,font: .boldSystemFont(ofSize: 16), textColor: Colors.black)
    
    private let confirmPasswordTF = MakerView.shared.makeTF(textColor: Colors.black, font: .systemFont(ofSize: 20), textALign: .left, secureTextEntry: true)

    private let checkBtn = MakerView.shared.makeButton(backgroundColor: .red,cornerRadius: 6, tinitColor: .white)
    
    private let rememberMeLBL = MakerView.shared.makeLabel(text: "Remember me", font: .systemFont(ofSize: 18), textColor: Colors.black)
    
    private let showPasswordBtn = MakerView.shared.makeButton(image: UIImage(systemName: "eye.fill"), tinitColor: .red)
    
    private let showConfirmPasswordBtn = MakerView.shared.makeButton(image: UIImage(systemName: "eye.fill"), tinitColor: .red)
    
    private let viewLine1: UIView = {
        let view = UIView()
        
        view.backgroundColor = .red
        
        return view
    }()
    
    private let viewLine2: UIView = {
        let view = UIView()
        
        view.backgroundColor = .red
        
        return view
    }()
    
    private let continueBtn = MakerView.shared.makeButton(title: "Continue", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .gray, cornerRadius: 30, isEnabled: false)
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
      
    }

    private func initUI(){
       topLBlConfig()
        instructionLBlConfig()
        
        passwordLblConfig()
        passwordTFConfig()
        showPasswordBtnConfig()
        viewLine1Config()
        
        confirmPasswordLBLConfig()
        confirmPasswordTFConfig()
        showConfirmPasswordBtnConfig()
        viewLine2Config()
        
        checkBtnConfig()
        rememberMeLBLConfig()
        
        conttinueBtnConfig()
    }

    private func topLBlConfig(){
        view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.heightAnchor.constraint(equalToConstant: 51)
        
        ])
    }
    
    private func instructionLBlConfig(){
        view.addSubview(instructionLabel)
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
            instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            instructionLabel.heightAnchor.constraint(equalToConstant: 51)
        
        ])
    }
    
    private func passwordLblConfig(){
        view.addSubview(passwordLabel)
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 40),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
    }
    
    private func passwordTFConfig(){
        view.addSubview(passwordTF)
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),            passwordTF.heightAnchor.constraint(equalToConstant: 41)
        ])
        
    }
    
    private func showPasswordBtnConfig(){
        view.addSubview(showPasswordBtn)
        
        showPasswordBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showPasswordBtn.centerYAnchor.constraint(equalTo: passwordTF.centerYAnchor),
            showPasswordBtn.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
            showPasswordBtn.heightAnchor.constraint(equalToConstant: 28),
            showPasswordBtn.widthAnchor.constraint(equalToConstant: 28)
        
        ])
        
        showPasswordBtn.addTarget(self, action: #selector(showConfirmPasswordBtnPressed), for: .touchUpInside)
    }
    
    @objc func showConfirmPasswordBtnPressed() {
        showPassword(button: showPasswordBtn, textField: passwordTF)
    }
    private func showConfirmPasswordBtnConfig(){
        view.addSubview(showConfirmPasswordBtn)
        
        showConfirmPasswordBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            showConfirmPasswordBtn.centerYAnchor.constraint(equalTo: confirmPasswordTF.centerYAnchor),
            showConfirmPasswordBtn.trailingAnchor.constraint(equalTo: confirmPasswordTF.trailingAnchor),
            showConfirmPasswordBtn.heightAnchor.constraint(equalToConstant: 28),
            showConfirmPasswordBtn.widthAnchor.constraint(equalToConstant: 28)
        
        ])
        
        showConfirmPasswordBtn.addTarget(self, action: #selector(showPasswordBtnPressed), for: .touchUpInside)
    }
    
    @objc func showPasswordBtnPressed() {
        showPassword(button: showConfirmPasswordBtn, textField: confirmPasswordTF)
    }
    
    private func viewLine1Config(){
        view.addSubview(viewLine1)
        
        viewLine1.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewLine1.topAnchor.constraint(equalTo: passwordTF.bottomAnchor),
            viewLine1.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
            viewLine1.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),            viewLine1.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
    private func confirmPasswordLBLConfig(){
        view.addSubview(confirmPasswordLabel)
        
        confirmPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: viewLine1.bottomAnchor, constant: 16),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            confirmPasswordLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
        
    }
    private func confirmPasswordTFConfig(){
        view.addSubview(confirmPasswordTF)
        
        confirmPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            confirmPasswordTF.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTF.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
            confirmPasswordTF.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
            confirmPasswordTF.heightAnchor.constraint(equalToConstant: 41)
        ])
        
        confirmPasswordTF.addTarget(self, action: #selector(activateContinueBtn), for: .allEditingEvents)
        
    }
    
    @objc func activateContinueBtn(){
        if checkPasswords(){
            continueBtn.isEnabled = true
            continueBtn.backgroundColor = .red
        }else{
            continueBtn.isEnabled = false
            continueBtn.backgroundColor = .gray
        }
    }
    
    private func viewLine2Config(){
        view.addSubview(viewLine2)
        
        viewLine2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewLine2.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor),
            viewLine2.leadingAnchor.constraint(equalTo: confirmPasswordTF.leadingAnchor),
            viewLine2.trailingAnchor.constraint(equalTo: confirmPasswordTF.trailingAnchor),
            viewLine2.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
    
    
    private func checkBtnConfig(){
        view.addSubview(checkBtn)
        
        checkBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkBtn.topAnchor.constraint(equalTo: viewLine2.bottomAnchor, constant: 30),
            checkBtn.leadingAnchor.constraint(equalTo: viewLine2.leadingAnchor),
            checkBtn.heightAnchor.constraint(equalToConstant: 24),
            checkBtn.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        checkBtn.addTarget(self, action: #selector(rememberMe), for: .touchUpInside)
    }
    
    private func rememberMeLBLConfig(){
        view.addSubview(rememberMeLBL)
        
        rememberMeLBL.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rememberMeLBL.centerYAnchor.constraint(equalTo: checkBtn.centerYAnchor),
            rememberMeLBL.leadingAnchor.constraint(equalTo: checkBtn.trailingAnchor, constant: 15),
            rememberMeLBL.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        rememberMeLBL.target(forAction: #selector(rememberMe), withSender: .none)
        
    }
    @objc func rememberMe(){
        check.toggle()
        checkBtnPressed()
    }
    private func conttinueBtnConfig(){
        view.addSubview(continueBtn)
        
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            continueBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            continueBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            continueBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            continueBtn.heightAnchor.constraint(equalToConstant: 58)
        ])
        continueBtn.addTarget(self, action: #selector(continueBtnPressed), for: .touchUpInside)
    }
    
    @objc func continueBtnPressed(){
        
            let vc = NotificationViewController()
            navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    private func showPassword(button: UIButton, textField: UITextField){
        textField.isSecureTextEntry.toggle()
        if !textField.isSecureTextEntry{
            button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        }
        else{
            button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        }
        
    }
    
    private func checkPasswords() -> Bool{
        guard let text = passwordTF.text else{
            return false
        }
        if text.count >= 8 && confirmPasswordTF.text == text{
            return true
        }else{
            return false
        }
    }
    
    private func checkBtnPressed(){
        if check{
            checkBtn.setImage(UIImage(systemName: "checkmark"), for: .normal)
        }else{
            checkBtn.setImage(.none, for: .normal)
        }

    }
}

