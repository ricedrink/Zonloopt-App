//
//  StartViewController.swift
//  zonloopt
//
//  Created by Alice Zhang on 8/6/20.
//  Copyright © 2020 Alice Zhang. All rights reserved.
//

import UIKit


class StartViewController: UIViewController {

    @IBAction func joinNow(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @IBAction func login(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "logIn")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool){
     super.viewDidAppear(animated)
    }

        // Do any additional setup after loading the view.


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
