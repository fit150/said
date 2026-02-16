import SwiftUI

public struct SaidApp: App {
    public init() {
        
    }

    public var body: some Scene {
        DocumentGroup(
            newDocument: Novel()
        ) {file in 
            NovelEditor(novel: file.$document)
        }
}

extension Novel: FileDocument {
    static var readableContentTypes: [UTType] {
        [.plainText]
    }
    
    init(configuration: ReadConfiguration) throws {
        try init(configuration.file)
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        try file()
    }
}