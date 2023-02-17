//
//  ViewController.swift
//  swift_6_task
//
//  Created by Omar on 05/02/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData(complition: {result in
            print( result?.items[1].title ?? "" )})
    }

    func fetchData(complition:@escaping (Result?)->Void){
        let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_sd2mgk42")
        let req = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: req) { data, response, error in
            do
            {
//                let dic = try JSONSerialization.jsonObject(with: data!,options: .fragmentsAllowed) as! Dictionary<String,Any>
//
//                let items_arr = dic["items"] as! [Dictionary<String,Any>]
//
//                let items_dic = items_arr[0] as! Dictionary<String,Any>
//
//                let title = items_dic["title"] as! String
//
//                print(title)
                let res = try JSONDecoder().decode(Result.self, from: data!)
                complition(res)
                
            }catch{
                complition(nil)
                print(error)
                
            }
        }
        task.resume()
    }


}

