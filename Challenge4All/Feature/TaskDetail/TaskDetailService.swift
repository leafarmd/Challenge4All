final class TaskDetailService: TaskDetailServiceInput {
    var output: TaskDetailServiceOutput?
    let api: APICore
    
    init(api: APICore = API()) {
        self.api = api
    }
    
    func fetchTaskDetail(id: String) {
        api.requestObject(from: .task(id: id), type: TaskDetailOutput.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let result):
                self.output?.fetchTaskDetailSucceeded(output: result)
            case .failure(let error):
                self.output?.fetchTaskDetailFailed(with: error.message)
            }
        }
    }
}
