//
//  MemoEditor.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import SwiftUI

struct MemoEditor: View {
    var memo: Memo
    
    @Environment(\.dismiss) var dismiss
    @State var title: String = ""
    @State var content: String = ""
    @ObservedObject var memoVM: MemoViewModel = MemoViewModel()
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("제목")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                         + Text("*")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
                ) {
                    TextField("클릭해서 제목을 입력", text: $title)
                        .submitLabel(.done)
                        .disableAutocorrection(true)
                        .onAppear {
                            title = memo.title
                        }
                        
                }
                
                Section(header: Text("내용")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                         + Text("*")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
                ) {
                    TextEditor(text: $content)
                        .font(.body)
                        .disableAutocorrection(true)
                        .submitLabel(.done)
                        .frame(height: 500)
                        .onAppear {
                            content = memo.text
                        }
                        
                }
            }            
            .toolbar {
                if memo.title.isEmpty {
                    Button {
                        memoVM.add(text: content, title: title)
                        dismiss()
                    } label: {
                        Text("저장하기")
                    }
                } else {
                    Button {
                        memoVM.editMemo(old: memo, title: title, text: content)
                        dismiss()
                    } label: {
                        Text("편집완료")
                    }
                }
                
                

            }
            
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct MemoEditor_Previews: PreviewProvider {
    static var previews: some View {
        MemoEditor(memo: Memo())
    }
}
