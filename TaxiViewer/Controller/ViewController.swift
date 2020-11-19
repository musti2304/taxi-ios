//
//  ViewController.swift
//  TaxiViewer
//
//  Created by Mustafa Yousef on 16.11.20.
//

import UIKit

protocol HPDelegate{
    func updateHalteplaetze(stationsNewArray: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HPDelegate {

    @IBOutlet weak var hpTableView: UITableView!
    @IBOutlet weak var updateHalteplatz: UIBarButtonItem!
    
    var stationsArray = [Halteplatz]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hpTableView.delegate = self
        hpTableView.dataSource = self
        
        HPService.services.hpDelegate = self
        HPService.services.fetchHalteplaetze()
        print(stationsArray)
        
    }
    
    // MARK: - Action
    
    @IBAction func updateHP(_ sender: Any) {
        HPService.services.fetchHalteplaetze()
        print(stationsArray)
    }
    
    // MARK: - HPDelegate Protocol Stubs
    
    func updateHalteplaetze(stationsNewArray: String) {
        
        do {
            
            let jsonDecoder = JSONDecoder()
            stationsArray = try jsonDecoder.decode([Halteplatz].self, from: stationsNewArray.data(using: .utf8)!)
            
        } catch {
            print(error)
    
        }
        self.hpTableView.reloadData()
    }
    
    
    // MARK: - TableView Protocol Stubs
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hpCell", for: indexPath) as! StationsTableViewCell
        
        // TODO: ask the friendly community ;-)
        // Somehow I can not access
        cell.hpName.text = stationsArray[indexPath.row].name
        cell.auftraege.text = String((stationsArray[indexPath.row].data?.auftraege)!)
        cell.einstiege.text = String((stationsArray[indexPath.row].data?.einstiege)!)
        cell.wartezeit.text = stationsArray[indexPath.row].data?.wartezeit
        
        return cell
    }

}
