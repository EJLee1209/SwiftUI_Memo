//
//  ContentView.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var memoVM = MemoViewModel()
    var body: some View {
        let memos = memoVM.memos.sorted { $0.postedDate > $1.postedDate }
        
        NavigationView {
            List(memos, id: \.self) { memo in
                NavigationLink {
                    MemoDetailView(memo: memo)
                } label: {
                    MemoItem(memo: memo)
                }
            }
            .refreshable {
                memoVM.refreshMemo()
            }
            .listStyle(.inset)
            .navigationTitle("Memo")
                .toolbar {
                    NavigationLink {
                        MemoEditor()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
