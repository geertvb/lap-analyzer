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
			if (timeIndex < 0) {
				timeIndex = headings.indexOf("LOCAL TIME");
			}
			if (timeIndex < 0) {
				timeIndex = headings.indexOf("UTC TIME");
			}
			if (timeIndex < 0) {
				timeIndex = headings.indexOf("UTC");
			}
			
			dateIndex = headings.indexOf("DATE");
			if (dateIndex < 0) {
				dateIndex = headings.indexOf("LOCAL DATE");
			}
			if (dateIndex < 0) {
				dateIndex = headings.indexOf("UTC DATE");
			}
		}
		
		public var headings: Array;
		
		public var latIndex: int;
		public var lngIndex: int;
		public var spdIndex: int;
		public var dateIndex: int;
		public var timeIndex: int;
		
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
		
		public function getGpsLine(index: int) : GpsLine {
			if (index >= 0  && index < lines.length) {
				var result: GpsLine = new GpsLine();

				var line: String = lines[index];
				var values: Array = line.split(",");
				result.index = index;
				result.lat = values[latIndex];
				result.lng = values[lngIndex];
				result.time = parseDateTime(getDateTime(values));
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
			return getGpsLine(current);
		}
		
		public function getDateTime(values: Array) : String {
			var result: String;
			result = values[timeIndex];
			if (dateIndex >= 0) {
				result = values[dateIndex] + " " + result;
			}
			return result;
		}
		
		public function parseDateTime(dateTime: String) : Number {
			var year: uint = parseInt(dateTime.substr(0,4));
			var month: uint = parseInt(dateTime.substr(5,2));
			var day: uint = parseInt(dateTime.substr(8,2));

			var hour: uint = parseInt(dateTime.substr(11,2));
			var min: uint = parseInt(dateTime.substr(14,2));
			var sec: uint = parseInt(dateTime.substr(17,2));
			var ms: uint = parseInt(dateTime.substr(20,3));

			var dt: Date = new Date(year,month,day,hour,min,sec,ms);
			
			return dt.getTime();
		}
		
		
	}

}