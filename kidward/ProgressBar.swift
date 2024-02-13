//
//  ProgressBar.swift
//  kidward
//
//  Created by Łukasz Lewandowski on 12/02/2024.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Float

    var body: some View {
        ProgressView(value: progress)
            .progressViewStyle(LinearProgressViewStyle(tint: .blue)) // Customize the tint color as needed
            .scaleEffect(x: 1, y: 2, anchor: .center) // Adjust the scale to change the height of the progress bar
    }
}


