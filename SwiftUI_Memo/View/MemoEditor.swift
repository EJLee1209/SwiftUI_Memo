//
//  MemoEditor.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import SwiftUI

struct MemoEditor: View {
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
                        
                }
                
                Section(header: Text("내용")
                    .bold()
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                         + Text("*")
                    .foregroundColor(.red)
                    .font(.system(size: 20))
                ) {
                    TextField("클릭해서 메모를 입력", text: $content)
                        .font(.body)
                        .disableAutocorrection(true)
                        .submitLabel(.done)
                        .frame(width:.infinity, height: 500, alignment: .topLeading)
                }
            }            
            .toolbar {
                Button {
                    memoVM.add(text: content, title: title)
                } label: {
                    Text("저장하기")
                }

            }
            
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct MemoEditor_Previews: PreviewProvider {
    static var previews: some View {
        MemoEditor()
    }
}
