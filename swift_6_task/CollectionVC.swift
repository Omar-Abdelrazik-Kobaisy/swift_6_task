//
//  CollectionVC.swift
//  swift_6_task
//
//  Created by Omar on 05/02/2023.
//

import UIKit
import Kingfisher
private let reuseIdentifier = "item"

class CollectionVC: UICollectionViewController , UICollectionViewDelegateFlowLayout{

//    var movie :Result?
    
    var arr : [String]=[]
    var arr_img : [String]=[]
    override func viewDidLoad() {
        super.viewDidLoad()

        let activityindicator : UIActivityIndicatorView = UIActivityIndicatorView.init(style: .large)
        
        activityindicator.center = view.center
        
        activityindicator.startAnimating()
        
        view.addSubview(activityindicator)
        
        fetchData { res in
//            self.movie = res
            for i in 0..<(res?.items.count ?? 0){
                self.arr.append(res?.items[i].title ?? "")
                self.arr_img.append(res?.items[i].image ?? "")
            }
            DispatchQueue.main.async {
                activityindicator.stopAnimating()
                self.collectionView.reloadData()
            }
        }
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
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
//        return movie?.items.count ?? 0
        return arr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
//        cell.my_label.text = movie?.items[indexPath.row].title
////        cell.my_img.image = UIImage(named: "H")
////        guard let str = movie?.items[indexPath.row].image else {return cell}
//        if let str = movie?.items[indexPath.row].image {
//            let url = URL(string: str)
//            cell.my_img.kf.setImage(with: url)
//        }else {
//            return cell
//        }
//        let url = URL(string: str)
//        cell.my_img.kf.setImage(with: url)
//        cell.configureCell(movie: (movie?.items[indexPath.row])! )
        // Configure the cell
    
        cell.my_label.text = arr[indexPath.row]
        let str = arr_img[indexPath.row]
        let url = URL(string: str)
                cell.my_img.kf.setImage(with: url)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        return CGSize(width: 180, height: 150)
        return CGSize(width: UIScreen.main.bounds.width/2.08, height: 130)
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
