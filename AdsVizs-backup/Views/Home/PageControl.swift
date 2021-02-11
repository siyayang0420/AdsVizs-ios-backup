
//  Created by Siya Yang on 2020-08-28.
//  Copyright © 2020 Balaji. All rights reserved.
//

import SwiftUI

struct PageControl : UIViewRepresentable {
    
    @Binding var page : Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .black
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.numberOfPages = data.count
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        // Updating Page Indicator When Ever Page Changes
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(page: Binding.constant(1))
    }
}
