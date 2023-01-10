//  ViewController.swift
//  BMI Calculator


import UIKit
//import Foundation

class CalculateViewController: UIViewController {
    
    
    var calculatorBrain = CalculatorBrain()
    
    
    @IBAction func sliderChange(_ sender: UISlider) {
        
        /*lets format the float values of the sliders to the desired number of decimal places,
         
         and update the labels with the new values using the switch statement.*/
        
        switch sender.tag {
        case 1:
            // Format the height value with two decimal places and append "m" to the end
            heightData.text = String(format: "%.2fm", sender.value)
        case 2:
            // Format the weight value as an integer and append "kg" to the end
            weightData.text = String(format: "%dkg", Int(sender.value))
        default: break
        }
        
        
    }
    
    
    // Two outlets to display the height and weight data to the user dynamically
    
    
    @IBOutlet weak var heightData: UILabel!
    @IBOutlet weak var weightData: UILabel!
    
    @IBOutlet weak var heightLabel: UISlider!
    @IBOutlet weak var weightLabel: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightLabel.value
        let weight = weightLabel.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"
        {let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
}



