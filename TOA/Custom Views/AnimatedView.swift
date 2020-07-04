//
//  AnimatedView.swift
//  TOA
//
//  Created by Steven on 7/3/20.
//  Copyright © 2020 Coolectif TOA. All rights reserved.
//

import SwiftUI
import KenBurns
 
struct AnimatedView: UIViewRepresentable {
    typealias UIViewType = UIView
    var imageName : String
    
    func makeUIView(context: UIViewRepresentableContext<AnimatedView>) -> UIView {
        
        let view = UIView(frame: .zero)
        
        let kenBurnsView = KenBurnsImageView()
 
        let myImage : UIImage = UIImage(named: imageName)!
        

        //kenBurnsView.zoomIntensity = 1.5
        kenBurnsView.loops = true
        kenBurnsView.setImageQueue(withImages: [myImage])
        
        //kenBurnsView.setImage(UIImage(named: imageName)!)
        //kenBurnsView.setDuration(min: 5, max: 13)
        
        kenBurnsView.translatesAutoresizingMaskIntoConstraints = false
        
        
        kenBurnsView.startAnimating()
        view.addSubview(kenBurnsView)
        
        NSLayoutConstraint.activate([
        kenBurnsView.widthAnchor.constraint(equalTo: view.widthAnchor),
        kenBurnsView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimatedView>) {
        
    }
     
    
     
    
     
}

struct AnimatedView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedView(imageName: "covid_worms_bg")
    }
}
