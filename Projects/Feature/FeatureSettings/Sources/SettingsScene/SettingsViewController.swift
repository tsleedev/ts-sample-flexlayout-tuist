//
//  SettingsViewController.swift
//  FeatureSettings
//
//  Created by TAE SU LEE on 10/24/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class SettingsViewController: UIViewController {
    private let rootFlexContainer = UIView()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST"
        label.textColor = .black
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        rootFlexContainer.pin.all()
        rootFlexContainer.flex.layout()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        rootFlexContainer.flex.define { flex in
            flex.addItem(titleLabel).grow(1)
        }
        
        view.addSubview(rootFlexContainer)
    }
}

@available(iOS 17.0, *)
#Preview {
    SettingsViewController()
}
