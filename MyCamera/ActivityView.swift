//
//  ActivityView.swift
//  MyCamera
//
//  Created by NSPC201admin on 2024/02/14.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    let shareItems: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController{
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        
        return controller
    }
    
    func updateUIViewController(
        _ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>){
            
        }
}
