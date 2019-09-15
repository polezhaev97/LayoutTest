//
//  ViewController.swift
//  LayoutTest
//
//  Created by mbp on 14/09/2019.
//  Copyright © 2019 mbp. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var bottomLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAtributedTextColor()
    }
    
    func setupAtributedTextColor() {
        guard let attributedText = bottomLabel.attributedText,
            let textRange = attributedText.string.range(of: "FULL FREE 7 DAYS ACCESS") else {
                return
        }
        
        let newText = NSMutableAttributedString(string: attributedText.string)
        let textColor = UIColor(red: 60.0/255, green: 200.0/255, blue: 195.0/255, alpha: 1.0)
        newText.addAttribute(.foregroundColor, value: textColor, range: NSRange(textRange, in: attributedText.string))

        bottomLabel.attributedText = newText
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

