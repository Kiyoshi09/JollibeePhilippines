//
//  ProductViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/03.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var stopTraceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        TealiumHelper.shared.trackView(title: "view-product", data: nil)
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
    }
    
    @IBAction func onStartOrder(_ sender: Any) {
    }
}
