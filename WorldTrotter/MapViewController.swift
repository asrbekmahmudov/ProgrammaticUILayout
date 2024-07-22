
import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    var pointsInterest: UILabel!
    var pointSwitch: UISwitch!
    
    override func loadView() {
        // Create a map View
        mapView = MKMapView()
        
        // Set it as *the* view of this view controller
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standart", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)

//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // Create a Label
        pointsInterest = UILabel()
        
        pointsInterest.text = "Points of Interest"
        pointsInterest.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointsInterest)
        
        let lTopConstraint = pointsInterest.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10)
        let lLeadingConstraint = pointsInterest.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        lTopConstraint.isActive = true
        lLeadingConstraint.isActive = true
        
        // Create a Toggle
        pointSwitch = UISwitch()
        mapView.pointOfInterestFilter = .excludingAll
        pointSwitch.addTarget(self, action: #selector(pointToggleChanged(_:)), for: .valueChanged)
        
        pointSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pointSwitch)
        
        let pTopConstraint = pointSwitch.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10)
        let pLeadingConstraint = pointSwitch.leadingAnchor.constraint(equalTo: pointsInterest.trailingAnchor, constant: 10)
        
        pTopConstraint.isActive = true
        pLeadingConstraint.isActive = true
        
        // Center Label Vertically using Switch
        let centerYLabel = pointsInterest.centerYAnchor.constraint(equalTo: pointSwitch.centerYAnchor)
        centerYLabel.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    @objc func pointToggleChanged(_ pointsSwitch: UISwitch) {
        if pointsSwitch.isOn {
            mapView.pointOfInterestFilter = .includingAll
        } else {
            mapView.pointOfInterestFilter = .excludingAll
        }
    }
    
}
