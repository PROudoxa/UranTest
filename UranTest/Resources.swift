//
//  Resources.swift
//  UranTest
//
//  Created by Alex Voronov on 02.03.17.
//  Copyright © 2017 Alex&V. All rights reserved.
//

import Foundation


protocol Resources {
   
   var fileModel:[(filename: NSString, isFolder: Bool, modDate: NSDate, fileType: SourceData.fileType, isOrange: Bool, isBlue: Bool)] { get set }
   func getFileModel() -> [(filename: NSString, isFolder: Bool, modDate: NSDate, fileType: SourceData.fileType, isOrange: Bool, isBlue: Bool)]
   
}


class SourceData: Resources {
   
   enum fileType {
      case folder
      case image
      case pdf
      case movie
      case unknown
   }
   
   var fileModel = [
      (filename: "foldername1" as NSString, isFolder: true,  modDate: NSDate(), fileType: fileType.folder,  isOrange: true,  isBlue: true),
      (filename: "filename1"   as NSString, isFolder: false, modDate: NSDate(), fileType: fileType.pdf,     isOrange: false, isBlue: false),
      (filename: "foldername2" as NSString, isFolder: true,  modDate: NSDate(), fileType: fileType.folder,  isOrange: false, isBlue: true),
      (filename: "foldername3" as NSString, isFolder: true,  modDate: NSDate(), fileType: fileType.folder,  isOrange: true,  isBlue: false),
      (filename: "filename2"   as NSString, isFolder: false, modDate: NSDate(), fileType: fileType.movie,   isOrange: false, isBlue: false),
      (filename: "filename3"   as NSString, isFolder: false, modDate: NSDate(), fileType: fileType.unknown, isOrange: false, isBlue: true),
      (filename: "filename4"   as NSString, isFolder: false, modDate: NSDate(), fileType: fileType.image,   isOrange: false, isBlue: false)
   ]
   
   func getFileModel() -> [(filename: NSString, isFolder: Bool, modDate: NSDate, fileType: SourceData.fileType, isOrange: Bool, isBlue: Bool)] {
      return fileModel
   }
   
}
