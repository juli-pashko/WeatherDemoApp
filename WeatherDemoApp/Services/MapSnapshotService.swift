//
//  MapSnapshotService.swift
//  WeatherDemoApp
//
//  Created by Yulia Pashko on 28.09.2022.
//

import Foundation
import MapKit


class MapSnapshotService {
    typealias SnapshotterComplition = (UIImage?, Error?) -> Void
    
    //MARK: Properties
    var latitude: Double
    var longitude: Double

    
    //MARK: Private properties
    private var mapRegion = MKCoordinateRegion()
    private let mapOptions: MKMapSnapshotter.Options = .init()
    private var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
    private var mapCoordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    
    //MARK: Inizialization
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        setupMapOptions()
    }

    // MARK: Private methods
    /// Config map options parameters
    private func setupMapOptions() {
        mapOptions.region = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        // this is the size of the image, we can use the `UIImageView` frame size
        mapOptions.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3 )
        mapOptions.mapType = .standard
        mapOptions.showsBuildings = true
    }
    
    
    // MARK: Public methods
    
    /// Fetch map snapshot image
    public func snapshotterStart(complition: @escaping SnapshotterComplition) {
        let snapshotter = MKMapSnapshotter(options: mapOptions)
        snapshotter.start { snapshot, error in
            if let snapshot = snapshot {
                
                let image = UIGraphicsImageRenderer(size: self.mapOptions.size).image { _ in
                      snapshot.image.draw(at: .zero)

                      let pinView = MKPinAnnotationView(annotation: nil, reuseIdentifier: nil)
                      pinView.image = UIImage(named: "mapPinIcone")
                      let pinImage = pinView.image

                    var point = snapshot.point(for: self.mapCoordinates)
                   
                    let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)

                      if rect.contains(point) {
                          point.x -= pinView.bounds.width / 2
                          point.y -= pinView.bounds.height / 2
                          point.x += pinView.centerOffset.x
                          point.y += pinView.centerOffset.y
                          pinImage?.draw(at: point)
                      }
                }

                complition(image, nil)
                
            }
            else if let error = error {
                print("Something went wrong \(error.localizedDescription)")
                complition(nil, error)
            }
        }
    }
    
}
