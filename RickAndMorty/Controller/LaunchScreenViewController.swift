//
//  LaunchScreenViewController.swift
//  RickAndMorty
//
//  Created by Dmitriy Starozhilov on 03.11.2023.
//

import UIKit

final class LaunchScreenViewController: UIViewController {
    
    private let loadingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Loading")
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        view.backgroundColor = .systemBackground
        
        view.addSubview(loadingImageView)
        view.addSubview(logoImageView)
        
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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

//MARK: - Set Constraints

extension LaunchScreenViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 128),
            logoImageView.widthAnchor.constraint(equalToConstant: 240),
            
            loadingImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            loadingImageView.heightAnchor.constraint(equalToConstant:273),
            loadingImageView.widthAnchor.constraint(equalToConstant: 258)
        ])
    }
}
