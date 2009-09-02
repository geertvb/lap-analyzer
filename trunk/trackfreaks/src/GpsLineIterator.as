package {
	import mx.formatters.DateFormatter;

	public class GpsLineIterator {
		
		public function GpsLineIterator(lines: Array) {
			this.lines = lines;
			this.current = 0;
			
			headings = lines[0].split(",");
			//INDEX,RCR,DATE,TIME,VALID,LATITUDE,N/S,LONGITUDE,E/W,HEIGHT,SPEED,DISTANCE,
			latIndex = headings.indexOf("LATITUDE");
			lngIndex = headings.indexOf("LONGITUDE");
			spdIndex = headings.indexOf("SPEED");
			dateIndex = headings.indexOf("DATE");
			timeIndex = headings.indexOf("TIME");
		}
		
		public var headings: Array;
		
		public var latIndex: uint;
		public var lngIndex: uint;
		public var spdIndex: uint;
		public var dateIndex: uint;
		public var timeIndex: uint;
		
		public var lines: Array;
		public var current: int;
		
		public function isEmpty(line: String) : Boolean {
			return line == null || line.length == 0;
		}
		
		public function hasNext() : Boolean {
			var i: int = current + 1;
			while (i < lines.length && isEmpty(lines[i])) {
				i++;
			}
			return i < lines.length;
		}
		
		public function getGpsLine() : GpsLine {
			if (current >= 0  && current < lines.length) {
				var result: GpsLine = new GpsLine();

				var line: String = lines[current];
				var values: Array = line.split(",");
				result.index = current;
				result.lat = values[latIndex];
				result.lng = values[lngIndex];
				result.time = parseTime(values[timeIndex]);
				result.speed = parseFloat(values[spdIndex]);
				
				return result;
			} else {
				return null;
			}
		}
		
		public function next() : GpsLine {
			if (current < lines.length) {
				do {
					current++;
				} while (current < lines.length && isEmpty(lines[current]));
			}
			return getGpsLine();
		}
		
		public function parseTime(time: String) : uint {
			var h: uint = parseInt(time.substr(0,2));
			var m: uint = parseInt(time.substr(3,2));
			var s: uint = parseInt(time.substr(6,2));
			var ms: uint = parseInt(time.substr(9,3));
			return ms + 1000 * (s + 60 * (m + 60 * h));
		}

	}

}