import Foundation

enum APIRequest {
    case task(id: String?)
}

fileprivate let emptyString = ""

extension APIRequest {
    
    private var baseUrl: String {
        return "http://dev.4all.com:3003"
    }
    
    var url: String {
        switch self {
        case .task(let id):
            return "\(baseUrl)/tarefa/\(id ?? emptyString)"
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .task:
            return .GET
        }
    }
    
    var params: [String: String] {
        switch self {
        default:
            return [:]
        }
    }
}
