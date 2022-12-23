//
//  ViewController.swift
//  insta-like
//
//  Created by MAC on 21/12/22.
//

import UIKit

class ViewController: UIViewController {
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "post"))
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(imageView)
        
        let size = view.frame.size.width
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.center = view.center
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap(gesture:)))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
    }
    
    @objc private func didTap(gesture: UIGestureRecognizer){
        guard let gestureView = gesture.view else { return }
        
        let size = gestureView.frame.size.width / 4
        let imgHeart = UIImageView(image: UIImage(systemName: "heart.fill") )
        imgHeart.tintColor = .white
        imgHeart.contentMode = .scaleAspectFit
        imgHeart.frame = CGRect(x: (gestureView.frame.width) - size * 2.5 ,
                                y: (gestureView.frame.height) - size * 2.5, width: size, height: size)
        
        gestureView.addSubview(imgHeart)
        
        UIView.animate(withDuration: 0.5, animations: {
            imgHeart.alpha = 0.0
        }) {(completed) in
            if completed{
                imgHeart.removeFromSuperview()
            }
        }
    }
}

