//
//  FoodFinderTableViewController.swift
//  DIT Food Finder
//
//  Created by D7702_10 on 2018. 5. 17..
//  Copyright © 2018년 hsw. All rights reserved.
//

import UIKit

class FoodFinderTableViewController: UITableViewController{
    
    var foodStoreNames = ["늘해랑","아딸","번개반점","왕짜장","토마토도시락","홍콩반점"]
    var foodStoreImages = ["01","02","03","04","05","06"]
    var foodStoreAddress = ["부산시 진구 양정동","부산시 진구 양정동","부산시 진구 양정동","부산시 진구 양정동","부산시 진구 양정동","부산시 진구 양정동"]
    var foodstoreType = ["돼지국밥", "분식점", "중국집", "중국집", "도시락", "중국집"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "DIT 배달통"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodStoreNames.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "re", for: indexPath) as!FoodFinderTableViewCell

        cell.cellImage.image = UIImage(named: foodStoreImages[indexPath.row])
        cell.cellName.text = foodStoreNames[indexPath.row]
        cell.cellAddress.text = foodStoreAddress[indexPath.row]
        cell.cellType.text = foodstoreType[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(foodStoreNames[indexPath.row])
        
        let optionMenu = UIAlertController(title: nil, message: "뭘 원하시나요?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let callAction = UIAlertAction(title: "전화걸기", style: .default){
            (action: UIAlertAction) -> Void in
            print("전화걸기")
            
        let alertMessage = UIAlertController(title: "현재 서비스 구축중!", message: "이 번호는 없는 번호입니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertMessage.addAction(okAction)
        self.present(alertMessage, animated: true)
        }
        
        let checkinAction = UIAlertAction(title: "Check in", style: .default){
            (action: UIAlertAction) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        }
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(checkinAction)
        
        present(optionMenu, animated: true)
    }
}
