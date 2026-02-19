import SwiftUI

public struct SaidApp: App {
    public init() {
        
    }

    public var body: some Scene {
        DocumentGroup(newDocument: Novel()) { file in
            NovelEditor(novel: file.$document)
        }
        DocumentGroupLaunchScene()
    }
}
