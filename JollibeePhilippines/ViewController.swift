//
//  ViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/05/30.
//

import UIKit
import TealiumSwift

class ViewController: UIViewController {

    @IBOutlet weak var userId: UITextField!
    @IBOutlet weak var traceId: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        TealiumHelper.shared.trackView(title: "signin-view", data: nil)
    }

    @IBAction func onNextScreen(_ sender: Any) {
        
        let _userId = userId.text == nil ? "" : userId.text
        
        if _userId?.isEmpty == false {
            TealiumHelper.shared.tealium?.dataLayer.add(data: ["userId": _userId!], expiry: .forever)
        }
        
//        if let _traceId = traceId.text {
//            TealiumHelper.shared.joinTrace(_traceId)
//        }
        
        TealiumHelper.shared.track(title: "login", data: nil)
        
        
        // Move to next screen
        performSegue(withIdentifier: "home", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "home" {
            let tabbar = segue.destination as? UITabBarController
            
            if let next = (tabbar?.viewControllers?.first(where: {$0 is HomeViewController}))! as? HomeViewController {
                next.prevScreen = "SignIn"
            }
        }
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onStopTrace(_ sender: Any) {
        TealiumHelper.shared.leaveTrace()
    }
    
}

