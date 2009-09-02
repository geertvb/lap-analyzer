package {

	public class GpsLineIterator {
		
		public function GpsLineIterator(lines: Array) {
			this.lines = lines;
			this.current = 0;
			
			headings = lines[0].split(",");
			//INDEX,RCR,DATE,TIME,VALID,LATITUDE,N/S,LONGITUDE,E/W,HEIGHT,SPEED,DISTANCE,
			latIndex = headings.indexOf("LATITUDE");
			lngIndex = headings.indexOf("LONGITUDE");
			spdIndex = headings.indexOf("SPEED");
			timeIndex = headings.indexOf("TIME");
		}
		
		public var headings: Array;
		
		public var latIndex: uint;
		public var lngIndex: uint;
		public var spdIndex: uint;
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
		
		public function getGpsLine(line: String) : GpsLine {
			if (line != null) {
				var result: GpsLine = new GpsLine();
				var values: Array = line.split(",");
				result.lat = values[latIndex];
				result.lng = values[lngIndex];
				result.time = values[timeIndex];
				result.speed = values[spdIndex];
			} else {
				return null;
			}
		}
		
		public function next() : GpsLine {
			while (current < lines.length && isEmpty(lines[current])) {
				current++;
			}
			if (current < lines.length) {
				return getGpsLine(lines[current]);
			} else {
				return null;
			}
		}

	}

}