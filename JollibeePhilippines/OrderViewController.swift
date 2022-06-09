//
//  OrderViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/03.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var tvName: UITextField!
    @IBOutlet weak var tvPhone: UITextField!
    @IBOutlet weak var tvAddress1: UITextField!
    @IBOutlet weak var tvAddress2: UITextField!
    @IBOutlet weak var tvEmail: UITextField!
    @IBOutlet weak var imgItem: UIImageView!
    
    var imageInfo: String = "Chickenjoy-Bucket-Treat-C"
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var stopTraceButton: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvName.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvName.layer.borderWidth = 1.2
        tvName.layer.cornerRadius = 5.0
        tvName.layer.masksToBounds = true

        tvPhone.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvPhone.layer.borderWidth = 1.2
        tvPhone.layer.cornerRadius = 5.0
        tvPhone.layer.masksToBounds = true

        tvAddress1.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvAddress1.layer.borderWidth = 1.2
        tvAddress1.layer.cornerRadius = 5.0
        tvAddress1.layer.masksToBounds = true

        tvAddress2.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvAddress2.layer.borderWidth = 1.2
        tvAddress2.layer.cornerRadius = 5.0
        tvAddress2.layer.masksToBounds = true

        tvEmail.layer.borderColor = UIColor(red: 211/256, green: 211/256, blue: 211/256, alpha: 1.0).cgColor
        tvEmail.layer.borderWidth = 1.2
        tvEmail.layer.cornerRadius = 5.0
        tvEmail.layer.masksToBounds = true

        imgItem.image = UIImage(named: imageInfo)
        
        TealiumHelper.shared.trackView(title: "order-information", data: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onOrder(_ sender: Any) {
        
        let name = tvName.text
        let phone = tvPhone.text
        let address1 = tvAddress1.text
        let address2 = tvAddress2.text
        let email = tvEmail.text
        
        TealiumHelper.shared.track(title: "click-order", data: ["name": name!, "phone": phone!, "address1": address1!, "address2": address2!, "email": email!])
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onStopTrace(_ sender: Any) {
        TealiumHelper.shared.leaveTrace()
    }
    
}
