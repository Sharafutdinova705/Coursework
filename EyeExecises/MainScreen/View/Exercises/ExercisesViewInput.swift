//
//  ExercisesViewInput.swift
//  EyeExecises
//
//  Created by Гузель on 10/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol ExercisesViewInput: AnyObject {
    
    func initCountOfCoin(count: Int)
    
    func updateExercisesArray(array: [ExerciseModel])
    
    func buyExercise(index: Int)
}
