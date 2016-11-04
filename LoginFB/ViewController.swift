//
//  ViewController.swift
//  LoginFB
//
//  Created by Infraestructura on 04/11/16.
//  Copyright © 2016 Valeriano Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if FBSDKAccessToken.currentAccessToken() != nil {
            print("\tYa fue autorizada x 1ra vez\t")
            let logout = UIButton(type: .Custom)
            logout.setTitle("Logout", forState: .Normal )
            logout.center = self.view.center
            logout.addTarget(self, action: #selector(ViewController.logoutFB), forControlEvents: .TouchUpInside)
            
            
            
            
        }
        else{
        // el unrect es por si se quiere modificar la ubicacion del boton
            //let unRect = self.view.bounds
            let login:FBSDKLoginButton = FBSDKLoginButton(/*
                frame: CGRectMake(unRect.width/4, unRect.size.height/4, unRect.size.width/4, unRect.size.height/4)*/)
            login.center = self.view.center
            self.view.addSubview(login)
            login.delegate = self
            login.readPermissions = ["public_profile", "email"]
        }
    }
    
    
    func logoutFB() {
        FBSDKLoginManager().logOut()
        FBSDKAccessToken.setCurrentAccessToken(nil)
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
        if error != nil {
            print("\t\tNo se puede conectar login con fb\t\t")
            
        }
        else if result.isCancelled{
            print("\t\tEl usuario no acepta logihn con fb\t\t")
        }
        else{
            let correo = result.valueForKey("email") as! String
            //let nombre = result.valueForKey("public_profile") as! String
            print("\t\tLos campos son correo electronico: \(correo)\t pulbic profile:\(correo)\t\t")
        }
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
        
    }

    

}

