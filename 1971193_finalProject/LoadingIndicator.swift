//
//  LoadingIndicator.swift
//  1971193_finalProject
//
//  Created by 한건희 on 6/7/24.
//

import Foundation
import UIKit

class LoadingIndicator {
    static func showLoading() {
        DispatchQueue.main.async {
            // 최상단에 있는 window 객체 획득
            guard let window = UIApplication.shared.windows.last else { return }

            let loadingIndicatorView: UIActivityIndicatorView
            if let existedView = window.subviews.first(where: { $0 is UIActivityIndicatorView } ) as? UIActivityIndicatorView {
                loadingIndicatorView = existedView
            } else {
                loadingIndicatorView = UIActivityIndicatorView(style: .large)
                /// 다른 UI가 눌리지 않도록 indicatorView의 크기를 full로 할당
                loadingIndicatorView.frame = window.frame
                loadingIndicatorView.color = .brown
                window.addSubview(loadingIndicatorView)
            }

            loadingIndicatorView.startAnimating()
        }
    }
    
    static func hideLoading() {
        DispatchQueue.main.async {
            DispatchQueue.main.async {
                    guard let window = UIApplication.shared.windows.last else { return }
                    window.subviews.filter({ $0 is UIActivityIndicatorView }).forEach { $0.removeFromSuperview() }
                }
        }
    }
}
