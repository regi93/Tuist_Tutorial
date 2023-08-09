//
//  SceneCoordinator.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/09.
//

import Foundation
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {
    private let bag = DisposeBag()
    
    private var window: UIWindow
    private var currentVC: UIViewController
    
    required init(window: UIWindow){
        self.window = window
        currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animate: Bool) -> RxSwift.Completable {
        let subject = PublishSubject<Never>() // 코드의 간결성을 유지하기 위해 create메서드로 completable을 만들지 않았다. -> 나중에 다시 확인할것.
        
        let target = scene.instantiate()
        switch style{
            
        case .root:
            currentVC = target
            window.rootViewController = target
            subject.onCompleted()
            
        case .push:
            guard let nav = currentVC.navigationController else{
                subject.onError(TransitionError.navigationControllerMissing)
                break
            }
            nav.pushViewController(target, animated: animate)
            currentVC = target
            subject.onCompleted()
            
        case .modal:
            currentVC.present(target, animated: animate) {
                subject.onCompleted()
            }
            currentVC = target
        }
        return subject.asCompletable()
    }
    
    @discardableResult
    func close(animated: Bool) -> RxSwift.Completable {
        
        return Completable.create { [weak self] completable in
            if let presentingVC = self?.currentVC.presentingViewController {
                self?.currentVC.dismiss(animated: animated){
                    self?.currentVC = presentingVC
                    completable(.completed)
                }
            }
            else if let nav = self?.currentVC.navigationController {
                guard nav.popViewController(animated: animated) != nil else{
                    completable(.error(TransitionError.cannotPop))
                    return Disposables.create()
                }
                self?.currentVC = nav.viewControllers.last!
                completable(.completed)
            }
            else{
                completable(.error(TransitionError.unknown))
            }
            
            return Disposables.create()
        }
        
        
    }
}
