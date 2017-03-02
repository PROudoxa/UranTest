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
      case folder
      case image
      case pdf
      case movie
      case unknown
   }
   
   var fileModel: [(filename: NSString, isFolder: Bool, modDate: NSDate, fileType: fileType, isOrange: Bool, isBlue: Bool)] = []
   

   override func viewDidLoad() {
      super.viewDidLoad()
      
      fileModel = [
         (filename: "foldername1", isFolder: true,  modDate: NSDate(), fileType: fileType.folder,  isOrange: true,  isBlue: true),
         (filename: "filename1",   isFolder: false, modDate: NSDate(), fileType: fileType.pdf,     isOrange: false, isBlue: false),
         (filename: "foldername2", isFolder: true,  modDate: NSDate(), fileType: fileType.folder,  isOrange: false, isBlue: true),
         (filename: "foldername3", isFolder: true,  modDate: NSDate(), fileType: fileType.folder,  isOrange: true,  isBlue: false),
         (filename: "filename2",   isFolder: false, modDate: NSDate(), fileType: fileType.movie,   isOrange: false, isBlue: false),
         (filename: "filename3",   isFolder: false, modDate: NSDate(), fileType: fileType.unknown, isOrange: false, isBlue: true),
         (filename: "filename4",   isFolder: false, modDate: NSDate(), fileType: fileType.image,   isOrange: false, isBlue: false)
      ]
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
      let numberOfCell = indexPath.row
      let date = fileModel[numberOfCell].modDate as Date

      cell.fileNameLabel.text = fileModel[numberOfCell].filename as String
      
      setModifiedDateText(cell: cell, date: date)
      setImageFileType(cell: cell, numberOfCell: numberOfCell)
      setLeftStripes(cell: cell, numberOfCell: numberOfCell)
      
      return cell
   }
   
   //method when table view cell is tapped
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("You tapped cell number \(indexPath.row + 1).")
      if !fileModel[indexPath.row].isFolder {
         print("It is just a file :)")
      } else {
         //TODO: push next controller
      }
   }
   
   //sets swipe menu buttons
   override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
      let buttons = setSwipeButtons()
      return buttons
   }
   
   func setSwipeButtons() -> [UITableViewRowAction] {
      
      let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
         print("Favorite button tapped")
      }
      favorite.backgroundColor = .lightGray
      if UIImage(named: "favourite") != nil {
         favorite.backgroundColor = UIColor(patternImage: UIImage(named: "favourite")!)
      }
      
      let link = UITableViewRowAction(style: .normal, title: "Link") { action, index in
         print("Link button tapped")
      }
      link.backgroundColor = .orange
      if UIImage(named: "link") != nil {
         link.backgroundColor = UIColor(patternImage: UIImage(named: "link")!)
      }
      
      let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
         print("Delete button tapped")
      }
      delete.backgroundColor = .blue
      if UIImage(named: "delete") != nil {
         delete.backgroundColor = UIColor(patternImage: UIImage(named: "delete")!)
      }
      
      return [favorite, link, delete]
   }
   
   func setImageFileType(cell: FileTableViewCell, numberOfCell: Int) {
      
      if fileModel[numberOfCell].isFolder {
         cell.rightStripeLabel.isHidden = false
         cell.fileTypeImage.image = UIImage(named: "ca")
      } else {
         cell.rightStripeLabel.isHidden = true
         
         switch fileModel[numberOfCell].fileType {
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
   }
   
   func setModifiedDateText(cell: FileTableViewCell, date: Date) {
      let dateFormatter = DateFormatter()
      //dateFormatter.dateFormat = "yyyy-MM-dd"
      dateFormatter.dateStyle = .long
      let dateString = dateFormatter.string(from: date)
      cell.modDateLabel.text = "modified  \(dateString)"
   }
   
   func setLeftStripes(cell: FileTableViewCell, numberOfCell: Int) {
      if fileModel[numberOfCell].isOrange && fileModel[numberOfCell].isBlue {
         cell.leftTopStripeLabel.isHidden = false
         cell.leftBottomStripeLabel.isHidden = false
         cell.leftTopStripeLabel.backgroundColor = UIColor.orange
         cell.leftBottomStripeLabel.backgroundColor = UIColor.blue
      }
      
      if fileModel[numberOfCell].isOrange && !fileModel[numberOfCell].isBlue {
         cell.leftTopStripeLabel.isHidden = false
         cell.leftBottomStripeLabel.isHidden = false
         cell.leftTopStripeLabel.backgroundColor = UIColor.orange
         cell.leftBottomStripeLabel.backgroundColor = UIColor.orange
      }
      
      if !fileModel[numberOfCell].isOrange && fileModel[numberOfCell].isBlue {
         cell.leftTopStripeLabel.isHidden = false
         cell.leftBottomStripeLabel.isHidden = false
         cell.leftTopStripeLabel.backgroundColor = UIColor.blue
         cell.leftBottomStripeLabel.backgroundColor = UIColor.blue
      }
      
      if !fileModel[numberOfCell].isOrange && !fileModel[numberOfCell].isBlue {
         cell.leftTopStripeLabel.isHidden = true
         cell.leftBottomStripeLabel.isHidden = true
      }
   }
   
   
   
}









