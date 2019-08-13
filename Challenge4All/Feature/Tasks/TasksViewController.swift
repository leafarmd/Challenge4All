import UIKit

class TasksViewController: TableViewController {

    let presenter: TasksPresenter
    
    init(presenter: TasksPresenter) {
        self.presenter = presenter
        
        super.init(dataSoruce: TableViewDataSource(), nibName: "TasksViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Tarefas"
        tableView.delegate = self
        presenter.attachView(self)
        presenter.presentTasks()
    }
}

extension TasksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.presentTask(at: indexPath.row)
    }
}

extension TasksViewController: TasksView {
    func setTasks(with model: [TaskModel]) {
        dataSource.model.items.removeAll()
        model.forEach { dataSource.model.items.append(SampleCellConfig(item: $0.id)) }
        tableView.reloadData()
    }
    
    func showLoadingFeedback() {
        Loading.start()
    }
    
    func hideLoadingFeedback() {
        Loading.stop()
    }
    
    func showErrorMessage(_ value: String) {
        Loading.stop()
    }
}
