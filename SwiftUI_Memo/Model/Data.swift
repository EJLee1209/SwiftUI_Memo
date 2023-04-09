//
//  Data.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import Foundation
import RealmSwift

class Memo: Object {
    @Persisted var title: String = ""
    @Persisted var text: String = ""
    @Persisted var postedDate: Date = Date.now
}

extension Memo {
    // static 을 사용해 타입 프로퍼티로 선언
    // 이 realm 을 사용해 데이터 저장, 삭제, 읽기 등을 진행한다.
    private static var realm = try! Realm()
    
    // realm 객체가 타입 프로퍼티 이므로 메서드도 타입 메서드로 선언 static
    // realm 객체에 담긴 모든 값을 Results<Memo> 형태로 조회
    static func findAll() -> Results<Memo> {
        realm.objects(Memo.self)
    }
    
    // 추가
    static func addMemo(_ memo: Memo) {
        try! realm.write({
            realm.add(memo)
        })
    }
    
    // 삭제
    static func delMemo(_ memo: Memo) {
        try! realm.write({
            realm.delete(memo)
        })
    }
    
    // 업데이트
    static func editMemo(memo: Memo, title: String, text: String) {
        try! realm.write {
            memo.title = title
            memo.text = text
            memo.postedDate = Date.now
        }
    }
}
