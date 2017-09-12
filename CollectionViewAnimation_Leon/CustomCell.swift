//
//  CustomCell.swift
//  CollectionViewAnimation_Leon
//
//  Created by lai leon on 2017/9/12.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

let imageRect = CGRect(x: 0, y: 0, width: ItemWidth, height: ItemHeight)
let textRect = CGRect(x: 0, y: ItemHeight - 40, width: ItemWidth, height: 40)

class CustomCell: UICollectionViewCell {

    let imageV: UIImageView = {
        let imageV = UIImageView(frame: imageRect)
        imageV.contentMode = .center
        imageV.clipsToBounds = true
        return imageV
    }()

    let textV: UITextView = {
        let textV = UITextView(frame: textRect)
        textV.font = UIFont.systemFont(ofSize: 14)
        textV.isUserInteractionEnabled = false
        return textV
    }()

    let backBtn: UIButton = {
        let backBtn = UIButton(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        backBtn.setImage(UIImage(named: "Back-icon"), for: .normal)
        backBtn.isHidden = true
        return backBtn
    }()

    //定义一个无参数，无返回值的闭包属性，用于处理button被点击的情况
    var backButtonTapped: (() -> ())?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        //此处不能懒加载
        backBtn.addTarget(self, action: #selector(backBtnTouch), for: .touchUpInside)
        addSubview(imageV)
        addSubview(textV)
        addSubview(backBtn)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func handleCellSelected() {
        backBtn.isHidden = false
        superview?.bringSubview(toFront: self)
    }

    func backBtnTouch() {
        backBtn.isHidden = true
        backButtonTapped!()
    }

    func prepareCell(model: CellModel) {
        imageV.frame = imageRect
        textV.frame = textRect
        imageV.image = UIImage(named: model.imageName)
        textV.text = model.title
    }
}
