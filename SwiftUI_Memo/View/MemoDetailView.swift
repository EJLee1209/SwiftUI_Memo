//
//  MemoDetailView.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import SwiftUI

struct MemoDetailView: View {
    var memo: Memo
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var memoVM = MemoViewModel()
    @State var delCheck: Bool = false
    
    var body: some View {
        VStack(alignment:.leading){
            Divider()
            Text(memo.text)
                .font(.system(size: 18))
                .padding()
            Spacer()
        }.navigationTitle(memo.title)
            .toolbar {
                Button {
                    self.delCheck = true
                } label: {
                    Image(systemName: "trash")
                }
                NavigationLink {
                    MemoEditor(memo: memo)
                } label: {
                    Image(systemName: "pencil")
                }

            }
            .alert("정말 삭제 하시겠습니까?", isPresented: $delCheck) {
                Button {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        Memo.delMemo(memo)
                    }
                    
                } label: {
                    Text("확인")
                }
                Button("아니요", role: .cancel) {}
            }
    }
}

struct MemoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemoDetailView(memo: Memo())
    }
}
