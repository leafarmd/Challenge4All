import UIKit

final class TasksRouter: TasksRoutering {
    
    
    private let navigator: UINavigationController
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func makeViewController() -> UIViewController {
        let presenter = TasksPresenter(router: self)
        let viewController = TasksViewController(presenter: presenter)
    
        return viewController
    }
    
    func navigateToTaskDetail(with id: String) {
        let router = TaskDetailRouter(id: id, navigator: navigator)
        
        navigator.pushViewController(router.makeViewController(), animated: true)
    }
}
