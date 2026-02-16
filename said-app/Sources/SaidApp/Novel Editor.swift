import SwiftUI

struct NovelEditor: View {
    @State var novel: Novel
    
    var body: some View {
        NovelView()
            .onScrollTargetVisibilityChange(
                idType: Int.self,
                updateNav
            )
    }
}

extension NovelEditor {
    func updateNav(_ ids: [Int]) {
        
    }
}

private struct NovelView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                
            }
            .scrollTargetLayout()
        }
        .defaultScrollAnchor(.bottom)
    }
}