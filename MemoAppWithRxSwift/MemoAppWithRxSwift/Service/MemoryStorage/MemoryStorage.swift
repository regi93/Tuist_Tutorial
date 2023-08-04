//
//  MemoryStorage.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/04.
//

import Foundation
import RxSwift

class MemoryStorage: MemoStorageType{
    private var memoList = [ // class 외부에서 직접 접근할 필요가 없으므로 private이다.
        Memo(content: "test memo 1", date: Date().addingTimeInterval(-10)),
        Memo(content: "test memo 2", date: Date().addingTimeInterval(-50))
    ]
    
    /// 1.memoList는 Observable을 통해서 외부로 노출되어야 한다.
    /// 2.memoList의 상태가 업데이트되면, Next 이벤트가 방출되어야한다.
    /// ❌ 일반 Obseravble 형식은 이러한 역할을 못하므로 Subject로 만들어야한다. -> 왜?
    
    private lazy var storage = BehaviorSubject<[Memo]>(value: memoList)
    
    @discardableResult
    func createMemo(content: String) -> RxSwift.Observable<Memo> {
        let newMemo = Memo(content: content)
        memoList.insert(newMemo, at: 0)
        storage.onNext(memoList)
        return Observable.just(newMemo)
    }
    
    @discardableResult
    func fetchList() -> RxSwift.Observable<[Memo]> {
        return storage
    }
    
    @discardableResult
    func updateMemo(memo: Memo, content: String) -> RxSwift.Observable<Memo> {
        let updatedMemo = Memo(original: memo, updateContent: content)
        if let index = memoList.firstIndex(where: {$0 == memo}) {
            self.memoList.remove(at: index)
            self.memoList.insert(updatedMemo, at: index)
        }
        storage.onNext(self.memoList)
        return Observable.just(updatedMemo)
    }
    
    @discardableResult
    func deleteMemo(memo: Memo) -> RxSwift.Observable<Memo> {
        if let index = memoList.firstIndex(where: {$0 == memo}){
            self.memoList.remove(at: index)
        }
        storage.onNext(self.memoList)
        return Observable.just(memo)
    }
}
