//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tatiana Bondarenko on 8/22/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var numberOfPeople = 2
    var tip = 0.0
    var result = "0.0"

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func updateViews() {
        totalLabel.text = result
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tip)% tip"
    }

}
