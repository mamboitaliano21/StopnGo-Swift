//
//  GameOverView.swift
//  StopnGo
//
//  Created by Denis Thamrin on 30/11/2014.
//  Copyright (c) 2014 ___DenisThamrin___. All rights reserved.
//

import UIKit

class GameOverView: UIView {

//MARK: Properties
    //add Property observer, everytime value changed, View need to be redrawn
    var score:Int! {
        didSet {
            setNeedsDisplay()
        }
    }
    
// MARK: Init
    func setup (){
        self.backgroundColor = nil
        //TODO: testing method, view should not appear before there is a score to be produced
        self.score = -1
    }

    override func awakeFromNib(){
        self.setup()
    }
    required init(coder aDecoder: NSCoder) {
    
        super.init(coder:aDecoder)
        self.setup()
    }

// MARK: Draw
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    
        let rect = UIBezierPath(roundedRect: self.bounds, cornerRadius: 12.0)
        rect.addClip()
        UIColor.whiteColor().setFill()
        UIRectFill(self.bounds)
        UIColor.blackColor().setStroke()
        rect.stroke()
        self.drawCorners()
    
    }
    
    func drawCorners(){
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = NSTextAlignment.Center
            var font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
 
        var text = NSAttributedString(string: String(self.score), attributes: ["NSFontAttributeName" : font,"NSParagraphStyleAttributeName": paragraphStyle])
        var textBounds:CGRect
        textBounds = CGRect(origin: CGPointMake(3, 4), size: text.size())

        text.drawInRect(textBounds)
        
    }
    

}
