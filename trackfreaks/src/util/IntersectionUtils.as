package util
{
	import flash.geom.Point;

	public class IntersectionUtils
	{
		public function IntersectionUtils()
		{
			
			public function area(a: Point, b: Point, c: Point) : Number {
				var x0: Number = b.x - a.x;
				var y0: Number = b.y - a.y;
				var x1: Number = c.x - a.x;
				var y1: Number = c.y - a.y;
				return x0 * y1 - x1 * y0;
			}
			
			public function intersects(p1: Point, p2: Point, p3: Point, p4: Point) : Boolean {
				return area(p1, p2, p3) <= 0
					&& area(p1, p2, p4) >= 0
					&& area(p3, p4, p1) >= 0
					&& area(p3, p4, p2) <= 0;
			}
			
			
		}
	}
}