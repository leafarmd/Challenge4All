//
//  TaskDetailHeaderTableViewCell.swift
//  Challenge4All
//
//  Created by Rafael Damasceno on 11/08/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//

import UIKit

typealias TaskDetailHeaderCellConfig = TableCellConfigurator<TaskDetailHeaderTableViewCell, TaskDetailHeaderModel>

class TaskDetailHeaderTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var imageViewHeader: UIImageView!
    @IBOutlet weak var imageViewLogo: UIImageView! {
        didSet {
            imageViewLogo.layer.cornerRadius = 80/2
        }
    }
    @IBOutlet weak var labelTitle: UILabel!
    
    func configure(data: TaskDetailHeaderModel) {
        imageViewHeader.loadImageFromURL(data.urlImage)
        imageViewLogo.loadImageFromURL(data.urlLogo)
        labelTitle.text = data.title.uppercased()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageViewHeader.image = nil
        imageViewLogo.image = nil
    }
}
