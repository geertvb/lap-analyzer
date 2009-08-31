package {
	
	import flash.geom.Point;
	
	public class GeoFlatten {
		
		public static function convert(lat: Number, lng: Number) : Point {
			var y: Number = lat * 44000 / 360;
			var x: Number = lng * 44000 / 360 * Math.cos(lat / 180 * Math.PI);
			return new Point(x, y);
		}
		
		public static function convertBack(x: Number, y: Number) : Point {
			var lat: Number = y * 360 / 44000;
			var lng: Number = x * 360 / 44000 / Math.cos(lat / 180 * Math.PI);
			return new Point(lat, lng);
		}
		
	}

}