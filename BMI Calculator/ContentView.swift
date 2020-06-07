//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Sebastien REMY on 07/06/2020.
//  Copyright © 2020 MonkeyDev. All rights reserved.
//

// Reférence : https://en.wikipedia.org/wiki/Body_mass_index

import SwiftUI

struct ContentView: View {
    @State private var massEntry = ""
    @State private var heightEntry = ""
    
    var result: (String, Bool) {
        guard let mass = Double(massEntry),
            let height = Double(heightEntry) else {
                return ("Fill data with numerics values!", false)
        }
        
        if !(mass > 0 && height > 0) {
            return ("Entries must be greater than zeo!", false)
        }
        
        if mass > 200 || height > 3 {
              return ("Data out of range", false)
          }
        
        let bmi = mass / (height * height)
        let formatedImc = String(format: "%.1f",bmi)
        
        print(mass, height, bmi)
        
        var category = ""
        switch bmi {
        case ...15:
            category = "Very severely underweight"
        case 15...16:
            category = "Severely underweight"
        case 16...18.5:
            category = "Underweight"
        case 18.5...25:
            category = "Normal (healthy weight)"
        case 25...30:
            category = "Overweight"
        case 30...35:
            category = "Obese Class I (Moderately obese)"
        case 35...40:
            category = "Obese Class II (Severely obese)"
        case 40...:
            category = "Obese Class III (Very severely obese)"
        default:
            break
        }
        
        return ("IMC \(formatedImc), \(category)", true)
        
        
        
    }
    
    var body: some View {
        NavigationView {
            Form {
         
                Section  (header: Text("Data")) {
                    TextField("Mass in kilograms", text: $massEntry)
                    TextField("Height in meters", text: $heightEntry)
                    
                }
                .keyboardType(.decimalPad)
                Section (header: Text("Result")) {
                    Text("\(result.0)")
                        .bold()
                        .foregroundColor(result.1 ? .black : .red)
                }
            }
            .navigationBarTitle("BMI Calculator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
