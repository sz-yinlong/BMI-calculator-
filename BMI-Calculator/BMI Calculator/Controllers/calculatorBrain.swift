
//  calculatorBrain.swift
//  BMI Calculator
import UIKit


struct CalculatorBrain{
    
    var  bmi: BMI?
    
    func getBMIValue()  -> String {
        
        let bmiTi1DecimalPlace = String(format: "%.f", bmi?.value ?? 0.0)
        return bmiTi1DecimalPlace
        
    }
    
    mutating func calculateBMI (height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more!", color: UIColor.blue)
            
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "You're fit!", color: UIColor.green)
        } else {
            print("Overweight")
            bmi = BMI(value: bmiValue, advice: "Eat less!", color: UIColor.red)
        }
        
        
        
    }
    
    
    func getAdvice () -> String {
        
        return bmi?.advice ?? "empty"
    }
    
    func getColor() -> UIColor {
        
        return bmi?.color ?? UIColor.white
        
    }
}

    


    
    
    
    
