import UIKit

final class TaskDetailViewController: TableViewController {
    
    private let presenter: TaskDetailPresenter
    
    init(presenter: TaskDetailPresenter) {
        self.presenter = presenter
        super.init(dataSoruce: TableViewDataSource(), nibName: "TaskDetailViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.attachView(self)
        presenter.presentTaskDetail()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "",
                                                                                         style: .plain,
                                                                                         target: nil,
                                                                                         action: nil)
        let searchButton = UIBarButtonItem(image: UIImage(named: "iconSearch"),
                                           style: .done,
                                           target: self,
                                           action: #selector(search))
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc private func search() {
        showAlert(title: "Todo", message: "search feature")
    }
}

extension TaskDetailViewController: TaskDetailView {
    func showAddress(_ text: String) {
        showAlert(title: "Endereço", message: text)
    }
    
    func callNumber(_ number: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(number)
        } else {
            UIApplication.shared.openURL(number)
        }
    }
    
    func setTitle(_ text: String) {
        navigationItem.title = text
    }
    
    func setHeaderCell(model: TaskDetailHeaderModel) {
        dataSource.model.items.append(TaskDetailHeaderCellConfig(item: model))
        
        tableView.reloadData()
    }
    
    func setDescriptionCell(_ model: DescriptionModel) {
        
        dataSource.model.items.append(TaskDetailDescriptionCellConfig(item: (model, self)))
        tableView.reloadData()
    }
    
    func setLocationCell(_ model: TaskDetailMapModel) {
        dataSource.model.items.append(TaskDetailMapCellConfig(item: model))
        tableView.reloadData()
    }
    
    func setCommentsCell(_ model: TaskDetailCommentaryModel) {
        dataSource.model.items.append(TaskDetailCommentaryCellConfig(item: model))
        tableView.reloadData()
    }
    
    func showLoadingFeedback() {
        Loading.start()
    }
    
    func hideLoadingFeedback() {
        Loading.stop()
    }
    
    func showErrorMessage(_ value: String) {
        showAlert(title: "Error", message: value)
    }
}

extension TaskDetailViewController: TaskDetailDelegate {
    func callAction(_ action: TaskDetailActions) {
        if action == .comments {
            tableView.scrollToRow(at: IndexPath(row: 2, section: 0), at: .top, animated: true)
        } else {
            presenter.presentAction(action)
        }
    }
}
