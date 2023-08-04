//
//  Memo.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/04.
//

import Foundation

struct Memo: Equatable {
    var content: String
    var date: Date
    var identity: String
    
    init(content: String, date: Date = Date(), identity: String){
        self.content = content
        self.date = date
        self.identity = String(describing: date.timeIntervalSinceReferenceDate)
    }
    
    init(original: Memo, updateContent: String){
        self = original
        self.content = updateContent
    }
}

/// 구조체는 이니셜라이져를 두개 가질 수 있다. 두가지 이니셜라이저는 목적에 따라 다르게 사용될 수 있다.
