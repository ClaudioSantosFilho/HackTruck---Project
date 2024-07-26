import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -7.219134, longitude: -35.882932),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.01)
        )
    )
    
    
    var body: some View {
        Map(position: $position)
    }
}

#Preview {
    MapView()
}
