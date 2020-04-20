//
//  MainTableViewCell.swift
//  SamplePOC
//
//  Created by Jaya on 20/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    var countryInfo : CountryInfo? {
        didSet {
            elementImage.image = countryInfo?.element.elementImage
            elementNameLabel.text = countryInfo?.element.elementName
            elementDescriptionLabel.text = countryInfo?.element.elementDesc
        }
    }
    //MARK:- UI Elements
    private let elementNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let elementImage : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let elementDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //MARK:- Intialiser
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(elementImage)
        contentView.addSubview(elementNameLabel)
        contentView.addSubview(elementDescriptionLabel)
        
        
        let marginGuide = contentView.layoutMarginsGuide
        
        elementImage.anchor(top: marginGuide.topAnchor, left: marginGuide.leftAnchor, bottom: marginGuide.bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight:5, width: 50, height: 0, enableInsets: false)
        elementNameLabel.anchor(top: marginGuide.topAnchor, left: elementImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight:10, width: frame.size.width , height: 0, enableInsets: false)
        elementDescriptionLabel.anchor(top: elementNameLabel.bottomAnchor, left: elementImage.rightAnchor, bottom: marginGuide.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight:10, width: frame.size.width, height: 0, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(kIntialiserError)
    }
}
