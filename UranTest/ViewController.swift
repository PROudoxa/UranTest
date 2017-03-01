//
//  ViewController.swift
//  UranTest
//
//  Created by Alex Voronov on 01.03.17.
//  Copyright © 2017 Alex&V. All rights reserved.
//

import UIKit

class FileTableViewController: UITableViewController {

   @IBOutlet weak var fileNameLabel: UILabel!
   @IBOutlet weak var leftTopStripeLabel: UILabel!
   @IBOutlet weak var leftBottomStripeLabel: UILabel!
   @IBOutlet weak var modDateLabel: UILabel!
   @IBOutlet weak var fileTypeImage: UIImageView!
   @IBOutlet weak var rightStripeLabel: UILabel!
   
   
   enum fileType {
      case image
      case pdf
      case movie
   }
   
//   let fileModel = [(filename: NSString, isFolder: NSString, modDate: NSDate, fileType: fileType, isOrange: Bool, isBlue: Bool)]()
   
//   let fileModel = [(name:"UA", image:"ua", render: true, fileType: fileType.image),
//                    (name:"USA", image:"us", render: false, fileType: fileType.pdf),
//                    (name:"Canada", image:"ca", render: true, fileType: fileType.movie),
//                    (name:"UK", image:"gb", render: false, fileType: fileType.image)
//   ]
   
   
   let fileModel = [
      (filename: "filename1", isFolder: true, modDate: "Date1", fileType: fileType.image, isOrange: false, isBlue: false),
      (filename: "filename2", isFolder: false, modDate: "Date2", fileType: fileType.pdf, isOrange: true, isBlue: false),
      (filename: "filename3", isFolder: true, modDate: "Date3", fileType: fileType.movie, isOrange: false, isBlue: true)
   ]

   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      
      rightStripeLabel.isHidden = true
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   
   override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return fileModel.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MobileDev", for: indexPath) as UITableViewCell
      
//      cell.textLabel?.text = fileModel[indexPath.row].filename as String
      //cell.textLabel?.text = fileModel[indexPath.row].filename
      
      fileNameLabel.text = fileModel[indexPath.row].filename
      modDateLabel.text = fileModel[indexPath.row].modDate
      
      //cell.imageView!.image = UIImage(named:fileModel[indexPath.row].image)
      
//      //TODO: indicator
//      if fileModel[indexPath.row].render {
//         //cell.imageView?.tintColor = UIColor.gray
//         print("yes")
//      } else {
//         print("no")
//      }
      
      //sets picture depending on if folder or file(and different types)
      if fileModel[indexPath.row].fileType == .image {
         //cell.imageView!.image = UIImage(named: "ua")
         fileTypeImage.image = UIImage(named: "ua")
      } else if fileModel[indexPath.row].fileType == .pdf {
         //cell.imageView!.image = UIImage(named: "us")
         fileTypeImage.image = UIImage(named: "us")
      } else if fileModel[indexPath.row].fileType == .movie {
         //cell.imageView!.image = UIImage(named: "ca")
         fileTypeImage.image = UIImage(named: "ca")
      }
      
      if fileModel[indexPath.row].isFolder {
         rightStripeLabel.isHidden = false
      }
      
      if !fileModel[indexPath.row].isOrange {
         leftTopStripeLabel.isHidden = true
      }
      
      if !fileModel[indexPath.row].isBlue {
         leftBottomStripeLabel.isHidden = true
      }
      
      
      

      return cell
   }
   

   
}











