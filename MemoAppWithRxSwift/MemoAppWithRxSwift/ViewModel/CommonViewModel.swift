//
//  CommonViewModel.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/09.
//

import Foundation
import RxCocoa
import RxSwift

class CommonViewModel: NSObject {
    let title: Driver<String>
    
    let sceneCoordinator: SceneCoordinatorType
    let storage: MemoStorageType
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType){
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
