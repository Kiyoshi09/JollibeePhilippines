//
//  SignUpViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/06.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var tvPhone: UITextField!
    @IBOutlet weak var tvName: UITextField!
    @IBOutlet weak var tvBirthday: UITextField!
    @IBOutlet weak var tvGender: UITextField!
    @IBOutlet weak var tvFamilySize: UITextField!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var stopTrace: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.applicationIconBadgeNumber = 0

        // Do any additional setup after loading the view.
        tvPhone.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvPhone.layer.borderWidth = 1.2
        tvPhone.layer.cornerRadius = 5.0
        tvPhone.layer.masksToBounds = true
        
        tvName.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvName.layer.borderWidth = 1.2
        tvName.layer.cornerRadius = 5.0
        tvName.layer.masksToBounds = true
        
        tvBirthday.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvBirthday.layer.borderWidth = 1.2
        tvBirthday.layer.cornerRadius = 5.0
        tvBirthday.layer.masksToBounds = true
        
        tvGender.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvGender.layer.borderWidth = 1.2
        tvGender.layer.cornerRadius = 5.0
        tvGender.layer.masksToBounds = true
        
        tvFamilySize.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvFamilySize.layer.borderWidth = 1.2
        tvFamilySize.layer.cornerRadius = 5.0
        tvFamilySize.layer.masksToBounds = true
        
        TealiumHelper.shared.trackView(title: "signup-view", data: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onStopTrace(_ sender: Any) {
        TealiumHelper.shared.leaveTrace()
    }
    
    @IBAction func onNextScreen(_ sender: Any) {
        
        // Phone Number = Visitor_ID
        let _userId = tvPhone.text == nil ? "" : tvPhone.text

        if _userId?.isEmpty == false {
            TealiumHelper.shared.tealium?.dataLayer.add(data: ["mobile_number": _userId!], expiry: .forever)
        }
        
        // Name
        let _name = tvName.text == nil ? "" : tvName.text
        // Gender
        let _gender = tvGender.text == nil ? "" : tvGender.text
        // Birthday
        let _birthday = tvBirthday.text == nil ? "" : tvBirthday.text
        // Family Size
        let _family_size = tvFamilySize.text == nil ? "" : tvFamilySize.text

        TealiumHelper.shared.track(title: "signup",
                                   data: [
                                    "mobile_number": _userId!,
                                    "user_name":_name!,
                                    "birthday": _birthday!,
                                    "gender": _gender!,
                                    "family_size": _family_size!,
                                    "member_reg_date": _birthday!,
                                    "country": "Philipines",
                                    "city": "Manila"
                                   ])
        
        
        // Move to next screen
        performSegue(withIdentifier: "home2", sender: nil)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "home2" {
            let tabbar = segue.destination as? UITabBarController
            
            if let next = (tabbar?.viewControllers?.first(where: {$0 is HomeViewController}))! as? HomeViewController {
                next.prevScreen = "SignUp"
            }
        }
    }
    
    
}
