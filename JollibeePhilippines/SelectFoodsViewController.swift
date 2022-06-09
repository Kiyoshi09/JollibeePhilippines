//
//  SelectFoodsViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/03.
//

import UIKit

class SelectFoodsViewController: UIViewController {

    @IBOutlet weak var viewItem1: UIView!
    @IBOutlet weak var viewItem2: UIView!
    @IBOutlet weak var viewItem3: UIView!
    var itemImage = ""
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var stopTraceButton: UIButton!
    
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

        viewItem3.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewItem3.layer.shadowColor = UIColor.black.cgColor
        viewItem3.layer.shadowOpacity = 0.6
        viewItem3.layer.shadowRadius = 4
        viewItem3.layer.cornerRadius = 10.0
        
        TealiumHelper.shared.trackView(title: "select-foods", data: nil)
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

    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onOrderItem1(_ sender: Any) {
        TealiumHelper.shared.track(title: "click-item1", data: ["product_id": "401", "product_name": "chicken_sampler_deal"])
        
        itemImage = "item1"
        performSegue(withIdentifier: "orderInfo", sender: nil)
    }
    
    
    @IBAction func onOrderItem2(_ sender: Any) {
        TealiumHelper.shared.track(title: "click-item2", data: ["product_id": "501", "product_name": "aloha_yumburger"])
        
        itemImage = "item2"
        performSegue(withIdentifier: "orderInfo", sender: nil)
    }
    
    
    @IBAction func onOrderItem3(_ sender: Any) {
        TealiumHelper.shared.track(title: "click-item3", data: ["product_id": "601", "product_name": "10pc_chikenjoy_bucket"])
        
        itemImage = "item3"
        performSegue(withIdentifier: "orderInfo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? OrderViewController {
            vc.imageInfo = itemImage
        }
    }
    
}


