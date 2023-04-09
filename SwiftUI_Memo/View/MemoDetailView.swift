//
//  MemoDetailView.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import SwiftUI

struct MemoDetailView: View {
    var memo: Memo
    
    var body: some View {
        Text("메모 디테일 뷰")
    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(memo: Memo())
    }
}
