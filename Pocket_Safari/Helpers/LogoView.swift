//
//  LogoView.swift
//  Pocket_Safari
//
//  Created by iOS Lab on 08/10/24.
//

import Foundation
import UIKit

class YourViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "AppLogo") // Use the name you assigned in Assets

        view.addSubview(logoImageView)

        // Set constraints
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100), // Set desired width
            logoImageView.heightAnchor.constraint(equalToConstant: 100) // Set desired height
        ])
    }
}
