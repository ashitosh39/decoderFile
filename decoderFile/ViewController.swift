//
//  ViewController.swift
//  decoderFile
//
//  Created by Macintosh on 03/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var datatableView: UITableView!
    var populationApi : PopulationApi?
    var datas : [Datas] = []
    private let PopulationTableViewCellIdentifire = "PopulationTableViewCell"
    var url :  URL?
    var urlRequest : URLRequest?
    var jsonDecoder : JSONDecoder?
    override func viewDidLoad() {
        super.viewDidLoad()
         
         parsingData()
    
    }


    func parsingData(){
        var url = URL(string: "https://datausa.io/api/data?drilldowns=Nation&measures=Population")
       var urlRequest = URLRequest(url: url!)
        
         
        var urlSession = URLSession(configuration: .default)
        var datatask = URLSession.shared.dataTask(with: urlRequest) { [self] data, response, error in
            self.populationApi = try! JSONDecoder().decode(PopulationApi.self, from: data!)
            self.datas = populationApi!.data
            print(self.datas)
            DispatchQueue.main.async {
                self.datatableView.reloadData()
            }
        }
        datatask.resume()
        }
    
}
extension ViewController : UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = self.datatableView.dequeueReusableCell(withIdentifier: PopulationTableViewCellIdentifire, for: indexPath) as! PopulationTableViewCell
        tableViewCell.yearLabel.text = String(datas[indexPath.row].Year)
        tableViewCell.populationLabel.text = String(datas[indexPath.row].Population)
        return tableViewCell
    }
    
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        240.00
    }
}
