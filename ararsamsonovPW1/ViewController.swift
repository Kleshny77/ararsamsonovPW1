//
//  ViewController.swift
//  ararsamsonovPW1
//
//  Created by Артём on 09.10.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUniqueColors(views)
        setCornerRadius(views)
    }
    
    @IBAction func buttonWasPressed(_ sender: Any) {
        let button = sender as? UIButton
        
        button?.isEnabled = false
        setAnimates(views, button)
        
    }
    
    
}

extension ViewController {
    func setUniqueColors(_ views: [UIView]) {
        var uniqueColors: Set<UIColor> = getUniqueColors(views.count)
        
        for view in views {
            view.backgroundColor = uniqueColors.popFirst()
        }
    }
    
    func getUniqueColors(_ viewsCount: Int) -> Set<UIColor> {
        var colorsSet = Set<UIColor>()
        
        for _ in 0..<viewsCount {
            colorsSet
                .insert(
                    UIColor(
                        displayP3Red: .random(in: 0...1),
                        green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1
                    )
                )
        }
        return colorsSet
    }
    
    func setCornerRadius(_ views: [UIView]) {
        for view in views {
            view.layer.cornerRadius = .random(in: 0...40)
        }
    }
    
    func setAnimates(_ views: [UIView], _ button: UIButton?) {
        UIView.animate(
            withDuration: 0.5,
            animations: {
                self.setUniqueColors(views)
                self.setCornerRadius(views)
            },
            completion: { _ in
                button?.isEnabled = true
            }
        )
    }
}
