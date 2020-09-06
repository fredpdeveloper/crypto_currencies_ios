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
    
    @IBOutlet var tickerTableView:UITableView!
    var tickers = [Ticker]()
    let cellReuseIdentifier = "tickerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tickerTableView.delegate = self
        tickerTableView.dataSource = self
        downloadDataFromAPI()
    }
    
    //GET TICKER
    func downloadDataFromAPI(){
        let request = AF.request("https://api.cryptomkt.com/v1/ticker")
        // 2
        request.responseDecodable(of: Tickers.self) { (response) in
            guard let tickers = response.value else { return }
            self.tickers = tickers.all
            self.tickerTableView.reloadData()
        }
        
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tickers.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier,for: indexPath) as! TickerTVC
        // set the text from the data model
        let ticker:Ticker = self.tickers[indexPath.row]
        cell.market?.text = "  "+ticker.market
        cell.price?.text  = ticker.bid
        if(ticker.market.contains("ETH")){
            cell.imgMarket!.image = UIImage(named:"ethereum")!
        }else if(ticker.market.contains("XLM")){
            cell.imgMarket!.image = UIImage(named:"stellar")!
        }else if(ticker.market.contains("BTC")){
            cell.imgMarket!.image = UIImage(named:"bitcoin")!
        }else if(ticker.market.contains("EOS")){
            cell.imgMarket!.image = UIImage(named:"eos")!
        }
        if(ticker.market.contains("CLP")){
            cell.imgCountry!.image = UIImage(named: "chile")!
            
        }else if(ticker.market.contains("ARS")){
            cell.imgCountry!.image = UIImage(named: "argentina")!
            
        }else if(ticker.market.contains("BRL")){
            cell.imgCountry!.image = UIImage(named: "brasil")!
            
        }else if(ticker.market.contains("EUR")){
            cell.imgCountry!.image = UIImage(named: "europa")!
            
        }
        
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    
}



