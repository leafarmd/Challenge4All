import UIKit

extension UIImageView {
    func loadImageFromURL(_ url: String?) {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.alpha = 1.0
        activityIndicator.center = center
        activityIndicator.autoresizingMask = [.flexibleRightMargin,
                                              .flexibleLeftMargin,
                                              .flexibleTopMargin,
                                              .flexibleBottomMargin]
                                              
        
        self.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        if let url = url {
            API.requestImage(from: url) { [weak self] result in
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
                switch result {
                case .success(let image):
                    self?.image = image
                case .failure(_):
                    self?.image = UIImage(named: "noimage")
                }
                self?.alpha = 0
                UIView.animate(withDuration: 0.2) {
                    self?.alpha = 1.0
                }
            }
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            self.image = UIImage(named: "noimage")
        }
    }
}
