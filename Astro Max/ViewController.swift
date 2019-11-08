//
//  ViewController.swift
//  Astro Max
//
//  Created by Greg Wu on 4/27/19.
//  Copyright © 2019 Greg Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lensFocalLengthLabel: UILabel!
    @IBOutlet weak var cropFactorLabel: UILabel!
    @IBOutlet weak var maxShutterSpeedLabel: UILabel!
    
    var lensFocalLength : Int = 11
    var cropFactor : Float = 1.5
    var maxShutterSpeed : Float = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calculateShutterSpeed()
        updateLabels()
    }
    
    @IBAction func lensChanged(_ sender: UISlider) {
        lensFocalLength = Int(sender.value)
        calculateShutterSpeed()
        updateLabels()
    }
    
    @IBAction func cropFactorChanged(_ sender: UISlider) {
        cropFactor = round(sender.value * 10) / 10
        calculateShutterSpeed()
        updateLabels()
    }
    
    func calculateShutterSpeed() {
        maxShutterSpeed = 500 / Float(lensFocalLength) / cropFactor
    }
    
    func updateLabels() {
        lensFocalLengthLabel.text = String(lensFocalLength)
        cropFactorLabel.text = String(format: "%.1f", cropFactor)
        maxShutterSpeedLabel.text = String(format: "%.1f", maxShutterSpeed)
    }


}

