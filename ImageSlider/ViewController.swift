//
//  ViewController.swift
//  ImageSlider
//
//  Created by 홍승표 on 1/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var imageNumber: Int = 1
    let mexImageNumber = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage(animated: false, isForward: true)
    }

    @IBAction func slideButton(_ sender: UIButton) {
        if sender == prevButton {
            imageNumber -= 1
        } else if sender == nextButton {
            imageNumber += 1
        }
        
        updateImage(animated: true, isForward: sender == nextButton)
    }
    
    func updateImage(animated: Bool, isForward: Bool) { // 방향 나타내기 isFowrad
        if imageNumber < 1 {
            imageNumber = 6
        }
        
        
        if imageNumber > mexImageNumber {
            imageNumber = 1
        }
        
        let slideImage = UIImage(named: "image\(imageNumber).png")
        // swing animation
        if animated {
            let duration: TimeInterval = 0.5
            UIView.animate(withDuration: duration) {
                // if next라면 넘어가고 else 돌아가고
                var translationX: CGFloat = 0.0
                
                if isForward {
                    translationX = -self.view.bounds.width
                } else {
                    translationX = self.view.bounds.width
                }
                
                self.imageView.transform = CGAffineTransform(translationX: translationX, y: 0)
            } completion: { _ in
                //초기화
                self.imageView.image = slideImage
                self.imageView.transform = .identity
            }
        }else {
                   imageView.image = slideImage
               }
    }
}

