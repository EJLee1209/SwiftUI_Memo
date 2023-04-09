//
//  MemoViewModel.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import Foundation

class MemoViewModel: ObservableObject {
    @Published var memos: [Memo] = Array(Memo.findAll())
    
    func add(text: String, title: String) {
        guard !text.isEmpty else { return }
        guard !title.isEmpty else { return }
        let memo = Memo()
        memo.text = text
        memo.title = title
        self.memos.append(memo)
        Memo.addMemo(memo)
    }
    
    func refreshMemo() {
        self.memos = Array(Memo.findAll())
    }
    
    func editMemo(old: Memo, title: String, text: String) {
        guard !text.isEmpty else { return }
        guard !title.isEmpty else { return }
        Memo.editMemo(memo: old, title: title, text: text)
    }
}
