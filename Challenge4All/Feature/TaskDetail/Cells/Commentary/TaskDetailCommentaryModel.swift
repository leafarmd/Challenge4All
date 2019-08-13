
struct TaskDetailCommentaryModel {
    let avatarUrl: String
    let name: String
    let title: String
    let commentary: String
    let rating: Int
    
    init(output: ComentarioOutput) {
        self.avatarUrl = output.urlFoto
        self.name = output.nome
        self.title = output.titulo
        self.commentary = output.comentario
        self.rating = output.nota
    }
}
