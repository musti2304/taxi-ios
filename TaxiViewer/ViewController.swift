//
//  ViewController.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 16.11.20.
//

import UIKit

protocol HPDelegate{
    func updateHalteplaetze(hpNewArray: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HPDelegate {

    @IBOutlet weak var hpTableView: UITableView!
    
    var hpArray = [Halteplatz]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        HPService.services.hpDelegate = self
        HPService.services.fetchHalteplaetze()
        print(hpArray)
        
        hpTableView.delegate = self
        hpTableView.dataSource = self
        // Do any additional setup after loading the view.
        
    }
    
    
    func updateHalteplaetze(hpNewArray: String) {
        
        do {
            
            hpArray = try JSONDecoder().decode([Halteplatz].self, from: hpNewArray.data(using: .utf8)!)
            
        } catch {
            print("Failed to decode HPs!")
        }
    }
    
    

    // MARK: - Protocol Stubs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hpArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hpCell", for: indexPath)
        //cell.textLabel?.text = hpArray[indexPath.row]
        
        return cell
    }

}
