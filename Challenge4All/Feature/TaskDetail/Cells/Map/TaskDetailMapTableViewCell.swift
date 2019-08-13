//
//  TaskDetailMapTableViewCell.swift
//  Challenge4All
//
//  Created by Rafael Damasceno on 12/08/19.
//  Copyright © 2019 Rafael Damasceno. All rights reserved.
//
import MapKit
import UIKit

typealias TaskDetailMapCellConfig = TableCellConfigurator<TaskDetailMapTableViewCell, TaskDetailMapModel>

class TaskDetailMapTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var imageIcon: UIImageView! {
        didSet {
            imageIcon.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var labelAddress: UILabel!
    
    func configure(data: TaskDetailMapModel) {
        labelAddress.text = data.address
        
        let initialLocation = CLLocation(latitude: data.latitude, longitude: data.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, span: span)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = initialLocation.coordinate
        map.addAnnotation(annotation)
        
        map.setRegion(coordinateRegion, animated: true)
    }
}
