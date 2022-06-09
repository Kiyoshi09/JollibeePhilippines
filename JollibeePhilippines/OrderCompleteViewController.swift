//
//  OrderCompleteViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/03.
//

import UIKit

class OrderCompleteViewController: UIViewController {

    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var viewInBag: UIView!
    
    @IBOutlet weak var backToHomeButton: UIButton!
    @IBOutlet weak var stopTraceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewStatus.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewStatus.layer.shadowColor = UIColor.black.cgColor
        viewStatus.layer.shadowOpacity = 0.6
        viewStatus.layer.shadowRadius = 4
        viewStatus.layer.cornerRadius = 10.0
        
        viewInBag.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewInBag.layer.shadowColor = UIColor.black.cgColor
        viewInBag.layer.shadowOpacity = 0.6
        viewInBag.layer.shadowRadius = 4
        viewInBag.layer.cornerRadius = 10.0
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: 110, y: 170))
        linePath.addLine(to: CGPoint(x: 320, y: 170))
        let lineLayer = CAShapeLayer()
        lineLayer.path = linePath.cgPath
        lineLayer.strokeColor = UIColor(red: 192/256, green: 192/256, blue: 192/256, alpha: 1.0).cgColor
        lineLayer.lineWidth = 2
        self.view.layer.addSublayer(lineLayer)
        
        let linePath2 = UIBezierPath()
        linePath2.move(to: CGPoint(x: 30, y: 430))
        linePath2.addLine(to: CGPoint(x: 390, y: 430))
        let lineLayer2 = CAShapeLayer()
        lineLayer2.path = linePath2.cgPath
        lineLayer2.strokeColor = UIColor(red: 192/256, green: 192/256, blue: 192/256, alpha: 1.0).cgColor
        lineLayer2.lineWidth = 2
        self.view.layer.addSublayer(lineLayer2)
        
        let linePath3 = UIBezierPath()
        linePath3.move(to: CGPoint(x: 90, y: 690))
        linePath3.addLine(to: CGPoint(x: 350, y: 690))
        let lineLayer3 = CAShapeLayer()
        lineLayer3.path = linePath3.cgPath
        lineLayer3.strokeColor = UIColor(red: 192/256, green: 192/256, blue: 192/256, alpha: 1.0).cgColor
        lineLayer3.lineWidth = 2
        self.view.layer.addSublayer(lineLayer3)
        
        TealiumHelper.shared.trackView(title: "order-complete", data: ["order_id": "1234", "order_total": "23.00"])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onBackToHome(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    
    @IBAction func onStopTrace(_ sender: Any) {
    }
}
