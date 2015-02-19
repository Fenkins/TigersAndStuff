//
//  ViewController.swift
//  tigersAndStuff
//
//  Created by Fenkins on 10/02/15.
//  Copyright (c) 2015 Fenkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewReceive: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactOut: UILabel!
    
    var arrTigers:[Tiger] = []
    var arrLions:[Lion] = []
    var arrCubs:[Lion] = []
    
    var currentAnimal = (species:"Tiger", index:0)
    
    var currentIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Simon"
        myTiger.breed = "bengal"
        myTiger.age = 23
        myTiger.image = UIImage (named: "bengal-simon.jpg")
//
//        myTiger.chaffNumberOfTimes(3)
//
        imageViewReceive.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        randomFactOut.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Levon"
        secondTiger.breed = "Indo-Chineese"
        secondTiger.age = 1
        secondTiger.image = UIImage (named: "indo-levon.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Henzy"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 6
        thirdTiger.image = UIImage (named: "malaya-henzy.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Sparky"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 12
        fourthTiger.image = UIImage (named: "siberian-sparky.png")
    
        arrTigers += [myTiger, secondTiger, thirdTiger, fourthTiger]
//
//        myTiger.chaffNumberOfTimes(3, isLoud: false)
//        println("\(myTiger.tigerAge(myTiger.age))")
        
        
// lets add some Lions, shall we?
        var lion = Lion()
        lion.age = 4
        lion.name = "Mufasa"
        lion.image = UIImage(named: "Lion.jpg")
        lion.isAlphaMale = false
        lion.subspecies = "West African"
        println("Lion age is \(lion.age) and the lion name is \(lion.name) and the lion subspecies is \(lion.subspecies)")
        lion.changeToAlpha()
//        println("\(lion.isAlphaMale)")
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.name = "Sarabi"
        lioness.image = UIImage(named: "Lioness.jpg")
        lioness.subspecies = "Barbarres"
        
        self.arrLions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        
        lionCub.rubLionCubsBelly()
        
        lionCub.roar()
        lionCub.superRoar()
        
        var lionCubFemale = LionCub()
        lionCubFemale.age = 1
        lionCubFemale.name = "Nami"
        lionCubFemale.image = UIImage(named: "LionCub2.jpg")
        lionCubFemale.subspecies = "Masai"
        
        self.arrCubs += [lionCub, lionCubFemale]
//
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//these two guys doing all the work =)
    func updateAnimal (){
        switch currentAnimal {
        case("Tiger",_):
            let randomIndex = Int(arc4random_uniform(UInt32(arrLions.count)))
            currentAnimal = ("Lion", randomIndex)
        case("Lion",_):
            let randomIndex = Int(arc4random_uniform(UInt32(arrCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(arrTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    func updateView () {
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                
                if self.currentAnimal.species == "Tiger" {
                    let tiger = self.arrTigers[self.currentAnimal.index]
                    self.imageViewReceive.image = tiger.image
                    self.breedLabel.text = tiger.breed
                    self.ageLabel.text = "\(tiger.age)"
                    self.nameLabel.text = tiger.name
                    self.randomFactOut.text = tiger.randomFact()
                    self.randomFactOut.hidden = false
                }
                else if self.currentAnimal.species == "Lion" {
                    let lion = self.arrLions[self.currentAnimal.index]
                    self.imageViewReceive.image = lion.image
                    self.breedLabel.text = lion.subspecies
                    self.ageLabel.text = "\(lion.age)"
                    self.nameLabel.text = lion.name
                    self.randomFactOut.hidden = true
                    }
                else if self.currentAnimal.species == "LionCub" {
                    let lioncub = self.arrCubs[self.currentAnimal.index]
                    self.imageViewReceive.image = lioncub.image
                    self.breedLabel.text = lioncub.subspecies
                    self.ageLabel.text = "\(lioncub.age)"
                    self.nameLabel.text = lioncub.name
                    self.randomFactOut.hidden = true
                }
                
            }, completion: {
                (finished: Bool) -> () in })
    }
    
    @IBAction func nextButtonAction(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
    }

    
//updateTiger currently not in use
func updateTiger() {
        
        var randomIndex:Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(arrTigers.count)))
        } while currentIndex == randomIndex
        currentIndex = randomIndex
        
        
        let currentTiger = arrTigers[randomIndex]
        
        //        imageViewReceive.image = currentTiger.image
        //        nameLabel.text = currentTiger.name
        //        ageLabel.text = "\(currentTiger.age)"
        //        breedLabel.text = currentTiger.breed
        
        
    UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve,
        animations: {
            
            self.imageViewReceive.image = currentTiger.image
            self.nameLabel.text = currentTiger.name
            self.ageLabel.text = "\(currentTiger.age)"
            self.breedLabel.text = currentTiger.breed
            self.randomFactOut.text = currentTiger.randomFact()
            
        }, completion: {
            (finished: Bool) -> () in })
    }

}

