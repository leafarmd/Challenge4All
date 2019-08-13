import UIKit

typealias descriptionData = (model: DescriptionModel, delegate: TaskDetailDelegate)
typealias TaskDetailDescriptionCellConfig = TableCellConfigurator<TaskDetailDescriptionTableViewCell, descriptionData>

class TaskDetailDescriptionTableViewCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var labelDescription: UILabel!
    
    weak var delegate: TaskDetailDelegate?
    
    func configure(data: descriptionData) {
        labelDescription.text = data.model.description
        self.delegate = data.delegate
    }
    
    @IBAction func callTouched(_ sender: Any) {
        delegate?.callAction(.call)
    }
    
    @IBAction func servicesTouched(_ sender: Any) {
        delegate?.callAction(.services)
    }
    
    @IBAction func addressTouched(_ sender: Any) {
        delegate?.callAction(.address)
    }
    
    @IBAction func commentariesTouched(_ sender: Any) {
        delegate?.callAction(.comments)
    }
    
    @IBAction func favoritesTouched(_ sender: Any) {
        delegate?.callAction(.favorites)
    }
}
