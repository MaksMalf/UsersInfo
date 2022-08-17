import Foundation

struct Users {
    var name: String
    var dateOfBirth: String?
    var gender: Gender?

    enum Gender {
        case man
        case woman
    }
}
