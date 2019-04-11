import Foundation

enum Request {
    case getUsers
    case getImages
}

extension Request {
    var url: URL {
        switch self {
        case .getImages:
            return URL(string: "https://jsonplaceholder.typicode.com/photos")!
        case .getUsers:
            return URL(string: "https://jsonplaceholder.typicode.com/users")!
        }
    }
}


