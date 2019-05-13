//
//  ExercisesPresenter.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation

class ExercisesPresenter: ExercisesViewOutput, ExercisesInteractorOutput, ExercisesRouterOutput {
    
    var view: ExercisesViewInput!
    var interactor: ExercisesInteractorInput!
    var router: ExercisesRouterInput!
    
    func getCountOfCoin() {
        interactor.getCountOfCoin()
    }
    
    func initCountOfCoin(count: Int) {
        view.initCountOfCoin(count: count)
    }
    
    func updateCountOfCoin(coin: Int) {
        interactor.updateCountOfCoin(coin: coin)
    }
    
    func updateExercise(exercise: ExerciseModel, index: Int) {
        interactor.updateExercise(exercise: exercise, index: index)
    }
    
    func updateExercisesArray(array: [ExerciseModel]) {
        view.updateExercisesArray(array: array)
    }
    
    func getAllExercises() {
        interactor.getAllExercises()
    }
    
    func buyExercise(index: Int, array: [ExerciseModel]) {
        interactor.buyExercise(index: index, array: array)
    }
    
    func buyExercise(index: Int) {
        view.buyExercise(index: index)
    }
    
    func showBuyingAlert(cell: ExercisesTableViewCell, index: Int, currentCountOfCoin: Int) {
        router.showBuyingAlert(cell: cell, index: index, currentCountOfCoin: currentCountOfCoin)
    }
}
