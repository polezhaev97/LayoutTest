//
//  MainViewController.swift
//  LayoutTest
//
//  Created by mbp on 14/09/2019.
//  Copyright © 2019 mbp. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    var timer: Timer?
    var counter = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 35
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(timerAction),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @objc func timerAction() {
        updateButtonText()
        if counter == 0 {
           openModalVC()
        }
    }
    
    func openModalVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let modalVC = storyboard.instantiateViewController(withIdentifier: "ModalViewControllerId")
        self.present(modalVC, animated: true, completion: {
            self.stopTimer()
            self.startButton.setTitle("Start", for: .normal)
            self.counter = 4
        })
    }
    
    func updateButtonText() {
        counter -= 1
        startButton.setTitle("\(counter)", for: .normal)
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
}
