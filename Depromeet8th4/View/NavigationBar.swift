//
//  NavigationBar.swift
//  YoutubeExample
//
//  Created by Soso on 2020/07/03.
//  Copyright © 2020 Soso. All rights reserved.
//

import UIKit
import SnapKit
import Then

class NavigationBar: UIView {
    init(
        title: String? = nil,
        leftView: UIView? = nil,
        rightView: UIView? = nil
    ) {
        super.init(frame: .zero)
        setupViews(title: title, leftView: leftView, rightView: rightView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let imageViewLogo = UIImageView().then {
        $0.image = #imageLiteral(resourceName: "image_logo_w79h22")
        $0.contentMode = .scaleAspectFit
    }
    let labelTitle = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 18, weight: .bold)
    }

    func setupViews(
        title: String?,
        leftView: UIView?,
        rightView: UIView?
    ) {
        if let left = leftView {
            addSubview(left)
            left.snp.makeConstraints {
                $0.top.bottom.equalToSuperview()
                $0.leading.equalToSuperview().inset(8)
                $0.width.equalTo(left.snp.height)
            }
        } else {
            addSubview(imageViewLogo)
            imageViewLogo.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(18)
                $0.centerY.equalToSuperview()
            }
        }
        if let right = rightView {
            addSubview(right)
            right.snp.makeConstraints {
                $0.top.bottom.equalToSuperview()
                $0.trailing.equalToSuperview().inset(8)
                $0.width.equalTo(right.snp.height)
            }
        }
        if let title = title {
            labelTitle.text = title
            addSubview(labelTitle)
            labelTitle.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
    }
}
