//
//  MemoItem.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import SwiftUI

struct MemoItem: View {
    var body: some View {
        VStack(alignment: .leading, spacing:0){
            Text("테스트")
                .fontWeight(.black)
                .font(.system(size: 18))
            Text("August 24, 2022")
                .fontWeight(.medium)
                .font(.system(size: 13))
                .foregroundColor(.gray)
            Divider().frame(height: 0).opacity(0.0)
        }
    }
}

struct MemoItem_Previews: PreviewProvider {
    static var previews: some View {
        MemoItem()
    }
}
