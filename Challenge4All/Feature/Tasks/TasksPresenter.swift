final class TasksPresenter {
    
    var view: TasksView?
    var tasks: [TaskModel]?
    let service: TasksService
    let router: TasksRouter
    
    init(router: TasksRouter) {
        service = TasksService()
        self.router = router
        service.output = self
        
    }
    
    func attachView(_ view: TasksView) {
        self.view = view
    }
    
    func presentTasks() {
        view?.showLoadingFeedback()
        service.fetchTasks()
    }
    
    func presentTask(at index: Int) {
        guard let id = tasks?[index].id else { return }
        router.navigateToTaskDetail(with: id)
    }
}

extension TasksPresenter: TasksServiceOutput {
    func fetchTasksSucceeded(output: TaskOutput) {
        tasks = output.lista.map{ TaskModel(id: $0) }
        guard let tasks = tasks else { return }
        view?.hideLoadingFeedback()
        view?.setTasks(with: tasks)
    }
    
    func fetchTasksFailed(with message: String) {
        view?.hideLoadingFeedback()
        view?.showErrorMessage(message)
    }
}
