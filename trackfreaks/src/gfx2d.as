package {

	public class gfx2d {
		
		private static function relativeCCW(x1, y1, x2, y2, x3, y3) : Number {
			x2 -= x1;
			y2 -= y1;
			x3 -= x1;
			y3 -= y1;
            return x3 * y2 - y3 * x2;
		} 
		
		public static function linesIntersect(x1, y1, x2, y2, x3, y3, x4, y4) : Boolean {
			return ( (relativeCCW(x1, y1, x2, y2, x3, y3) > 0)
				&& (relativeCCW(x1, y1, x2, y2, x4, y4) < 0)
				&& (relativeCCW(x3, y3, x4, y4, x1, y1) < 0)
				&& (relativeCCW(x3, y3, x4, y4, x2, y2) >= 0) );
		} 
		
		public static function intersection(p0, p1, p2, p3) : Number {
            var result: Number = 9999.9;

            var x0: Number = p2.x - p0.x;
            var y0: Number = p2.y - p0.y;

            var x1: Number = p1.x - p0.x;
            var y1: Number = p1.y - p0.y;

            var x2: Number = p3.x - p2.x;
            var y2: Number = p3.y - p2.y;

            result = ((x2 * y0) - (x0 * y2)) / ((x2 * y1) - (x1 * y2));

            return result;
        }

	}

}