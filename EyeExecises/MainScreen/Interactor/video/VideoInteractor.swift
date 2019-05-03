//
//  VideoInteractor.swift
//  EyeExecises
//
//  Created by Гузель on 03/05/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import Foundation
import UIKit

class VideoInteractor: VideoInteractorInput {
    
    let duration = 1.0
    var presenter: VideoInteractorOutput!
    
    func doExercises(selfView: UIView, circleView: UIView) {
        
        let i = 0
        
        upDown(selfView: selfView, circleView: circleView, i: i)
    }
    
    func upDown(selfView: UIView, circleView: UIView, i: Int) {
        
        var a = i
        
        UIView.animate(withDuration: duration, animations: {
            
            circleView.center.y = selfView.frame.minY + (circleView.frame.height + 16)
        }) { (isFinished) in
            
            UIView.animate(withDuration: self.duration, animations: {
            circleView.center.y = selfView.frame.maxY - (circleView.frame.height + 16)
            }) { (isFinished) in
                
                a+=1
                
                if a < 5 {
                    self.upDown(selfView: selfView, circleView: circleView, i: a)
                } else {
                    self.rightLeft(selfView: selfView, circleView: circleView, i: 0)
                }
            }
        }
    }
    
    func rightLeft(selfView: UIView, circleView: UIView, i: Int) {
        
        var a = i

        UIView.animate(withDuration: duration, animations: {
            
            circleView.center.y = selfView.center.y
            circleView.center.x = selfView.frame.minX + (circleView.frame.height + 16)
        }) { (isFinished) in
            
            UIView.animate(withDuration: self.duration, animations: {
                
                circleView.center.y = selfView.center.y
                circleView.center.x = selfView.frame.maxX - (circleView.frame.height  + 16)
            }) { (isFinished) in
                
                a+=1
                
                if a < 5 {
                    self.rightLeft(selfView: selfView, circleView: circleView, i: a)
                } else {
                    self.firstDiagonal(selfView: selfView, circleView: circleView, i: 0)
                }
            }
        }
    }
    
    func firstDiagonal(selfView: UIView, circleView: UIView, i: Int) {
        
        var a = i
        
        UIView.animate(withDuration: duration, animations: {
            
            circleView.center.y = selfView.frame.minY + (circleView.frame.height + 16)
            circleView.center.x = selfView.frame.minX + (circleView.frame.height + 16)
        }) { (isFinished) in
            
            UIView.animate(withDuration: self.duration, animations: {
                
                circleView.center.y = selfView.frame.maxY - (circleView.frame.height + 16)
                circleView.center.x = selfView.frame.maxX - (circleView.frame.height + 16)
            }) { (isFinished) in
                
                a+=1
                
                if a < 5 {
                    self.firstDiagonal(selfView: selfView, circleView: circleView, i: a)
                } else {
                    self.secondDiagonal(selfView: selfView, circleView: circleView, i: 0)
                }
            }
        }
    }
    
    func secondDiagonal(selfView: UIView, circleView: UIView, i: Int) {
        
        var a = i
        
        UIView.animate(withDuration: duration, animations: {
            
            circleView.center.y = selfView.frame.minY + (circleView.frame.height + 16)
            circleView.center.x = selfView.frame.maxX - (circleView.frame.height + 16)
        }) { (isFinished) in
            
            UIView.animate(withDuration: self.duration, animations: {
            
                circleView.center.y = selfView.frame.maxY - (circleView.frame.height + 16)
                circleView.center.x = selfView.frame.minX + (circleView.frame.height + 16)
            }) { (isFinished) in
                
                a+=1
                
                if a < 5 {
                    self.secondDiagonal(selfView: selfView, circleView: circleView, i: a)
                } else {
                    self.rightSquare(selfView: selfView, circleView: circleView, i: 0)
                }
            }
        }
    }
    
    func rightSquare(selfView: UIView, circleView: UIView, i: Int) {
        
        var a = i
        
        UIView.animate(withDuration: duration, animations: {
            
            circleView.center.y = selfView.frame.minY + (circleView.frame.height + 16)
            circleView.center.x = selfView.frame.minX + (circleView.frame.height + 16)
        }) { (isFinished) in
            
            UIView.animate(withDuration: self.duration, animations: {
                
                circleView.center.y = selfView.frame.minY + (circleView.frame.height + 16)
                circleView.center.x = selfView.frame.maxX - (circleView.frame.height + 16)
            }) { (isFinished) in
                
                UIView.animate(withDuration: self.duration, animations: {
                    
                    circleView.center.y = selfView.frame.maxY - (circleView.frame.height + 16)
                    circleView.center.x = selfView.frame.maxX - (circleView.frame.height + 16)
                }) { (isFinished) in
                    
                    UIView.animate(withDuration: self.duration, animations: {
                        
                        circleView.center.y = selfView.frame.maxY - (circleView.frame.height + 16)
                        circleView.center.x = selfView.frame.minX + (circleView.frame.height + 16)
                    }) { (isFinished) in
                        
                        a+=1
                        
                        if a < 5 {
                            self.rightSquare(selfView: selfView, circleView: circleView, i: a)
                        } else {
                            self.leftSquare(selfView: selfView, circleView: circleView, i: 0)
                        }
                    }
                }
            }
        }
    }
    
    func leftSquare(selfView: UIView, circleView: UIView, i: Int) {
        
        var a = i
        
        UIView.animate(withDuration: duration, animations: {
            
            circleView.center.y = selfView.frame.maxY - (circleView.frame.height + 16)
            circleView.center.x = selfView.frame.minX + (circleView.frame.height + 16)
        }) { (isFinished) in
            
            UIView.animate(withDuration: self.duration, animations: {
                
                circleView.center.y = selfView.frame.maxY - (circleView.frame.height + 16)
                circleView.center.x = selfView.frame.maxX - (circleView.frame.height + 16)
            }) { (isFinished) in
                
                UIView.animate(withDuration: self.duration, animations: {
                    
                    circleView.center.y = selfView.frame.minY + (circleView.frame.height + 16)
                    circleView.center.x = selfView.frame.maxX - (circleView.frame.height + 16)
                }) { (isFinished) in
                    
                    UIView.animate(withDuration: self.duration, animations: {
                        
                        circleView.center.y = selfView.frame.minY + (circleView.frame.height + 16)
                        circleView.center.x = selfView.frame.minX + (circleView.frame.height + 16)
                    }) { (isFinished) in
                        
                        a+=1
                        
                        if a < 5 {
                            self.leftSquare(selfView: selfView, circleView: circleView, i: a)
                        } else {
                            
                            UIView.animate(withDuration: self.duration, animations: {
                                
                                circleView.center.y = selfView.frame.maxY - (circleView.frame.height + 16)
                                circleView.center.x = selfView.frame.minX + (circleView.frame.height + 16)
                            })
                            
                            self.rightCircle(selfView: selfView, circleView: circleView, i: 0, t: 0, isStart: true)
                        }
                    }
                }
            }
        }
    }
    
    func rightCircle(selfView: UIView, circleView: UIView, i: Int, t: Int, isStart: Bool) {
        
        var isStartCircle = isStart
        
        UIView.animate(withDuration: 0.0004, animations: {
            
            if isStart {
                
                if t <= Int(round(selfView.frame.width)) {
                    
                    for y in 0...Int(round(selfView.center.y)) {
                        
                        if round(sqrt((selfView.center.y - CGFloat(y))*(selfView.center.y - CGFloat(y)) + (selfView.center.x - CGFloat(t))*(selfView.center.x - CGFloat(t)))) == selfView.frame.width / 2 - circleView.frame.width - 16 {
                            
                            circleView.center.x = CGFloat(t)
                            circleView.center.y = CGFloat(y)
                        }
                    }
                } else {
                    isStartCircle = false
                }
            } else {
                
                if t >= Int(round(circleView.frame.width + 16)) {
                    
                    for y in Int(round(selfView.center.y))...Int(round(selfView.frame.maxY)) {
                        
                        if round(sqrt((selfView.center.y - CGFloat(y))*(selfView.center.y - CGFloat(y)) + (selfView.center.x - CGFloat(t))*(selfView.center.x - CGFloat(t)))) == selfView.frame.width / 2 - circleView.frame.width - 16  {
                        
                            circleView.center.x = CGFloat(t)
                            circleView.center.y = CGFloat(y)
                        }
                    }
                } else {
                    isStartCircle = true
                }
            }
        }) { (isFinished) in
            
            var l = i
            
            if isStartCircle && t <= Int(selfView.frame.width) {
                self.rightCircle(selfView: selfView, circleView: circleView, i: i, t: t+1, isStart: isStartCircle)
            } else if !isStartCircle && t > Int(circleView.frame.width + 16) {
                self.rightCircle(selfView: selfView, circleView: circleView, i: i, t: t-1, isStart: isStartCircle)
            } else if t == Int(circleView.frame.width + 16) {
                
                l = i + 1
                
                if i < 5 {
                    self.rightCircle(selfView: selfView, circleView: circleView, i: l, t: t+1, isStart: true)
                } else {
                    self.leftCircle(selfView: selfView, circleView: circleView, i: 0, t: 0, isStart: false)
                }
            }
        }
    }
    
    func leftCircle(selfView: UIView, circleView: UIView, i: Int, t: Int, isStart: Bool) {
        
        var isStartCircle = isStart
        
        UIView.animate(withDuration: 0.004, animations: {
            
            if isStart {
                
                if t >= Int(round(circleView.frame.width + 16)) {
                    
                    for y in 0...Int(round(selfView.center.y)) {
                        
                        if round(sqrt((selfView.center.y - CGFloat(y))*(selfView.center.y - CGFloat(y)) + (selfView.center.x - CGFloat(t))*(selfView.center.x - CGFloat(t)))) == selfView.frame.width / 2 - circleView.frame.width - 16 {
                            
                            circleView.center.x = CGFloat(t)
                            circleView.center.y = CGFloat(y)
                        }
                    }
                } else {
                    isStartCircle = false
                }
            } else {
                
                if t <= Int(round(selfView.frame.width)) {
                    
                    for y in Int(round(selfView.center.y))...Int(round(selfView.frame.maxY)) {
                        
                        if round(sqrt((selfView.center.y - CGFloat(y))*(selfView.center.y - CGFloat(y)) + (selfView.center.x - CGFloat(t))*(selfView.center.x - CGFloat(t)))) == selfView.frame.width / 2 - circleView.frame.width - 16  {
                        
                            circleView.center.x = CGFloat(t)
                            circleView.center.y = CGFloat(y)
                        }
                    }
                } else {
                    isStartCircle = true
                }
            }
        }) { (isFinished) in
            
            var l = i
            
            if !isStartCircle && t <= Int(selfView.frame.width) {
                self.leftCircle(selfView: selfView, circleView: circleView, i: i, t: t+1, isStart: isStartCircle)
            } else if isStartCircle && t > Int(circleView.frame.width + 16) {
                self.leftCircle(selfView: selfView, circleView: circleView, i: i, t: t-1, isStart: isStartCircle)
            }else if t == Int(circleView.frame.width + 16) {
                
                l = i + 1
                
                if i < 5 {
                    self.leftCircle(selfView: selfView, circleView: circleView, i: l, t: t-1, isStart: true)
                } else {
                    self.rightButterfly(selfView: selfView, circleView: circleView, i: 0)
                }
            }
        }
    }
    
    func rightButterfly(selfView: UIView, circleView: UIView, i: Int) {
        
        UIView.animate(withDuration: duration, animations: {
            
            circleView.center.y = selfView.center.y + 60
            circleView.center.x = circleView.frame.width + 16
        }) { (isFinished) in
            
            UIView.animate(withDuration: self.duration, animations: {
                
                circleView.center.y = selfView.center.y - 60
                circleView.center.x = selfView.frame.maxX - (circleView.frame.width + 16)
            }) { (isFinished) in
                
                UIView.animate(withDuration: self.duration, animations: {
                    
                    circleView.center.y = selfView.center.y + 60
                    circleView.center.x = selfView.frame.maxX - (circleView.frame.width + 16)
                }) { (isFinished) in
                    
                    UIView.animate(withDuration: self.duration, animations: {
                        
                        circleView.center.y = selfView.center.y - 60
                        circleView.center.x = circleView.frame.width + 16
                    }) { (isFinished) in
                        
                        if i < 5 {
                            self.rightButterfly(selfView: selfView, circleView: circleView, i: i + 1)
                        } else {
                            self.leftButterfly(selfView: selfView, circleView: circleView, i: 0)
                        }
                    }
                }
            }
        }
    }
    
    func leftButterfly(selfView: UIView, circleView: UIView, i: Int) {
        
        UIView.animate(withDuration: duration, animations: {
            
            circleView.center.y = selfView.center.y + 60
            circleView.center.x = selfView.frame.maxX - (circleView.frame.width + 16)
        }) { (isFinished) in
            
            UIView.animate(withDuration: self.duration, animations: {
                
                circleView.center.y = selfView.center.y - 60
                circleView.center.x = selfView.frame.maxX - (circleView.frame.width + 16)
            }) { (isFinished) in
                
                UIView.animate(withDuration: self.duration, animations: {
                    
                    circleView.center.y = selfView.center.y + 60
                    circleView.center.x = circleView.frame.width + 16
                }) { (isFinished) in
                    
                    UIView.animate(withDuration: self.duration, animations: {
                        
                        circleView.center.y = selfView.center.y - 60
                        circleView.center.x = circleView.frame.width + 16
                    }) { (isFinished) in
                        
                        if i < 5 {
                            self.leftButterfly(selfView: selfView, circleView: circleView, i: i + 1)
                        } else {
                            self.presenter.showEnd()
                        }
                    }
                }
            }
        }
    }
}
