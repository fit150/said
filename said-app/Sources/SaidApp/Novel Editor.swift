import SwiftUI

struct NovelEditor: View {
    @Binding var novel: Novel
    
    var body: some View {
        NovelView(novel: novel)
            .onScrollTargetVisibilityChange(
                idType: Line.ID.self,
                updateNav
            )
            .toolbar {
                ToolbarItem
            }
    }
}

extension NovelEditor {
    func updateNav(_ ids: [Line.ID]) {
        
    }
}

private struct NovelView: View {
    var novel: Novel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(novel.lines) {line in
                    LineView(line: line)
                }
            }
            .scrollTargetLayout()
        }
        .defaultScrollAnchor(.bottom)
    }
    
    struct LineView: View {
        let line: Line
        
        var body: some View {
            Text(line.content)
                .padding()
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
        }
    }
}