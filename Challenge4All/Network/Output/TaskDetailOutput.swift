import Foundation

struct TaskDetailOutput: Output {
    let id: String
    let cidade: String
    let bairro: String
    let urlFoto: String
    let urlLogo: String
    let titulo: String
    let telefone: String
    let texto: String
    let endereco: String
    let latitude: Double
    let longitude: Double
    let comentarios: [ComentarioOutput]
    
    static func mock() -> TaskDetailOutput {
        return TaskDetailOutput(id: "id value",
                                cidade: "city value",
                                bairro: "neighborhood value",
                                urlFoto: "url photo value",
                                urlLogo: "url logo value",
                                titulo: "title value",
                                telefone: "fone value",
                                texto: "text value",
                                endereco: "address value",
                                latitude: 0.0,
                                longitude: 0.0,
                                comentarios: [ComentarioOutput.mock()] )
    }
    
}

struct ComentarioOutput: Output {
    let urlFoto: String
    let nome: String
    let nota: Int
    let titulo: String
    let comentario: String
    
    static func mock() -> ComentarioOutput {
         return ComentarioOutput(urlFoto: "url foto value", nome: "url name value", nota: 3, titulo: "title value", comentario: "coment value")
    }
}
