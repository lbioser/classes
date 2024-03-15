//
//  UIControlView.swift
//  Test
//
//  Created by keloopA on 2024/3/1.
//

import SwiftUI
struct UIControlView:UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
       return Coordinator(self)
    }
    
    @Binding var currentPage:Int
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = 3
        control.addTarget(context.coordinator, action: #selector(Coordinator.pageChanged(page:)), for: .valueChanged)
        control.pageIndicatorTintColor = .green
        control.currentPageIndicatorTintColor = .gray
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator {
        var pageControl:UIControlView
        init(_ pageControl: UIControlView) {
            self.pageControl = pageControl
        }
        @objc func pageChanged(page:UIPageControl){
            pageControl.currentPage = page.currentPage
        }
    }
    
    
    typealias UIViewType = UIPageControl
    
    
    
}

