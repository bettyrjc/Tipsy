//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by BETTY JIMENEZ on 12/4/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var result: Double?
    var message:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsLabel.text = message
        totalLabel.text = String(format: "%.2f", result!)
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion:nil)
    }
}
