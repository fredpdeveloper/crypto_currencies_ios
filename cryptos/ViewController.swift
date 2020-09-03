//
//  ViewController.swift
//  cryptos
//
//  Created by fredy puente on 30-08-20.
//  Copyright © 2020 fredy puente. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   
    @IBOutlet var tableView:UITableView!
    var tickers = [Ticker]()
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        downloadDataFromAPI()
    }
    
    //GET TICKER
    func downloadDataFromAPI(){
        let request = AF.request("https://api.cryptomkt.com/v1/ticker")
        // 2
        request.responseDecodable(of: Tickers.self) { (response) in
          guard let tickers = response.value else { return }
          self.tickers = tickers.all
          self.tableView.reloadData()
        }
        
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tickers.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier,for: indexPath)
        // set the text from the data model
        cell.textLabel?.text = self.tickers[indexPath.row].market
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }


}



