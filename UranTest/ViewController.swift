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
   }
   
   let fileModel = [
      (filename: "filename1", isFolder: true, modDate: "Date1", fileType: fileType.image, isOrange: false, isBlue: false),
      (filename: "filename2", isFolder: false, modDate: "Date2", fileType: fileType.pdf, isOrange: true, isBlue: false),
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
      
      cell.leftTopStripeLabel.isHidden = true
      cell.rightStripeLabel.isHidden = true
      cell.leftBottomStripeLabel.isHidden = true
      

      
      return cell
   }
   

   
}











