package util {
	
	public class TimeUtils {
		
		public static function pad(value: int, n: int): String {
			var result: String = String(value);
			while (result.length < n) {
				result = "0" + result;
			}
			return result;
		}
		
		public static function intToTime(value: int): String {
			var minutes: int = Math.floor(value / 1000.0 / 60.0);
			value -= minutes * 1000 * 60;
			var seconds: int = Math.floor(value / 1000.0);
			value -= seconds * 1000;
			return minutes + ":" + pad(seconds,2) + "." + pad(value,3);
		}
		
	}
	
}