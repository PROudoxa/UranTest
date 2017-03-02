//
//  ViewController.swift
//  UranTest
//
//  Created by Alex Voronov on 01.03.17.
//  Copyright © 2017 Alex&V. All rights reserved.
//

import UIKit


class FileTableViewController: UITableViewController {
   
   var delegate = SourceData()
   
   var fileModel: [(filename: NSString, isFolder: Bool, modDate: NSDate, fileType: SourceData.fileType, isOrange: Bool, isBlue: Bool)] = []
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      fileModel = delegate.getFileModel()
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
   
   //Cell
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
         //implement request to get content for selected folder
         
      }
   }
   
   
   // MARK: set text, icon data for cell
   
   //sets swipe menu buttons
   override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
      let swipeButtons = setSwipeButtons()
      return swipeButtons
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









