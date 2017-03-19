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
   
   override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
      
      // action one
      let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
         print("Edit tapped")
      })
      editAction.backgroundColor = UIColor.blue
      editAction.accessibilityFrame.size.width = 90
      let width = editAction.accessibilityFrame.size.width
      let height = editAction.accessibilityFrame.height
      
      print("1.  width= \(width). and height= \(height)")
            if UIImage(named: "link") != nil {
               editAction.backgroundColor = UIColor(patternImage: UIImage(named: "link")!)
               let width = editAction.accessibilityFrame.width
               let height = editAction.accessibilityFrame.height
               print("2.  width= \(width). and height= \(height)")
            }
      
      // action two
      let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
         print("Delete tapped")
      })
      deleteAction.backgroundColor = UIColor.red
      
      return [editAction, deleteAction]
   }
   
   //method when table view cell is tapped
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("You tapped cell number \(indexPath.row + 1).")
      if !fileModel[indexPath.row].isFolder {
         print("It is just a file :)")
      } else {
         //TODO:
         //implement request to get content for selected folder
         
//         if let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? MyNavigationController {
//            self.navigationController?.pushViewController(secondViewController, animated: true)
//         }
         
//         let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//         let navigationController = UINavigationController(rootViewController: vc)
//         //self.present(navigationController, animated: true, completion: nil)
//         self.navigationController?.pushViewController(vc, animated: true)
////
//         let identificator = "next"
//         performSegue(withIdentifier: identificator, sender: self)
//      }
//   }
//   var k = 0
//   func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//      let destViewController: FileTableViewController = segue.destination as! FileTableViewController
//
//      print("k= \(k)  destViewController = \(destViewController)")
//      k = k + 1
//      
//   }
//   
//   func goToDifferentView() {
//      
//      self.performSegue(withIdentifier: "segue", sender: self)
//      
   }
   
   
   // MARK: set text, icon data for cell
   
   //sets swipe menu buttons
//   func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
//      let swipeButtons = setSwipeButtons()
//      return swipeButtons
//   }
//   
//   func setSwipeButtons() -> [UITableViewRowAction] {
//      
//      let favorite = UITableViewRowAction(style: .normal, title: "fav") { action, index in
//         print("Favorite button tapped")
//      }
//      favorite.backgroundColor = .lightGray
//      if UIImage(named: "favourite") != nil {
//         favorite.backgroundColor = UIColor(patternImage: UIImage(named: "favourite")!)
//      }
//      
//      let link = UITableViewRowAction(style: .normal, title: "lin") { action, index in
//         print("Link button tapped")
//      }
//      link.backgroundColor = .orange
//      if UIImage(named: "link") != nil {
//         link.backgroundColor = UIColor(patternImage: UIImage(named: "link")!)
//      }
//      
//      let delete = UITableViewRowAction(style: .normal, title: "del") { action, index in
//         print("Delete button tapped")
//      }
//      delete.backgroundColor = .blue
//      if UIImage(named: "delete") != nil {
//         delete.backgroundColor = UIColor(patternImage: UIImage(named: "delete")!)
//      }
//      
//      return [delete, link, favorite]
   }
   
   func setImageFileType(cell: FileTableViewCell, numberOfCell: Int) {
      
      if fileModel[numberOfCell].isFolder {
         cell.rightStripeLabel.isHidden = false
         cell.fileTypeImage.image = UIImage(named: "folder")
      } else {
         cell.rightStripeLabel.isHidden = true
         
         switch fileModel[numberOfCell].fileType {
         case .image:
            cell.fileTypeImage.image = UIImage(named: "image")
         case .pdf:
            cell.fileTypeImage.image = UIImage(named: "file")
         case .movie:
            cell.fileTypeImage.image = UIImage(named: "file")
         default:
            cell.fileTypeImage.image = UIImage(named: "file")
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









