//
//  main.swift
//  ContextDetectionWithNEAT
//
//  Created by Christian Baltzer on 07.05.20.
//  Copyright © 2020 Christian Baltzer. All rights reserved.
//
import Neat
import Foundation

var input:[[Double]] = []
var expected:[[Double]] = []

print("Erstelle Daten")
for _ in Range(1...10000){
    let temp = Create()
    input.append(temp[0] as! [Double])
    expected.append(temp[1] as! [Double])
}
print("Exporting")
ExportCSV(Data: input, Auswahl: expected)

print("Created TestData with length " + String(input.count))
/* ----------------------------------------------------------------------------------------- */

let population = 300
let fitnessGoal = Double(input.count)
var generation = 1
let allowMultithread = true


var inputLength = (input[0] as AnyObject).count
var expectedLength = (expected[0] as AnyObject).count

/* ----------------------------------------------------------------------------------------- */

var king: NGenome?

let network = Neat(inputs: inputLength!, outputs: expectedLength!, population: population, confFile: nil, multithread: allowMultithread)
var HighestFitness:Double = 0.0

while true {
    
    for _ in 1...network.populationSize {//testing entire population
        
        var sumedTotal:Double = 0.0
        
        // Test the Genome Pool
        for i in 0..<input.count {
            let output = network.run(inputs: input[i], inputCount: (input[i] as AnyObject).count, outputCount: (expected[i] as AnyObject).count)
            // TODO: Output Neu deffinieren
            if(output == expected[i]){
                sumedTotal += 1
            }
        }
        
        // Assign genome a fitness score from the test
        let currentGenomeFitness = sumedTotal
        
        // conditions
        if currentGenomeFitness > HighestFitness { HighestFitness = currentGenomeFitness }
        
        // Next
        network.nextGenome(currentGenomeFitness)
    }
    
    // Do NEAT here.
    network.epoch()
    
    king = network.getKing()
    
    //print(network.description)
    
    print("Generation: \(generation)" + " ------------- " + "mit Fitness: \(king!.fitness)")
    generation += 1
    
    if king!.fitness >= fitnessGoal * 0.80 {
        // Print out the description after the solution is found only.
        // Printing out the description before will result in an unpredictable outcome
        print(king!.description)
        break
    }
    
} //end

let fitness = network.testNetwork(genome: king!, inputs: input, expected: expected, inputCount: inputLength!, outputCount: expectedLength!, testType: .distanceSquared, info: true)
print("Fitness: \(fitness)")
