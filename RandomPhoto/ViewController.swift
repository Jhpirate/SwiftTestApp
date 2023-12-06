//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Jared Heeringa on 12/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    // creating the image view box container
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        imageView.backgroundColor = .red
        
        return imageView;
    }()

    
    //creating the button container
    private let newButtonThing: UIButton = {
        let buttonView = UIButton()
        
        buttonView.backgroundColor = .orange
        buttonView.setTitle("Random Photo", for: .normal)
        buttonView.setTitleColor(.red, for: .normal)
        
        return buttonView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .cyan
        
        //add the image view to the device view
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y:0, width: 300, height: 300)
        imageView.center = view.center
        
        
//        //add the button as a sub view
//        view.addSubview(newButtonThing)
//        newButtonThing.frame = CGRect(x: 20,
//                                      y:view.frame.size.height - 50 - view.safeAreaInsets.bottom,
//                                      width: view.frame.size.width-20,
//                                      height: 20)
        
        
        // call function to get random image
        getRandomPhoto()
        
        // add button event handler
        // simple tap is called by apple touch up inside
        newButtonThing.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    // this will load the safe view areas above the home bar
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //add the button as a sub view
        view.addSubview(newButtonThing)
        newButtonThing.frame = CGRect(x: 20,
                                      y:view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                                      width: view.frame.size.width-50,
                                      height: 75)
    }
    
    // button action event
    // need the objc part
    @objc func didTapButton() {
        getRandomPhoto()
        
        //rnadom element from color array
        //set background to this random color
        view.backgroundColor = colors.randomElement();
    }
    
    func getRandomPhoto() {
        //random photo site
        // http://source.unsplash.com/random/600x600
        let urlString = "https://source.unsplash.com/random/600x600"
        let urlImage = URL(string: urlString)! //! will known for a fact it is valid
        
        guard let dataImage = try? Data(contentsOf: urlImage) else {
            return
        }
        
        imageView.image = UIImage(data: dataImage)
    }
    
    let colors: [UIColor] = [
        .red,
        .orange,
        .yellow,
        .green,
        .blue,
        .systemPink,
        .purple
    ]


}

