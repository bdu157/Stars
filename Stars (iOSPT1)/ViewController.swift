//
//  ViewController.swift
//  Stars (iOSPT1)
//
//  Created by Dongwoo Pae on 5/9/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBoutlets and properties
    
    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var starsTextView: UITextView!
    
    let startController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listStars()
    }

    //IBaction and methods
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let name = starNameTextField.text,
            let distanceString = distanceTextField.text,
            let distance = Double(distanceString) else {return}
        
        self.startController.addStar(named: name, withDistance: distance)
        self.listStars()
        self.clearInput()
    }
    
    
    private func listStars() {
        var output = ""
        for star in startController.stars {
            output += "\(star.name) is \(star.distance) light years away. \n"
        }
        starsTextView.text = output
    }
    
    private func clearInput() {
        self.starNameTextField.text = ""
        self.distanceTextField.text = ""
    }
}

