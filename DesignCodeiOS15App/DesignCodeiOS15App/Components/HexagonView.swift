//
//  HexagonView.swift
//  DesignCodeiOS15App
//
//  Created by SandsLee on 2022/7/28.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { context, size in
//            context.draw(Text("Hexagon"), at: CGPoint(x: 40, y: 10))
//            context.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
            context.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: 200, height: 212))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
