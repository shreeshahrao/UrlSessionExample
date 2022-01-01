//
//  ViewController.swift
//  UrlSessionExample
//
//  Created by Shreesha Rao on 01/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var newsTableView: UITableView!
    
    let urlString = "https://newsapi.org/v2/everything?q=apple&from=2021-12-31&to=2021-12-31&sortBy=popularity&apiKey=344010347dfa44deb223198979f5e342"
    
    var newsData: [Articles] = [Articles]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
       fetch()
        
        newsTableView.dataSource = self
    
}
    
    func fetch()
    {
        
        let url = URL(string: urlString)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // check for errors
            
            if error == nil && data != nil {
                // Parse Json
                
                let decoder = JSONDecoder()
                
                do {
                    let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
                    
                    self.newsData = newsFeed.articles!
                     
                    DispatchQueue.main.async {
                        self.newsTableView.reloadData()
                    }
                }
                
                catch {
                    print(error.localizedDescription)
                }
            }
            
        }
        // Make Api Call
        dataTask.resume()
    }

    }
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        cell.nameLabel.text = newsData[indexPath.row].source?.name
        cell.titleLabel.text = newsData[indexPath.row].title
        cell.descriptionLabel.text = newsData[indexPath.row].description
        cell.linkLabel.text = newsData[indexPath.row].url
        
        return cell
    }
    
    
    
}


