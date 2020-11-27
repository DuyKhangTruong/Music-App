//
//  VC_LoginScreen.swift
//  MusicStreaming
//
//  Created by Nguyen Truong Duy Khang on 10/26/20.
//

import UIKit
import SnapKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
class VC_LoginScreen: UIViewController {
    
    let userID          =   MDCOutlinedTextField()
    let userPassword    =   MDCOutlinedTextField()
    let loginLabel      =   UILabel()
    let logoImage       =   UIImageView()
    let signInButton    =   UIButton()
    let signUpButton    =   UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#1c223d")
        
        
//        loginLabel.text = "Login"
//        loginLabel.textColor = .white
//        loginLabel.font = loginLabel.font.withSize(34)
//        view.addSubview(loginLabel)
//        loginLabel.snp.makeConstraints { (make) in
//            make.leading.equalToSuperview().offset(14)
//            make.top.equalToSuperview().offset(90)
//            make.height.equalTo(40)
//            make.width.equalTo(200)
//        }
//        let musicImage = UIImage(named: "Logo_Music")
//        let targetSize = CGSize(width: 750, height: 200)
//        let scaledImage = musicImage?.scalePreservingAspectRatio(targetSize: targetSize)
//        logoImage.image = scaledImage
//        view.addSubview(logoImage)
//        logoImage.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(91)
//            make.centerX.equalToSuperview()
//        }
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Logo_Music")!)
        userID.label.text = "ID"
        userID.setNormalLabelColor(.white, for: .normal)
        userID.setFloatingLabelColor(.white, for: .editing)
        userID.setTextColor(.white, for: .editing)
        userID.setOutlineColor(.white, for: .normal)
        userID.setOutlineColor(.white, for: .editing)
        userID.layer.cornerRadius = 15
        view.addSubview(userID)
        userID.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(290)
            make.centerX.equalToSuperview()
            make.height.equalTo(34)
            make.width.equalTo(350)
            
        }
        userPassword.label.text = "Password"
        userPassword.setNormalLabelColor(.white, for: .normal)
        userPassword.setFloatingLabelColor(.white, for: .editing)
        userPassword.setTextColor(.white, for: .editing)
        userPassword.setOutlineColor(.white, for: .normal)
        userPassword.setOutlineColor(.white, for: .editing)
        userPassword.layer.cornerRadius = 15
        view.addSubview(userPassword)
        userPassword.snp.makeConstraints { (make) in
            make.top.equalTo(userID.snp.bottom).offset(45)
            make.centerX.equalToSuperview()
            make.height.equalTo(34)
            make.width.equalTo(350)
        }
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.white.cgColor
        signInButton.layer.cornerRadius = 6
        signInButton.addTarget(self, action: #selector(signInTouched), for: .touchUpInside)
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(465)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(350)
        }
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.layer.cornerRadius = 6
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(signInButton.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(350)
        }
        
        

        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func signInTouched() {
        navigationController?.pushViewController(VC_HomeScreen(), animated: true)
    }
    
}
