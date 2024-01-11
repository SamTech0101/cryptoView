//
//  LocalManager.swift
//  CryptoView
//
//  Created by Sepehr on 30/12/2023.
//

import Foundation
import UIKit
class LocalManager {
    private init(){}
    static let instance : LocalManager  = LocalManager()
    
    func saveImage(uiImage : UIImage , imageName : String , folderName : String){
        // create Folder
        createFolderIfNeeded(folderName: folderName)
        // get path for image
        guard let data = uiImage.pngData(),
              let url = getURLForImage(imageName: imageName, folderName:   folderName) else {return}
        // save image to path
        do {
            try   data.write(to: url)
        } catch let error {
            debugPrint("Error Solving image \(error)")
        }
    }
    
    func getImage(folderName : String , imageName : String) -> UIImage?{
        guard let url = getURLForImage(imageName: imageName, folderName: folderName)
                , FileManager.default.fileExists(atPath: url.path) else {return nil}
        return UIImage(contentsOfFile: url.path)
        
    }
    
    private func createFolderIfNeeded(folderName : String){
        guard let url = getURLForFoldr(folderName: folderName) else {return}
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try  FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
            } catch let error  {
                debugPrint("Error folderName \(folderName) \(error)")

            }
        }
        
    }
    
    
    private func getURLForFoldr(folderName : String) -> URL?{
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else{return nil}
        
        return url.appendingPathComponent(folderName)
    }
    private func getURLForImage(imageName : String , folderName : String) -> URL?{
        guard let folderURL = getURLForFoldr(folderName: folderName) else {return nil}
        return folderURL.appendingPathComponent(imageName + ".png")
    }
}
