//
//  LaunchScreenViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 03.11.2023.
//

import UIKit

final class LaunchScreenViewController: UIViewController {
    
    private let loadingImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 258, height: 273))
        imageView.image = UIImage(named: "Loading")
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingImageView)
        view.addSubview(logoImageView)
        
        view.backgroundColor = .systemBackground
        
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadingImageView.center = view.center
        
        animate()
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: { () -> Void in
            self.loadingImageView.transform = self.loadingImageView.transform.rotated(by: .pi / 2)
        }) { (finished) -> Void in
            if finished {
                self.animate()
            }
        }
        
        UIView.animate(withDuration: 5, animations: {
            self.loadingImageView.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now()+4, execute: {
                    let tabBarViewController = TabBarViewController()
                    tabBarViewController.modalTransitionStyle = .crossDissolve
                    tabBarViewController.modalPresentationStyle = .fullScreen
                    self.present(tabBarViewController, animated: true)
                })
            }
        })
    }
    
}

extension LaunchScreenViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 128),
            logoImageView.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
}
