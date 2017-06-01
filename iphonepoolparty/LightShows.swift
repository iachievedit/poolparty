//
//  LightShows.swift
//  iphonepoolparty
//
//  Copyright © 2017 iAchieved.it LLC. All rights reserved.
//

import Foundation
import UIKit

func BlueLightShow(view:UIView) {
  
  let color: UIColor = UIColor(red:   CGFloat(1/255.0),
                               green: CGFloat(109/255.0),
                               blue:  CGFloat(183/255.0),
                               alpha: CGFloat(1.0) )
  SolidLightShow(color: color, view: view)
}

func GreenLightShow(view:UIView) {
  
  let color: UIColor = UIColor(red:   CGFloat(19/255.0),
                               green: CGFloat(150/255.0),
                               blue:  CGFloat(75/255.0),
                               alpha: CGFloat(1.0) )
  SolidLightShow(color: color, view: view)
}

func RedLightShow(view:UIView) {
  
  let color: UIColor = UIColor(red:   CGFloat(223/255.0),
                               green: CGFloat(19/255.0),
                               blue:  CGFloat(52/255.0),
                               alpha: CGFloat(1.0) )
  SolidLightShow(color: color, view: view)
}

func WhiteLightShow(view:UIView) {
  
  let color: UIColor = UIColor(red:   CGFloat(251/255.0),
                               green: CGFloat(242/255.0),
                               blue:  CGFloat(241/255.0),
                               alpha: CGFloat(1.0) )
  SolidLightShow(color: color, view: view)
}

func PinkLightShow(view:UIView) {
  
  let color: UIColor = UIColor(red:   CGFloat(160/255.0),
                               green: CGFloat(17/255.0),
                               blue:  CGFloat(130/255.0),
                               alpha: CGFloat(1.0) )
  SolidLightShow(color: color, view: view)
}

func SolidLightShow(color:UIColor, view:UIView) {
  let path = UIBezierPath()
  
  for x in 0...Int(view.bounds.width) {
    path.move(to: CGPoint(x: x, y: 0))
    path.addLine(to: CGPoint(x: CGFloat(x), y: view.bounds.height))
  }
  
  let shapeLayer = CAShapeLayer()
  shapeLayer.path = path.cgPath
  shapeLayer.strokeColor = color.cgColor
  shapeLayer.lineWidth = 1
  
  view.layer.addSublayer(shapeLayer)

}

func ImageLightShow(named:  String, view: UIView) {
  let imageName = named + ".png"
  if let image = UIImage(named:imageName) {
     let color  = UIColor(patternImage: image)
     view.backgroundColor = color
  }
}
