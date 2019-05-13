//
//  ExercisesInteractorOutput.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

protocol ExercisesInteractorOutput: AnyObject {
    
    func initCountOfCoin(count : Int)
    
    func updateExercisesArray(array: [ExerciseModel])
}
