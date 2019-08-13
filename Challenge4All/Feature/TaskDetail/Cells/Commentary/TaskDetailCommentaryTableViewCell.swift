import UIKit

typealias TaskDetailCommentaryCellConfig = TableCellConfigurator<TaskDetailCommentaryTableViewCell, TaskDetailCommentaryModel>

class TaskDetailCommentaryTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var imageViewAvatar: UIImageView! {
        didSet {
            imageViewAvatar.layer.cornerRadius = 22.5
        }
    }
    @IBOutlet var imageViewStars: [UIImageView]!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCommentary: UILabel!
    
    func configure(data: TaskDetailCommentaryModel) {
        imageViewAvatar.loadImageFromURL(data.avatarUrl)
        labelName.text = data.name
        labelTitle.text = data.title
        labelCommentary.text = data.commentary
        for index in 0..<data.rating {
            imageViewStars[index].isHidden = false
        }
    }
}
