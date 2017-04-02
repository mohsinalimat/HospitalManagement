//
//  PatientRegisterViewController.swift
//  HospitalManagement
//
//  Created by Aiman Abdullah Anees on 21/03/17.
//  Copyright © 2017 Aiman Abdullah Anees. All rights reserved.
//

import UIKit
import Firebase

class PatientRegisterViewController: UIViewController {

    @IBOutlet var incorrect: UILabel!
    @IBOutlet var register: UIButton!
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var re_password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
              
        username.layer.cornerRadius=3
        username.clipsToBounds=true
        
        password.layer.cornerRadius=3
        password.clipsToBounds=true
        
        re_password.layer.cornerRadius=3
        re_password.clipsToBounds=true
        
        register.layer.cornerRadius=3
        register.clipsToBounds=true
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        if  username.text != "" && password.text != "" && re_password.text != ""{
            FIRAuth.auth()?.createUser(withEmail: username.text!, password: password.text!
                , completion:{(user,error) in
                    
                    if error == nil{
                        let myVC = self.storyboard?.instantiateViewController(withIdentifier: "PatientSignUpViewController") as! PatientSignUpViewController
                        myVC.username=self.username.text!
                        myVC.password=self.password.text!
                        myVC.re_password=self.re_password.text!
                        self.navigationController?.pushViewController(myVC, animated: true)
                        
            
                    }
                    else{
                        self.incorrect.text=error?.localizedDescription
                        print(self.incorrect.text!)
                    }
            })
        }
        else{
            if password != re_password{
                self.incorrect.text="Two passwords are not matching"
                print(self.incorrect.text)
                
            }
            else{self.incorrect.text="Some fields are missing"}
        }
        

        
        
        
    }
    

}
