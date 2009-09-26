package {
	import com.google.maps.LatLng;
	import com.google.maps.LatLngBounds;
	
	import flash.geom.Point;

	public class Projection {
		
		public var bounds: LatLngBounds;
		
		public var zoom: Number;

		public function latLng2xy(latLng: LatLng) : Point {
			var y: Number = (bounds.getNorth() - latLng.lat()) * 44000 / 360 * zoom;
			var x: Number = (latLng.lng() - bounds.getWest()) * 44000 / 360 * zoom * Math.cos(latLng.lat() / 180 * Math.PI);
			return new Point(x, y);
		}
		
		public function xy2latLng(x: Number, y: Number) : LatLng {
			var lat: Number = bounds.getNorth() - y / zoom * 360 / 44000;
			var lng: Number = bounds.getWest() + x / zoom * 360 / 44000 / Math.cos(lat / 180 * Math.PI)
			return new LatLng(lat, lng);
		}
		
		public function fit(width: Number, height: Number) : void {
			var dy: Number = (bounds.getNorth() - bounds.getSouth()) * 44000 / 360;
			var dx: Number = (bounds.getEast() - bounds.getWest()) * 44000 / 360 * Math.cos(bounds.getSouth() / 180 * Math.PI);
			zoom = Math.min(width / dx, height / dy);
		}
		
	}

}