//
//  MainViewController.swift
//  FeatureMain
//
//  Created by TAE SU LEE on 10/24/24.
//  Copyright © 2024 https://github.com/tsleedev/. All rights reserved.
//

import FeatureSettings
import UIKit
import FlexLayout
import PinLayout

class MainViewController: UIViewController {
    private let rootFlexContainer = UIView()
    private let settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("설정으로 이동", for: .normal)
        return button
    }()
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
        
        rootFlexContainer.flex.direction(.row).justifyContent(.center).define { flex in
            flex.addItem(settingsButton).alignSelf(.center)
        }
        
        view.addSubview(rootFlexContainer)
        
        settingsButton.addTarget(self, action: #selector(settingsTapped), for: .touchUpInside)
    }
    
    @objc private func settingsTapped() {
        let settingsViewController = FeatureSettings.ViewControllerFactory.createSettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: MainViewController())
}
