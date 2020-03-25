//
//  TableView.swift
//  ExcelSwiftUI
//
//  Created by Ivan Ruiz Monjo on 25/03/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import SwiftUI

struct TableView: View {
    var data: [[Text]]
    
    @State private var columnWidths: [Int: CGFloat] = [:]
    @State private var columnHeights: [Int: CGFloat] = [:]
    @State private var selectedCell: (row: Int, col: Int)? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(data.indices) { row in
                HStack(alignment: .top) {
                    ForEach(self.data[row].indices) { column in
                        self.cell(row: row, col: column)
                            .onTapGesture {
                                withAnimation {
                                    self.selectedCell = (row, column)
                                }
                        }
                    }.background(row.isMultiple(of: 2) ? Color.clear : Color.gray.opacity(0.2))
                }
            }
        }
        .onPreferenceChange(WidthPreference.self) { self.columnWidths = $0 }
        .onPreferenceChange(HeightPreference.self) { self.columnHeights = $0 }
        .overlayPreferenceValue(AnchorPreference.self) { self.anchorTransform($0) }
    }
    
    private func anchorTransform(_ anchor: Anchor<CGRect>?) -> some View {
        GeometryReader { proxy in
            if anchor != nil {
                Rectangle()
                    .fill(Color.clear)
                    .border(Color.blue, width: 2)
                    .offset(x: proxy[anchor!].minX, y: proxy[anchor!].minY)
                    .frame(width: proxy[anchor!].width, height: proxy[anchor!].height)
            }
        }
    }
    
    private func cell(row: Int, col: Int) -> some View {
        self.data[row][col]
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: WidthPreference.self, value: [col: proxy.size.width])
                        .preference(key: HeightPreference.self, value: [col: proxy.size.height])
                        .anchorPreference(key: AnchorPreference.self, value: .bounds) { anchor in
                            self.isSelectedCell(row: row, col: col) ? anchor : nil
                    }
                }
        )
            .frame(width: self.columnWidths[col], height: self.columnHeights[row], alignment: .leading)
    }
    
    private func isSelectedCell(row: Int, col: Int) -> Bool {
        return selectedCell?.row == row && selectedCell?.col == col
    }
}
