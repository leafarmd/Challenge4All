import UIKit

final class TaskDetailRouter: TaskDetailRoutering {
    
    private let id: String
    private let navigator: UINavigationController
    init(id: String, navigator: UINavigationController) {
        self.id = id
        self.navigator = navigator
    }
    func makeViewController() -> UIViewController {
        let presenter = TaskDetailPresenter(id: id)
        presenter.router = self
        let viewController = TaskDetailViewController(presenter: presenter)
        
        return viewController
    }
    
    func navigateToServices() {
        let viewController = UIViewController()
        viewController.navigationItem.title = "Serviços"
        navigator.pushViewController(viewController, animated: true)
    }
}
