//
//  OnboardingViewController.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 01/03/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
        OnboardingSlide(title: "Take Live 3D Measurements & Submit", description: "We will help you through creating & capturing rooms", image: #imageLiteral(resourceName: "image-removebg-preview")),
        OnboardingSlide(title: "Take Live 3D Measurements & Submit", description: "We will help you through creating & capturing rooms", image: #imageLiteral(resourceName: "Image 1")),
        OnboardingSlide(title: "Take Live 3D Measurements & Submit", description: "We will help you through creating & capturing rooms", image: #imageLiteral(resourceName: "Image"))
        ]
        
    }
    

    @IBAction func nextBtnClicked(_ sender: UIButton) {
    }
    

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row]) 
        
        return cell
    }
    
}
