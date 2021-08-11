//
//  ViewController.swift
//  Quixote
//
//  Created by Chahat Batra on 07/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var imageArrow: UIImageView!
    @IBOutlet weak var button2TopConstraint: NSLayoutConstraint!
    
    private var transform1: CGAffineTransform!
    private var transform2: CGAffineTransform!
    private var transform3: CGAffineTransform!
    private var transform4: CGAffineTransform!
    
    private var button1LongTapped = false
    private var button2LongTapped = false
    private var button3LongTapped = false
    private var button4LongTapped = false
    
    private var angle1: CGFloat!
    private var angle2: CGFloat!
    private var angle3: CGFloat!
    
    private var button1Clicked = false
    private var button2Clicked = false
    private var button3Clicked = false
    private var button4Clicked = false
    
    class func controller() -> ViewController {
        let controller = UIStoryboard(name: "Play", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        angle1 = CGFloat.pi / 4
        angle2 = CGFloat.pi / 2
        angle3 = CGFloat.pi
        let tapGestureForB1 = UILongPressGestureRecognizer(target: self, action: #selector(button1Pressed(gesture:)))
        button1.addGestureRecognizer(tapGestureForB1)
        let tapGestureForB2 = UILongPressGestureRecognizer(target: self, action: #selector(button2Pressed(gesture:)))
        button2.addGestureRecognizer(tapGestureForB2)
        let tapGestureForB3 = UILongPressGestureRecognizer(target: self, action: #selector(button3Pressed(gesture:)))
        button3.addGestureRecognizer(tapGestureForB3)
        let tapGestureForB4 = UILongPressGestureRecognizer(target: self, action: #selector(button4Pressed(gesture:)))
        button4.addGestureRecognizer(tapGestureForB4)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            button2TopConstraint.constant = -25
            self.rotateImageView()
        }
        else {
            button2TopConstraint.constant = -35
            self.imageArrow.layer.removeAllAnimations()
        }
    }


    func rotateImageView() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: {
            self.imageArrow.transform = self.imageArrow.transform.rotated(by: .pi / 4)
        }, completion :{finished in
           
            if finished {
                if UIDevice.current.orientation.isLandscape {
                    if self.button1LongTapped && !self.button1Clicked {
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        self.animationForButton1(angle: angle)
                    }
                    else if self.button2LongTapped && !self.button2Clicked{
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        self.animationForButton2(angle: angle)
                    } else if self.button3LongTapped && !self.button3Clicked {
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        self.animationForButton3(angle: angle)
                    } else if self.button4LongTapped && !self.button4Clicked {
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        self.animationForButton4(angle: angle)
                    } else if self.button1Clicked && self.button1LongTapped {
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        self.animationForButton3(angle: angle)
                    } else if self.button2Clicked && self.button2LongTapped {
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        self.animationForButton4(angle: angle)
                    } else if self.button3Clicked && self.button3LongTapped  {
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        self.animationForButton1(angle: angle)
                    } else if self.button4Clicked && self.button4LongTapped {
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        self.animationForButton2(angle: angle)
                    }
                    else {
                        self.rotateImageView() }
                }
            }
            else {
                self.imageArrow.transform = .identity
            }
        })
    }
    
    func animationForButton1(angle: CGFloat){
        if angle > 0 {
            if angle > angle1 && angle < angle2 {
                self.animation(angle: angle2 , duration: 0.25)
                self.animation(angle: angle3, duration: 0.5)
                self.animation(angle: -angle1, duration: 0.75)
            } else if angle > angle2 && angle < CGFloat.pi {
                self.animation(angle: angle3 , duration: 0.5)
                self.animation(angle: -angle1, duration: 0.75)
            } else if angle < angle1 {
                self.animation(angle: angle1, duration: 0.25)
                self.animation(angle: angle1, duration: 0.25)
                self.animation(angle: CGFloat.pi / 2, duration: 0.5)
                self.animation(angle: -angle1, duration: 0.25)
            } else {
                self.animation(angle: -angle1, duration: 0.5)
            }
        } else {
            if angle > -angle1 {
                self.animation(angle: -angle, duration: 0.25)
                self.animation(angle: angle2,duration: 0.5)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: -angle1, duration: 0.5)
            }
            else {
                self.animation(angle: -angle1, duration: 0.5)
            }
        }
    }
    
    func animationForButton2(angle: CGFloat) {
        if angle > 0 {
            if angle > angle1 && angle < angle2 {
                self.animation(angle: angle2, duration: 0.25)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: angle1, duration: 0.5)
            } else if angle > angle2 && angle < angle3 {
                self.animation(angle: angle3 - angle, duration: 0.25)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle:  angle1, duration: 0.25)
            } else if angle < angle1 {
                self.animation(angle:  angle1, duration: 0.5)
            }
        }
        else {
            if angle < -angle2 && angle > -angle3 {
                self.animation(angle: -angle2, duration: 0.25)
                self.animation(angle: 0, duration: 0.5)
                self.animation(angle:  angle1, duration: 0.5)
            }
            else {
                self.animation(angle: angle1, duration: 0.5)
            }
        }
    }
    
    func animationForButton3(angle: CGFloat) {
        if angle < 0 {
            if angle < -angle2 && angle > -angle3 {
                self.animation(angle: -angle2, duration: 0.25)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: 3 * angle1, duration: 0.75)
            } else if angle > -angle2 {
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: 3 * angle1, duration: 0.75)
            }
        }
        else {
            if angle > 3*angle1 && angle < angle3 {
                self.animation(angle: angle3, duration: 0.25)
                self.animation(angle: -angle2, duration: 0.5)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: 3 * angle1, duration: 0.75)
            }
            else {
                self.animation(angle: angle3 - angle, duration: 0.35)
                self.animation(angle: 3*angle1, duration: 0.25)
            }
        }
    }
    
    func animationForButton4(angle: CGFloat) {
        if angle < 0 {
            if angle > -3*angle1 && angle < -angle2 {
                self.animation(angle: -angle2, duration: 0.25)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: -3*angle1, duration: 0.25)
            } else if angle > -angle2 {
                self.animation(angle: 0, duration: 0.25)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: -3 * angle1, duration: 0.25)
            } else {
                self.animation(angle: -3 * angle1, duration: 0.25)
            }
        }
        else {
            if angle < angle2 {
                self.animation(angle: angle2, duration: 0.25)
                self.animation(angle: angle2, duration: 0.5)
                self.animation(angle: -3 * angle1, duration: 0.25)
            }
            else { self.animation(angle: -3 * angle1, duration: 0.75)}
        }
    }
    
    func animation(angle: CGFloat, duration: Double) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            self.imageArrow.transform = CGAffineTransform(rotationAngle: angle)
        })
    }
    
    func rotate1ImageView() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveLinear, animations: {
            self.imageArrow.transform = CGAffineTransform(rotationAngle: .pi/4)
        }, completion: {finished in
            if finished {
                if UIDevice.current.orientation.isLandscape {
                    if self.button1LongTapped {
                        let defaultangle = (2 * CGFloat.pi/4)
                        let transform = self.imageArrow.transform
                        let angle = atan2(transform.b, transform.a)
                        let newangle =  defaultangle - angle
                        self.imageArrow.transform = CGAffineTransform(rotationAngle: newangle)
                    }
                    else {
                        self.rotateImageView()
                    }
                } else {
                    self.imageArrow.transform = .identity
                }
            } else {
                self.rotateImageView()
            }
        })
    }
    
    @objc func button1Pressed(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            button1LongTapped = true
        } else if gesture.state == .ended {
            button1LongTapped = false
            button1Clicked = false
            self.rotateImageView()
        }
    }
    
    @objc func button2Pressed(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            button2LongTapped = true
        } else if gesture.state == .ended {
            button2LongTapped = false
            button2Clicked = false
            self.rotateImageView()
        }
    }
    
    @objc func button3Pressed(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            button3LongTapped = true
        } else if gesture.state == .ended {
            button3LongTapped = false
            button3Clicked = false
            self.rotateImageView()
        }
    }
    
    @objc func button4Pressed(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            button4LongTapped = true
        } else if gesture.state == .ended {
            button4LongTapped = false
            button4Clicked = false
            self.rotateImageView()
        }
    }
    
    @IBAction func button1Pressed(_ sender: Any) {
        button1Clicked = true
    }
    @IBAction func button2Pressed(_ sender: Any) {
        button2Clicked = true
    }
    @IBAction func button3Pressed(_ sender: Any) {
        button3Clicked = true
    }
    @IBAction func button4Presses(_ sender: Any) {
        button4Clicked = true
    }
    func stopAnimation() {
        self.imageArrow.layer.removeAllAnimations()
    }
}

extension UIView {
    private static let kRotationAnimationKey = "rotationanimationkey"
    
    func rotate(duration: Double = 1) {
        if layer.animation(forKey: UIView.kRotationAnimationKey) == nil {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Float.pi * 2.0
            rotationAnimation.duration = duration
            rotationAnimation.repeatCount = Float.infinity
            
            layer.add(rotationAnimation, forKey: UIView.kRotationAnimationKey)
        }
    }
}


