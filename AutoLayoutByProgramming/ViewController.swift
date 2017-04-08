//
//  ViewController.swift
//  AutoLayoutByProgramming
//
//  Created by Cntt11 on 4/8/17.
//  Copyright © 2017 Cntt11. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lb_Notifi: UILabel!
    
    @IBOutlet weak var txt_a: UITextField!
    @IBOutlet weak var txt_b: UITextField!
    @IBOutlet weak var txt_c: UITextField!
    @IBOutlet weak var txt_Result: UITextField!

    @IBOutlet weak var btn_Cal: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txt_Result.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btn_Cal_Action(_ sender: Any) {
        txt_Result.text = ""
        
        let a : Float = Float(txt_a.text!)!
        let b : Float = Float(txt_b.text!)!
        let c : Float = Float(txt_c.text!)!
        
        
        if(a == 0) {
            if(b == 0) {
                if (c == 0) {
                    lb_Notifi.text = "Phương trình vô số nghiệm"
                    lb_Notifi.textColor = UIColor.green
                } else {
                    lb_Notifi.text = "Phương trình vô nghiệm."
                    lb_Notifi.textColor = UIColor.red
                }
            } else {
                lb_Notifi.text = "Phương trình có 1 nghiệm"
                lb_Notifi.textColor = UIColor.blue
                
                if (c == 0) {
                    txt_Result.text = "x = 0"
                } else {
                    txt_Result.text = "x = " + String(-c/b)
                }
            }
        } else {
            if(b == 0 && c == 0) {
                lb_Notifi.text = "Phương trình có 1 nghiệm"
                lb_Notifi.textColor = UIColor.blue
                
                txt_Result.text = "x = 0"
            } else {
                PTBac2(a: a, b: b, c: c)
            }
        }
    }
    
    func PTBac2(a : Float, b : Float, c : Float) {
        let lamda = (b * b) - 4*a*c
        
        if(lamda < 0) {
            lb_Notifi.text = "Phương trình vô nghiệm";
            lb_Notifi.textColor = UIColor.red
            
            txt_Result.text = ""
        } else if (lamda == 0) {
            lb_Notifi.text = "Phương trình có nghiệm duy nhất"
            lb_Notifi.textColor = UIColor.green
            
            txt_Result.text = "x = " + String(-b / (2*a))
        } else {
            lb_Notifi.text = "Phương trình có 2 nghiệm: "
            lb_Notifi.textColor = UIColor.blue
            
            txt_Result.text = "x1 = " + String((-b + sqrtf(lamda))/(2*a)) + "; x2 = " + String((-b - sqrtf(lamda))/(2*a))
        }
    }
}

