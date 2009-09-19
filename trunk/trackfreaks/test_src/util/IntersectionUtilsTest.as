package util
{
	import flash.geom.Point;
	
	import flexunit.framework.Assert;
	
	public class IntersectionUtilsTest
	{
		// Reference declaration for class to test
		private var classToTestRef : util.IntersectionUtils;
		
		public function IntersectionUtilsTest()
		{
		}
		
		[Test]
		public function testIntersects():void {
			var p1: Point = new Point(0,0);
			var p2: Point = new Point(1,1);
			var p3: Point = new Point(1,0);
			var p4: Point = new Point(0,1);
			Assert.assertTrue(IntersectionUtils.intersects(p1, p2, p3, p4));
			Assert.assertFalse(IntersectionUtils.intersects(p1, p2, p4, p3));
		}
		
		[Test]
		public function testIntersects2():void {
			var p3: Point = new Point(0,0);
			var p4: Point = new Point(1,1);
			var p2: Point = new Point(1,0);
			var p1: Point = new Point(0.5,0.5);
			Assert.assertTrue(IntersectionUtils.intersects(p1, p2, p3, p4));
		}
		
		[Test]
		public function testIntersects3():void {
			var p3: Point = new Point(0,0);
			var p4: Point = new Point(1,1);
			var p2: Point = new Point(0.5,0.5);
			var p1: Point = new Point(0,1);
			Assert.assertFalse(IntersectionUtils.intersects(p1, p2, p3, p4));
		}
		
	}
}