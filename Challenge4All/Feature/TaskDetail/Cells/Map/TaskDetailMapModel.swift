struct TaskDetailMapModel {
    let latitude: Double
    let longitude: Double
    let address: String

    init(output: TaskDetailOutput) {
        self.latitude = output.latitude
        self.longitude = output.longitude
        self.address = output.endereco
    }
}
