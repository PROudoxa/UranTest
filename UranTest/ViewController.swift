//
//  ViewController.swift
//  UranTest
//
//  Created by Alex Voronov on 01.03.17.
//  Copyright © 2017 Alex&V. All rights reserved.
//

import UIKit

class FileTableViewCell: UITableViewCell {
   
   @IBOutlet weak var fileNameLabel: UILabel!
   @IBOutlet weak var leftTopStripeLabel: UILabel!
   @IBOutlet weak var leftBottomStripeLabel: UILabel!
   @IBOutlet weak var modDateLabel: UILabel!
   @IBOutlet weak var fileTypeImage: UIImageView!
   @IBOutlet weak var rightStripeLabel: UILabel!

}


class FileTableViewController: UITableViewController {
   
   enum fileType {
      case image
      case pdf
      case movie
      case unknown
   }
   
   var fileModel = [
      (filename: "filename1", isFolder: true, modDate: "Date1", fileType: fileType.image, isOrange: true, isBlue: true),
      (filename: "filename2", isFolder: false, modDate: "Date2", fileType: fileType.pdf, isOrange: false, isBlue: false),
      (filename: "filename3", isFolder: true, modDate: "Date3", fileType: fileType.movie, isOrange: false, isBlue: true)
   ]

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
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
      let cell = tableView.dequeueReusableCell(withIdentifier: "MobileDev", for: indexPath) as! FileTableViewCell

      cell.fileNameLabel.text = fileModel[indexPath.row].filename
      cell.modDateLabel.text = fileModel[indexPath.row].modDate
      
      //sets image depending on file type or if folder
      if fileModel[indexPath.row].isFolder {
         cell.rightStripeLabel.isHidden = false
         cell.fileTypeImage.image = UIImage(named: "ca")
      } else {
         cell.rightStripeLabel.isHidden = true
         
         switch fileModel[indexPath.row].fileType {
         case .image:
            cell.fileTypeImage.image = UIImage(named: "ua")
         case .pdf:
            cell.fileTypeImage.image = UIImage(named: "us")
         case .movie:
            cell.fileTypeImage.image = UIImage(named: "gb")
         default:
            cell.fileTypeImage.image = UIImage(named: "ca")
         }
      }
      
      //makes stripes visible/invisible and sets color if needed
      if fileModel[indexPath.row].isOrange && fileModel[indexPath.row].isBlue {
         cell.leftTopStripeLabel.isHidden = false
         cell.leftBottomStripeLabel.isHidden = false
         cell.leftTopStripeLabel.backgroundColor = UIColor.orange
         cell.leftBottomStripeLabel.backgroundColor = UIColor.blue
      }
      
      if fileModel[indexPath.row].isOrange && !fileModel[indexPath.row].isBlue {
         cell.leftTopStripeLabel.isHidden = false
         cell.leftBottomStripeLabel.isHidden = false
         cell.leftTopStripeLabel.backgroundColor = UIColor.orange
         cell.leftBottomStripeLabel.backgroundColor = UIColor.orange
      }
      
      if !fileModel[indexPath.row].isOrange && fileModel[indexPath.row].isBlue {
         cell.leftTopStripeLabel.isHidden = false
         cell.leftBottomStripeLabel.isHidden = false
         cell.leftTopStripeLabel.backgroundColor = UIColor.blue
         cell.leftBottomStripeLabel.backgroundColor = UIColor.blue
      }
      
      if !fileModel[indexPath.row].isOrange && !fileModel[indexPath.row].isBlue {
         cell.leftTopStripeLabel.isHidden = true
         cell.leftBottomStripeLabel.isHidden = true
      }
      
      return cell
   }
   
   //method when table view cell is tapped
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("You tapped cell number \(indexPath.row).")
      if !fileModel[indexPath.row].isFolder {
         print("It is just a file :)")
      } else {
         //TODO: push next controller
      }
   }
   
   //swipe menu buttons
   override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
      let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
         print("Favorite button tapped")
      }
      favorite.backgroundColor = .lightGray
      
      let link = UITableViewRowAction(style: .normal, title: "Link") { action, index in
         print("Link button tapped")
      }
      link.backgroundColor = .orange
      
      let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
         print("Delete button tapped")
      }
      delete.backgroundColor = .blue
      
      return [favorite, link, delete]
   }
   
}









