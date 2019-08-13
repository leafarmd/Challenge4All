struct DescriptionModel {
    let description: String
    let phoneNumber: String
    let address: String
    
    init(output: TaskDetailOutput) {
        self.description = output.texto
        self.phoneNumber = output.telefone
        self.address = output.endereco
    }
}
