//
//  MemoItem.swift
//  SwiftUI_Memo
//
//  Created by 이은재 on 2023/04/09.
//

import SwiftUI

struct MemoItem: View {
    var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading, spacing:0){
            Text(memo.title)
                .fontWeight(.black)
                .font(.system(size: 18))
            Text(memo.postedDate, style: .date)
                .fontWeight(.medium)
                .font(.system(size: 13))
                .foregroundColor(.gray)
            Divider().frame(height: 0).opacity(0.0)
        }
    }
}

struct MemoItem_Previews: PreviewProvider {
    static var previews: some View {
        MemoItem(memo: Memo())
    }
}
