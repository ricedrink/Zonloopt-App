//
//  LoginViewController.swift
//  zonloopt
//
//  Created by Alice Zhang on 8/6/20.
//  Copyright © 2020 Alice Zhang. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLogin: UITextField!
    @IBOutlet weak var passwordLogin: UITextField!
    
    
    @IBAction func logInButton(_ sender: UIButton) {
        validateInput()
    }
    
    //homepage
    @IBAction func backButtonLogin(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ZonLoopt")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
   
    //checks if you are logged in already
//    override func viewDidAppear(_ animated: Bool) {
//        checkUserInfo()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func validateInput() {
        if emailLogin.text?.isEmpty == true {
            print("No email")
            return
        }
        if passwordLogin.text?.isEmpty == true {
            print("No password")
            return
        }
        
        logIn()
    }
    
    func logIn() {
        Auth.auth().signIn(withEmail: emailLogin.text!, password: passwordLogin.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            //send user to next page
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
