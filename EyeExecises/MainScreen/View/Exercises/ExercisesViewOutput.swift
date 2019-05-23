//
//  ExercisesViewOutput.swift
//  EyeExecises
//
//  Created by Гузель on 10/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol ExercisesViewOutput: AnyObject {
    
    func getCountOfCoin()
    
    func updateCountOfCoin(coin: Int)
    
    func updateExercise(exercise: ExerciseModel, index: Int)
    
    func buyExercise(index: Int, array: [ExerciseModel])
    
    func showBuyingAlert(cell: ExercisesTableViewCell, index: Int, currentCountOfCoin: Int)
}
