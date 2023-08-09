//
//  Scene.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/09.
//

import UIKit

enum Scene {
    case list(MemoListViewModel) // "연관값"
    case detail(DetailViewModel)
    case compose(EditViewModel)
}

extension Scene {
    func instantiate(from storyboard: String = "Main") -> UIViewController { // 8.Scene coordinator
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        switch self{
        case .list(let memoListViewModel): // secne 생성 & viewModel을 바인딩해서 리턴
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = windowScene.delegate as? SceneDelegate {
                if var rootViewController = sceneDelegate.window?.rootViewController as? UINavigationController{
                    if var memoListVC = rootViewController.topViewController as? MemoListViewController{
                        memoListVC.bind(viewModel: memoListViewModel)
                        return rootViewController
                    }
                }
            }

        case .detail(let detailViewModel):
            break
        case .compose(_):
            break
        }
        
        return UIViewController()
    }
    
}
