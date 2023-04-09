//
//  ContentView.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(1...15, id: \.self) { _ in
                    NavigationLink {
                        Text("여기는 메모 디테일 뷰가 올것임")
                    } label: {
                        MemoItem()
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Memo")
                .toolbar {
                    NavigationLink {
                        Text("여기는 메모 추가하는 뷰가 올것임")
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
