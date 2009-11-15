package util
{
	import flash.geom.Point;

	public class IntersectionUtils {
		
		public static function area(a: Point, b: Point, c: Point) : Number {
			var x0: Number = b.x - a.x;
			var y0: Number = b.y - a.y;
			var x1: Number = c.x - a.x;
			var y1: Number = c.y - a.y;
			var area: Number = x0 * y1 - x1 * y0;
			//trace("Area = " + area);
			return area;
		}
		
		public static function intersects(p1: Point, p2: Point, p3: Point, p4: Point) : Boolean {
			//trace("Intersects");
			return area(p1, p2, p3) <= 0
				&& area(p1, p2, p4) >= 0
				&& area(p3, p4, p1) >= 0
				&& area(p3, p4, p2) < 0;
		}
			
		public static function intersectionFactor(p1: Point, p2: Point, p3: Point, p4: Point) : Number {
			var dx0: Number = p1.x - p3.x;
			var dy0: Number = p1.y - p3.y;
			var dx1: Number = p2.x - p1.x;
			var dy1: Number = p2.y - p1.y;
			var dx2: Number = p4.x - p3.x;
			var dy2: Number = p4.y - p3.y;
			var numerator: Number = dx0 * dy1 - dy0 * dx1;
			var denominator: Number = dx2 * dy1 - dy2 * dx1;
			return numerator / denominator;
		}
			
		
	}
}