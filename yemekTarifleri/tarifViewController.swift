//
//  tarifViewController.swift
//  yemekTarifleri
//
//  Created by Emre Erol on 31.03.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit
import Alamofire

class tarifViewController: UIViewController {

    var secilenYemek:Int!
    var apiAdres = "http://codeworktest.com/iosKitap/api.php?sec=yemekGetir&ID="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiAdres += String(secilenYemek)
        yemekDetayGetir()
    }
    
    @IBOutlet weak var yemekadilbl: UILabel!
    @IBOutlet weak var tariflbl: UILabel!
    
    func yemekDetayGetir(){
        
        Alamofire.request(apiAdres).responseJSON { (cevap) in
            if let json = cevap.result.value as? [String:Any] {
                if let error = json["error"] as? Bool {
                    if !error {
                        if let yemek = json["yemek"] as? [String:String] {
                            self.yemekadilbl.text = yemek["YEMEKADI"]
                            self.tariflbl.text = yemek["TARIF"]
                        }
                    }
                }
            }
        }
        
    }

}
