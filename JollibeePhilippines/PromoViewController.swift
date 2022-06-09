//
//  PromoViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/02.
//

import UIKit

class PromoViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var viewItem1: UIView!
    @IBOutlet weak var viewItem2: UIView!
    @IBOutlet weak var viewTapButton: UIButton!
    
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var stopTraceButton: UIButton!
    
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var viewInPopupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewItem1.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewItem1.layer.shadowColor = UIColor.black.cgColor
        viewItem1.layer.shadowOpacity = 0.6
        viewItem1.layer.shadowRadius = 4
        viewItem1.layer.cornerRadius = 10.0
        
        viewItem2.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewItem2.layer.shadowColor = UIColor.black.cgColor
        viewItem2.layer.shadowOpacity = 0.6
        viewItem2.layer.shadowRadius = 4
        viewItem2.layer.cornerRadius = 10.0
        
        TealiumHelper.shared.trackView(title: "promo", data: nil)
        
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PromoViewController.singleTap(_:)))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onStopTrace(_ sender: Any) {
        TealiumHelper.shared.leaveTrace()
    }
    
    @IBAction func onViewItem2(_ sender: Any) {
        popupView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        popupView.layer.shadowColor = UIColor.black.cgColor
        popupView.layer.shadowOpacity = 0.6
        popupView.layer.shadowRadius = 4
        popupView.layer.cornerRadius = 10.0
        
        viewInPopupView.layer.cornerRadius = 10.0
        backgroundView.isHidden = false
        popupView.isHidden = false
    }
    
    
    @objc func singleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            backgroundView.isHidden = true
            popupView.isHidden = true
        }
    }
}
