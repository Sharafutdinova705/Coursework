//
//  AchievementsInteractor.swift
//  EyeExecises
//
//  Created by Гузель on 13/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit

class AchievementsInteractor: AchievementsInteractorInput {
    
    var output: AchievementsInteractorOutput!
    var dataBase: DataBaseManagerProtocol!
    
    func obtainCountOfCoin() {
        output.updateCountOfCoinInView(coin: dataBase.obtainCoins()?.coin ?? 0)
    }
    
    func getAllAchievements() {
        
        var achievements = dataBase.obtainAchievements()
        
        if achievements == [] {
            
            achievements.append(newAchievement(name: "Average Person", information: "You should buy 3 exercises", price: 600))
            achievements.append(newAchievement(name: "Rich Person", information: "You should buy all exercises", price: 1000))
            achievements.append(newAchievement(name: "Good eyesight", information: "Check eyesight and fill the data for 7 times", price: 300))
            achievements.append(newAchievement(name: "Hawkeye", information: "Check eyesight and fill the data for 21 times", price: 700))
            achievements.append(newAchievement(name: "Millionaire", information: "Save 1000$", price: 500))
        }
        
        output.updateAchievements(achievements: achievements)
    }
    
    func newAchievement(name: String, information: String, price: Int) -> AchievementModel{
        
        let achievement = AchievementModel()
        achievement.id = getLastId() + 1
        achievement.isTaken = false
        achievement.name = name
        achievement.information = information
        achievement.price = price
        dataBase.saveItem(item: achievement)
        
        return achievement
    }
    
    func getLastId() -> Int {
        
        var allId: [Int] = []
        let exercisesArray = dataBase.obtainExercises()
        let eyesightCheckArray = dataBase.obtainEyesightCheck()
        let achievementArray = dataBase.obtainAchievements()
        let usageArray = dataBase.obtainUsageDate()
        let userModel = dataBase.obtainCoins()
        
        allId.append(userModel?.id ?? 1)
        
        for item in exercisesArray {
            allId.append(item.id)
        }
        
        for item in eyesightCheckArray {
            allId.append(item.id)
        }
        
        for item in achievementArray {
            allId.append(item.id)
        }
        
        for item in usageArray {
            allId.append(item.id)
        }
        
        return allId.max() ?? 0
    }
    
    func updateCountOfCoin(coin: Int) {
        
        let user = dataBase.obtainCoins()
        
        dataBase.performTransaction {
            
            user?.coin = (user?.coin)! + coin
        }
        
        dataBase.updateItem(item: user!)
    }
    
    func checkAchievementIsComplete(index: Int) {
        
        let achievement = dataBase.obtainAchievements()[index]
        let achievementIsTakenTitle = "Achievement is already taken"
        let firstCompleteTaskTetle = "First complete the task"
        
        switch index {
        case 0:
            
            if checkCountOfPurchasedExercises() >= 3 && !achievement.isTaken {
                
                dataBase.performTransaction {
                    achievement.isTaken = true
                }
                
                dataBase.updateItem(item: achievement)
                output.setData(data: achievement.price, information: achievement.information, name: achievement.name)
            }  else if achievement.isTaken {
                
                output.showAlert(title: achievementIsTakenTitle, information: achievement.information)
            } else {
                output.showAlert(title: firstCompleteTaskTetle, information: achievement.information)
            }
        case 1:
            
            if checkCountOfPurchasedExercises() == dataBase.obtainExercises().count && dataBase.obtainExercises().count != 0  && !achievement.isTaken {
                dataBase.performTransaction {
                    achievement.isTaken = true
                }
                
                dataBase.updateItem(item: achievement)
                output.setData(data: achievement.price, information: achievement.information, name: achievement.name)
            }  else if achievement.isTaken {
                output.showAlert(title: achievementIsTakenTitle, information: achievement.information)
            } else {
                output.showAlert(title: firstCompleteTaskTetle, information: achievement.information)
            }
        case 2:
            
            if checkCountOfEyesightCheck() >= 7  && !achievement.isTaken {
                
                dataBase.performTransaction {
                    achievement.isTaken = true
                }
                
                dataBase.updateItem(item: achievement)
                output.setData(data: achievement.price, information: achievement.information, name: achievement.name)
            }  else if achievement.isTaken {
                output.showAlert(title: achievementIsTakenTitle, information: achievement.information)
            } else {
                output.showAlert(title: firstCompleteTaskTetle, information: achievement.information)
            }
        case 3:
            
            if checkCountOfEyesightCheck() >= 21  && !achievement.isTaken {
            
                dataBase.performTransaction {
                    achievement.isTaken = true
                }
                
                dataBase.updateItem(item: achievement)
                output.setData(data: achievement.price, information: achievement.information, name: achievement.name)
            } else if achievement.isTaken {
                output.showAlert(title: achievementIsTakenTitle, information: achievement.information)
            } else {
                output.showAlert(title: firstCompleteTaskTetle, information: achievement.information)
            }
        case 4:
            
            if checkCountOfCoin() >= 1000  && !achievement.isTaken {
            
                dataBase.performTransaction {
                    achievement.isTaken = true
                }
                
                dataBase.updateItem(item: achievement)
                output.setData(data: achievement.price, information: achievement.information, name: achievement.name)
            } else if achievement.isTaken {
                output.showAlert(title: achievementIsTakenTitle, information: achievement.information)
            } else {
                output.showAlert(title: firstCompleteTaskTetle, information: achievement.information)
            }
        default:
            output.showAlert(title: firstCompleteTaskTetle, information: achievement.information)
        }
    }
    
    func checkCountOfPurchasedExercises() -> Int {
        
        let exercises = dataBase.obtainExercises()
        
        var count = 0
        
        for item in exercises {
            if item.name == "" {
                count+=1
            }
        }
        
        return count
    }
    
    func checkCountOfEyesightCheck() -> Int {
        return dataBase.obtainEyesightCheck().count
    }
    
    func checkCountOfCoin() -> Int {
        return dataBase.obtainCoins()?.coin ?? 0
    }
}
