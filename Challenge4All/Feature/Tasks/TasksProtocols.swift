import UIKit

protocol TasksView: class {
    func setTasks(with model: [TaskModel])
    func showLoadingFeedback()
    func hideLoadingFeedback()
    func showErrorMessage(_ value: String)
}

protocol TasksServiceOutput: class {
    func fetchTasksSucceeded(output: TaskOutput)
    func fetchTasksFailed(with message: String)
}

protocol TasksServiceInput: class {
    var output: TasksServiceOutput? { get }
    func fetchTasks()
}

protocol TasksRoutering: class {
    func makeViewController() -> UIViewController
    func navigateToTaskDetail(with id: String)
}
