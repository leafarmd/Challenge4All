import Foundation

final class TasksService: TasksServiceInput {
    var output: TasksServiceOutput?
    let api: APICore
    
    init(api: APICore = API()) {
        self.api = api
    }
    
    func fetchTasks() {
        api.requestObject(from: .task(id: nil), type: TaskOutput.self) {[weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                self.output?.fetchTasksSucceeded(output: result)
            case .failure(let error):
                self.output?.fetchTasksFailed(with: error.message)
            }
        }
    }
}
