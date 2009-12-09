package {
	
	import com.google.maps.LatLng;
	
	import flash.geom.Point;
	
	import mx.core.UIComponent;
	
	public class RiderMarker {
		
		public var projection: Projection;
		
		public var parent: UIComponent;
		public var marker: UIComponent;
		
		public function draw(latLng: LatLng) : void {
			var p: Point = projection.latLng2xy(latLng);
			if (marker && parent.contains(marker)) {
				marker.x = p.x;
				marker.y = p.y;
			} else {
				marker = new UIComponent();
				marker.x = p.x;
				marker.y = p.y;
				parent.addChild(marker);
				marker.graphics.lineStyle(2, 0x0000FF, 1);
				marker.graphics.drawCircle(0, 0, 4);
			}
		}
		
		public function hide() : void {
			if (parent && marker && parent.contains(marker)) {
				parent.removeChild(marker);
				marker == null;
			}
		}
		
		public function destroy() : void {
			hide();
			parent = null;
			projection = null;
		}
		
	}

}