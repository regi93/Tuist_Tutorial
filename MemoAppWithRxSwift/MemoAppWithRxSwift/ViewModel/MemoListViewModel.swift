//
//  MemoViewModel.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/04.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    // 1.의존성을 주입하는 이니셜라이져
    // 2.바인딩에 사용되는 속성 및 메서드
    // -> 화면 전환과 메모 저장을 처리하는 객체(viewModel)
    
    var memoList: Observable<[Memo]> {
        return storage.fetchList()
    }
    
    
    
}
