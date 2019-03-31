//
//  ViewController.swift
//  yemekTarifleri
//
//  Created by Emre Erol on 26.03.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var yemekTürüSecimi = 0
    
    @IBAction func corbalariGoster(_ sender: Any) {
        yemekTürüSecimi = 1
        performSegue(withIdentifier: "gofirst", sender: self)
    }
    
    @IBAction func sebzeleriGoster(_ sender: Any) {
        yemekTürüSecimi = 2
        performSegue(withIdentifier: "gofirst", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gidilecekViewController = segue.destination as! yemeklerViewController
        gidilecekViewController.gelecekSecim = yemekTürüSecimi
    }
    

}

