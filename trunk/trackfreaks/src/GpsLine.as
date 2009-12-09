package {
	
	public class GpsLine {

		public var index: uint;
		public var speed: Number;
		public var time: Number;
		public var lat: Number;
		public var lng: Number;
		
		public function toString() : String {
			var result : Vector.<String> = new Vector.<String>();
			
			result.push(index);
			result.push(time);
			result.push(lat);
			result.push(lng);
			result.push(speed);
			
			return result.join();
		}
		
		public function fromString(value: String) : void {
			var values: Array = value.split(",");
			index = parseInt(values[0]);
			time = parseInt(values[1]);
			lat = parseFloat(values[2]);
			lng = parseFloat(values[3]);
			speed = parseFloat(values[4]);
		}

	}

}