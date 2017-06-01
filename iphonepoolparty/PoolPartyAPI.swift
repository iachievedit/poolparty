//
//  PoolPartyAPIController.swift
//  iphonepoolparty
//
//  Copyright © 2017 iAchieved.it LLC. All rights reserved.
//

import Foundation
import Alamofire

class PoolPartyAPI {
  
  static let sharedInstance = PoolPartyAPI()
  
  

  
  func party(show:String) {
    let url = "http://192.168.1.161:3000/show/" + show
    if let encodedUrl = url.addingPercentEncoding(withAllowedCharacters:.urlPathAllowed) {
      print("Calling " + encodedUrl)
      SwiftSpinner.show(show)

      Alamofire.request(encodedUrl).responseJSON {_ in
        SwiftSpinner.hide()
      }
    }
  }
}
