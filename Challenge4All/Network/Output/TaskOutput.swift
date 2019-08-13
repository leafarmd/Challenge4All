import Foundation

struct TaskOutput: Output {
  let lista: [String]
    
    static func mock() -> TaskOutput {
        return TaskOutput(lista: ["a", "b", "c"])
    }
}
