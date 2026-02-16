import Foundation

struct Novel {
    var lines = [Line]()
}

struct Line: Identifiable {
    typealias ID: Int
    
    let id = ID.nextId()
    var content = ""
}

private extension Int {
    private static var id = 0
    
    static func nextId() -> Int {
        let next = Self.id
        Self.id += 1
        return next
    }
}

extension Novel {
    init(_ string: String = "") {
        lines = string
            .lines()
            .map {.init(content: $0)}
    }
    
    init(_ data: Data) throws {
        guard let str = String(
            data: data, 
            encoding: .utf8
        ) else {
            throw CocoaError(.fileReadInapplicableStringEncoding)
        }
        self.init(str)
    }
    
    init(_ file: FileWrapper) throws {
        guard let data = file.regularFileContents else {
            throw CocoaError(.fileReadCorruptFile)
        }
        self.init(data)
    }
}

extension Novel {
    var string: String {
        lines
            .map (\.content)
            .joined(separator: "\n")
    }
    
    func data() throws -> Data {
        guard let data = string.data(
            using: .utf8
        ) else {
            throw CocoaError(.fileWriteInapplicableStringEncoding)
        }
        return data
    }
    
    func file() throws -> FileWrapper {
        let data = try data()
        return .init(regularFileWithContents: data)
    }
}

private extension String {
    func lines() -> [String] {
        var lines = [String]()
        enumerateLines {line, _ in
            lines.append(line)
        }
        
        if let last, last.isNewline {
            lines.append("")
        }
        return lines
    }
}