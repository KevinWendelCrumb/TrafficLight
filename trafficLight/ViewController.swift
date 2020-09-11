//
//  ViewController.swift
//  trafficLight
//
//  Created by Олеся Данилина on 20.08.2020.
//  Copyright © 2020 Lesia Danilina. All rights reserved.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    //вводим переменную актуальный свет и определяем две константы с параметром:
    // свет ВЫКЛ = яркость на 0.3 и ВКЛ = яркость на 1
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // закругляем кнопку старт
        button.layer.cornerRadius = 10
        
        //определяем изначальное состояние всех цветов, они выкл
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        print("Размер стороны доступный из viewDidLoad: ", redLight.frame.height)
    }
    
    //переопределяем родительскую функцию чтобы сделать квадраты кругами, закругляем в два раза
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
        
        print("Размер стороны доступный из viewWillLayoutSubviews: ", redLight.frame.height)
    }
    //экшн отвечающий за кнопку
    @IBAction func buttonPressed() {
        //что написано на кнопке после первого нажатия
        button.setTitle("NEXT", for: .normal)
        
        //переключатель
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOff
            currentLight = .red
        }
    }
    
}
