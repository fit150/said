import SwiftUI
import UniformTypeIdentifiers

public struct SaidApp: App {
    public init() {}

    public var body: some Scene {
        DocumentGroup(newDocument: Novel()) { file in
            NovelEditor(novel: file.$document)
        }
        DocumentGroupLaunchScene()
    }
}

extension Novel: FileDocument {
    public static var readableContentTypes: [UTType] {
        [.plainText]
    }

    public init(configuration: ReadConfiguration) throws {
        try init(configuration.file)
    }

    public func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        try file()
    }
}