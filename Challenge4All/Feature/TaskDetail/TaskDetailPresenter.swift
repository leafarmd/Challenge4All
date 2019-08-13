import Foundation

final class TaskDetailPresenter {
    
    weak var view: TaskDetailView?
    var router: TaskDetailRouter?
    private let id: String
    private let service = TaskDetailService()
    private var model: TaskDetailOutput?
    
    init(id: String) {
        self.id = id
        service.output = self
    }
    
    func attachView(_ view: TaskDetailView) {
        self.view = view
    }
    
    func presentTaskDetail() {
        view?.showLoadingFeedback()
        service.fetchTaskDetail(id: id)
    }
    
    func presentAction(_ action: TaskDetailActions) {
        switch action {
        case .call:
            guard let number = model?.telefone, let url = URL(string: "tel://\(number)") else { return }
            view?.callNumber(url)
        case .address:
            guard let address = model?.endereco else { return }
            view?.showAddress(address)
        case .comments:
            return
        case .favorites:
            return
        case .services:
            router?.navigateToServices()
        }
    }
}

extension TaskDetailPresenter: TaskDetailServiceOutput {
    func fetchTaskDetailSucceeded(output: TaskDetailOutput) {
        model = output
        view?.setTitle("\(output.cidade) - \(output.bairro)")
        view?.setHeaderCell(model: TaskDetailHeaderModel(output: output))
        view?.setDescriptionCell(DescriptionModel(output: output))
        view?.setLocationCell(TaskDetailMapModel(output: output))
        output.comentarios.forEach {
            view?.setCommentsCell(TaskDetailCommentaryModel(output: $0))
        }
        
        view?.hideLoadingFeedback()
    }
    
    func fetchTaskDetailFailed(with message: String) {
        view?.hideLoadingFeedback()
    }
}
