//
//  ViewModelBindableType.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/04.
//

import UIKit

protocol ViewModelBindableType{
    // ❌여러 타입의 ViewModel이 존재하므로 generic으로 프로토콜 선언해야한다.
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController{
    // where Self -> UIViewController 클래스가 프로토콜을 채택할때만 익스텐션한다.
    
    mutating func bind(viewModel: Self.ViewModelType){
        self.viewModel = viewModel
        self.bindViewModel()
//        loadViewIfNeeded()
        // VC는 처음 뷰에 엑세스될때 lazy하게 로드된다. 이 코드를 작성함으로써 아직 로드되지 않았다면, VC를 로드시킨다.
    }
}
