struct TaskDetailHeaderModel {
    let urlImage: String
    let urlLogo: String
    let title: String
    
    init(output: TaskDetailOutput) {
        self.urlImage = output.urlFoto
        self.urlLogo = output.urlLogo
        self.title = output.titulo
    }
}
