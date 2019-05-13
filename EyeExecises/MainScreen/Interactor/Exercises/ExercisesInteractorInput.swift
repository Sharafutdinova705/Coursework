//
//  ExercisesInteractorInput.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol ExercisesInteractorInput: AnyObject {
    
    func getCountOfCoin()
    
    func updateCountOfCoin(coin: Int)
    
    func updateExercise(exercise: ExerciseModel, index: Int)
    
    func getAllExercises()
    
    func buyExercise(index: Int, array: [ExerciseModel]) 
}
