//
//  MapView.swift
//  login3
//
//  Created by student on 12/06/2024.
//

import SwiftUI
import MapKit
import CoreData
import CoreLocation
class Geocoder: ObservableObject {
    @Published var location: CLLocationCoordinate2D?
    
    func geocode(address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { [weak self] placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                self?.location = location.coordinate
            }
        }
    }
}

struct MapView: View {
    let street: String
    let zipcode: String
    @StateObject private var geocoder = Geocoder()
    @State var camera: MapCameraPosition = .automatic
    
    var body: some View {
        VStack {
            if let location = geocoder.location {
                Map(position: $camera) {
                    Marker("User Location", systemImage: "house.circle.fill", coordinate: location)
                        .tint(.blue)
                }
                .safeAreaInset(edge: .bottom) {
                    HStack {
                        Spacer()
                        Button {
                            camera = .region(MKCoordinateRegion(center: location, latitudinalMeters: 200, longitudinalMeters: 200))
                        } label: {
                            Text("Center on User")
                        }
                        Spacer()
                    }
                    .padding(.top)
                    .background(.thinMaterial)
                }
                .mapStyle(.imagery)
            } else {
                Text("Geocoding address...")
                    .onAppear {
                        let fullAddress = "\(street), \(zipcode)"
                        geocoder.geocode(address: fullAddress)
                    }
            }
        }
    }
}

#Preview {
    MapView(street: "Example Street", zipcode: "12345")
}
