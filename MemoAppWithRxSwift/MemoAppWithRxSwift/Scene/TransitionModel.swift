//
//  TransitionModel.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/09.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
    
}

enum TransitionError: Error{
    case navigationControllerMissing
    case cannotPop
    case unknown
}
