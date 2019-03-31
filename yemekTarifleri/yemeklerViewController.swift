//
//  yemeklerViewController.swift
//  yemekTarifleri
//
//  Created by Emre Erol on 31.03.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit
import Alamofire

class yemeklerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var gelecekSecim:Int!
    var apiAdres = "http://codeworktest.com/iosKitap/api.php?sec=yemekler&ID="
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiAdres += String(gelecekSecim)
        yemekListesiAl()
    }
    
    var yemeklerDizisi = NSArray()

    func yemekListesiAl(){
        
        Alamofire.request(apiAdres).responseJSON { (cevap) in
            if let json = cevap.result.value as? [String:Any]
            {
                if let error = json["error"] as? Bool {
                    if error != true {
                        if let yemekler = json["yemekler"] as? NSArray {
                            self.yemeklerDizisi = yemekler
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hucre")
        let label = cell?.viewWithTag(1) as! UILabel
        let yemekJsonObj = yemeklerDizisi[indexPath.row] as! [String:Any]
        label.text = yemekJsonObj["YEMEKADI"] as! String
        return cell!
    }
    
    var secilenYemekID = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemekJsonObj = yemeklerDizisi[indexPath.row] as! [String:Any]
        secilenYemekID = Int(yemekJsonObj["ID"] as! String)!
        performSegue(withIdentifier: "tarif", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tariflerEkrani = segue.destination as! tarifViewController
        tariflerEkrani.secilenYemek = secilenYemekID
    }
    
}
