//
//  ViewController.swift
//  FareYakalamaOyunu
//
//  Created by atakan kökçü on 23.12.2023.
//

import UIKit

class ViewController: UIViewController {
    //değişkenler
    var score=0
    var timer=Timer()
    var hideTimer=Timer()
    var counter=0
    var fareArray=[UIImageView]()
    //atamalar
    @IBOutlet weak var zamanSayac: UILabel!
    
    @IBOutlet weak var skor: UILabel!
    
    @IBOutlet weak var yuksekSkor: UILabel!
    
    @IBOutlet weak var resim1: UIImageView!
    
    @IBOutlet weak var resim2: UIImageView!
    
    @IBOutlet weak var resim3: UIImageView!
    
    @IBOutlet weak var resim4: UIImageView!
    
    @IBOutlet weak var resim5: UIImageView!
    
    @IBOutlet weak var resim6: UIImageView!
    
    @IBOutlet weak var resim7: UIImageView!
    
    @IBOutlet weak var resim8: UIImageView!
    
    @IBOutlet weak var resim9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skor.text="skor=\(score)"
        //Images
        resim1.isUserInteractionEnabled=true
        resim2.isUserInteractionEnabled=true
        resim3.isUserInteractionEnabled=true
        resim4.isUserInteractionEnabled=true
        resim5.isUserInteractionEnabled=true
        resim6.isUserInteractionEnabled=true
        resim7.isUserInteractionEnabled=true
        resim8.isUserInteractionEnabled=true
        resim9.isUserInteractionEnabled=true
        
        
        let recognizer1 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self,  action:#selector (increaseScore))
        resim1.addGestureRecognizer(recognizer1)
        resim2.addGestureRecognizer(recognizer2)
        resim3.addGestureRecognizer(recognizer3)
        resim4.addGestureRecognizer(recognizer4)
        resim5.addGestureRecognizer(recognizer5)
        resim6.addGestureRecognizer(recognizer6)
        resim7.addGestureRecognizer(recognizer7)
        resim8.addGestureRecognizer(recognizer8)
        resim9.addGestureRecognizer(recognizer9)
        fareArray=[resim1,resim2,resim3,resim4,resim5,resim6,resim7,resim8,resim9]
        
        //timer
        counter=10
        zamanSayac.text=String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(coundDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideFare), userInfo: nil, repeats: true)
       hideFare()

    }
    @objc func hideFare() {
        for fare in fareArray{
            fare.isHidden=true
           let random=Int( arc4random_uniform(UInt32(fareArray.count - 1)))
            fareArray[random].isHidden=false
        }
    }
    @objc func coundDown(){
        counter-=1
        zamanSayac.text=String(counter)
        if counter==0{
            timer.invalidate()
            let alert=UIAlertController(title: "zaman doldu", message: "tekrar oynamak istermisin", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "replay", style: UIAlertAction.Style.default) { UIAlertAction in
                self.score=0
                self.skor.text = "skor:\(self.score)"
                self.counter=10
                self.zamanSayac.text=String(self.counter)
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(self.coundDown), userInfo: nil, repeats: true)
                
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert,animated: true , completion: nil)
            
        }
    }
    
    @objc func increaseScore(){
        score += 1
        skor.text="Skor\(score)"}
    
    
    
}
