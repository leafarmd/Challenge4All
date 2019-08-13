import UIKit

protocol TaskDetailView: class {
    func setTitle(_ text: String)
    func setHeaderCell(model: TaskDetailHeaderModel)
    func setDescriptionCell(_ model: DescriptionModel)
    func setLocationCell(_ model: TaskDetailMapModel)
    func setCommentsCell(_ model: TaskDetailCommentaryModel)
    func callNumber(_ number: URL)
    func showLoadingFeedback()
    func hideLoadingFeedback()
    func showAddress(_ text: String)
    func showErrorMessage(_ value: String)
}

protocol TaskDetailServiceOutput: class {
    func fetchTaskDetailSucceeded(output: TaskDetailOutput)
    func fetchTaskDetailFailed(with message: String)
}

protocol TaskDetailServiceInput: class {
    var output: TaskDetailServiceOutput? { get }
    func fetchTaskDetail(id: String)
}

protocol TaskDetailRoutering: class {
    func makeViewController() -> UIViewController
}

protocol TaskDetailDelegate: class {
    func callAction(_ action: TaskDetailActions)
}

enum TaskDetailActions {
    case call
    case services
    case address
    case comments
    case favorites
}
