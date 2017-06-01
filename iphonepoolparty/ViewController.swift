//
//  ViewController.swift
//  iphonepoolparty
//
//  Copyright © 2017 iAchieved.it LLC. All rights reserved.
//

import UIKit

class PoolPartyTableViewCell : UITableViewCell {
  
  @IBOutlet weak var lightShowLabel: UILabel!
  @IBOutlet weak var lightShowImageView: UIView!
  
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var poolPartyTable: UITableView!
  
  let LightShows = [
    "Off",
    "On",
    "Peruvian Paradise",
    "Super Nova",
    "Northern Lights",
    "Tidal Wave",
    "Patriot Dream",
    "Desert Skies",
    "Nova",
    "Blue",
    "Green",
    "Red",
    "White",
    "Pink"
  ]
  
  let poolPartyAPI = PoolPartyAPI.sharedInstance

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.poolPartyTable.delegate   = self
    self.poolPartyTable.dataSource = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "PoolPartyCell", for: indexPath) as! PoolPartyTableViewCell
    
    let labelText = LightShows[indexPath.row]
    cell.lightShowLabel?.text = labelText
    
    let view = cell.lightShowImageView!
    
    switch labelText {
      case "Blue":
        BlueLightShow(view: view)
      case "Green":
        GreenLightShow(view: view)
      case "Red":
        RedLightShow(view: view)
      case "White":
        WhiteLightShow(view: view)
      case "Pink":
        PinkLightShow(view:view)
      default:
        ImageLightShow(named:labelText, view: view)
    }

    return cell

  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return LightShows.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let idx = indexPath
    let selection = LightShows[idx.row]
    
    let alert = UIAlertController(title: "Pool Party", message: "Are you sure?", preferredStyle:.alert)
    let cancel = UIAlertAction(title:"Cancel", style:UIAlertActionStyle.cancel)
    let ok    = UIAlertAction(title:"OK", style:UIAlertActionStyle.default) {
      (action) in
      self.poolPartyAPI.party(show:selection)
    }
    alert.addAction(ok)
    alert.addAction(cancel)
    self.present(alert, animated:true)
    

    
  }


}

