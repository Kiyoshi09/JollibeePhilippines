//
//  InitialViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/06.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var traceID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewBottom.layer.cornerRadius = 10.0
        
        TealiumHelper.shared.trackView(title: "entry-screen", data: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onSignUp(_ sender: Any) {
        
        if let _traceID = traceID.text {
            TealiumHelper.shared.joinTrace(_traceID)
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        if let _traceID = traceID.text {
            TealiumHelper.shared.joinTrace(_traceID)
        }
    }
    
    

}
