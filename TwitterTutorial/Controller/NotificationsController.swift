//
//  NotificationsController.swift
//  TwitterTutorial
//
//  Created by Stephen Dowless on 1/8/20.
//  Copyright © 2020 Stephan Dowless. All rights reserved.
//

import UIKit

class NotificationsController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
}
