//
//  StoresViewController.swift
//  JollibeePhilippines
//
//  Created by Kiyoshi Amano on 2022/06/02.
//

import UIKit

class StoresViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TealiumHelper.shared.track(title: "find-restaurant", data: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
