//
//  MemoStorage.swift
//  MemoAppWithRxSwift
//
//  Created by 유준용 on 2023/08/04.
//

import RxSwift

protocol MemoStorageType {
    @discardableResult // 작업 결과가 필요한경우, 필요 없는 경우 두가지가 존재하기 때문에
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func fetchList() -> Observable<[Memo]>
    
    @discardableResult
    func updateMemo(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func deleteMemo(memo: Memo) -> Observable<Memo>
}
