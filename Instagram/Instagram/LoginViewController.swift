//
//  LoginViewController.swift
//  Instagram
//
//  Created by Ola Ogunsanya on 3/25/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var userName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = userName.text!
        let password = passWord.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {(user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSuccess", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }

    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = userName.text
        user.password = passWord.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSuccess", sender: nil)
            } else {
                print("Error:\(error?.localizedDescription)")
            }
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
