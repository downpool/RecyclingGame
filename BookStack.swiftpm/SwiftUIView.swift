//
//  SwiftUIView.swift
//  BookStack
//
//  Created by 최동현 on 2023/04/16.
//

import SwiftUI
import Combine

struct SwiftUIView: View {
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            ProgressView("다운로드중...", value: downloadAmount, total: 100)
                .padding()
        }
        .onReceive(timer) { _ in
            //만약 downloadAmount가 100보다 작다면 실행
            //total값 보다 작아야함
            if downloadAmount < 100 {
                downloadAmount += 5
            }
        }
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
