//
//  SceneCoordinatorType.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/09.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using Style: TransitionStyle, animate: Bool)-> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
    
    
}
