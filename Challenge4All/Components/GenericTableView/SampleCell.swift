import UIKit

typealias SampleCellConfig = TableCellConfigurator<SampleCell, String>

class SampleCell: UITableViewCell, ConfigurableCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(data: String) {
        textLabel?.text = data
    }
}
