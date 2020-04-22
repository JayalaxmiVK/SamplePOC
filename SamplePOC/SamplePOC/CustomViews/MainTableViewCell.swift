//
//  MainTableViewCell.swift
//  SamplePOC
//
//  Created by Jaya on 20/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    var element: Element? {
        didSet {
            elementImage.imageFromServerURL(urlString: element?.imageHref)
            elementNameLabel.text = element?.title
            elementDescriptionLabel.text = element?.description
        }
    }
// MARK: - UI Elements
    private let elementNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let elementImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.borderWidth = 0.5
        imgView.layer.masksToBounds = false
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        return imgView
    }()
    
    private let elementDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
// MARK: - Intialiser
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(elementImage)
        contentView.addSubview(elementNameLabel)
        contentView.addSubview(elementDescriptionLabel)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        elementImage.anchor(top: nil, left: marginGuide.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 40, height: 40, centerXval: nil, centerYval: marginGuide.centerYAnchor, enableInsets: false)
        elementNameLabel.anchor(top: marginGuide.topAnchor, left: elementImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width, height: 0, centerXval: nil, centerYval: nil, enableInsets: false)
        elementDescriptionLabel.anchor(top: elementNameLabel.bottomAnchor, left: elementImage.rightAnchor, bottom: marginGuide.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: frame.size.width, height: 0, centerXval: nil, centerYval: nil, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(kIntialiserError)
    }
}
