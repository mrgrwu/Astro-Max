//
//  ViewController.swift
//  Astro Max
//
//  Created by Greg Wu on 4/27/19.
//  Copyright © 2019 Greg Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lensFocalLengthLabel: UILabel!
    @IBOutlet var lensFocalLengthSlider: UISlider!
    @IBOutlet var cropFactorLabel: UILabel!
    @IBOutlet var cropFactorSlider: UISlider!
    @IBOutlet var maxShutterSpeedLabel: UILabel!
    
    // Set up User Defaults and property observers to store data for variables
    let defaults = UserDefaults.standard
    
    var lensFocalLength: Int = 11 {
        didSet {
            lensFocalLengthLabel.text = String(lensFocalLength)
            defaults.set(lensFocalLength, forKey: "LensFocalLength")
        }
    }
    var cropFactor: Float = 1.5 {
        didSet {
            cropFactorLabel.text = String(format: "%.1f", cropFactor)
            defaults.set(cropFactor, forKey: "CropFactor")
        }
    }
    var maxShutterSpeed: Float = 30 {
        didSet {
            maxShutterSpeedLabel.text = String(format: "%.1f", maxShutterSpeed)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Read User Defaults data for variables if it exists
        if defaults.integer(forKey: "LensFocalLength") != 0 {
            lensFocalLength = defaults.integer(forKey: "LensFocalLength")
            lensFocalLengthSlider.setValue(Float(lensFocalLength), animated: true)
        }
        if defaults.float(forKey: "CropFactor") != 0.0 {
            cropFactor = defaults.float(forKey: "CropFactor")
            cropFactorSlider.setValue(cropFactor, animated: true)
        }
        
        calculateShutterSpeed()
    }
    
    @IBAction func lensChanged(_ sender: UISlider) {
        lensFocalLength = Int(sender.value)
        calculateShutterSpeed()
    }
    
    @IBAction func cropFactorChanged(_ sender: UISlider) {
        cropFactor = round(sender.value * 10) / 10
        calculateShutterSpeed()
    }
    
    func calculateShutterSpeed() {
        maxShutterSpeed = 500 / Float(lensFocalLength) / cropFactor
    }
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Info") as? InfoViewController {
            present(vc, animated: true)
        }
    }
    
}

