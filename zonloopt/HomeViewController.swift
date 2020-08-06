//
//  HomeViewController.swift
//  zonloopt
//
//  Created by Alice Zhang on 8/6/20.
//  Copyright © 2020 Alice Zhang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func logOutAction(_ sender: UIButton) {
        //send user back
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ZonLoopt")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
