package {
	import com.google.maps.LatLng;
	
	import flash.display.GraphicsPathCommand;
	import flash.geom.Point;
	import flash.text.TextLineMetrics;
	
	import mx.controls.Label;
	import mx.core.UIComponent;

	public class IntersectionMarker {
		
		public var projection: Projection;
		
		public var latLng: LatLng;
		public var angle: Number;

		public var x: Number;
		public var y: Number;
		public var vx: Number;
		public var vy: Number;
		
		public var x1: Number;
		public var y1: Number;
		public var x2: Number;
		public var y2: Number;
		
		public var parent: UIComponent;
		public var marker: UIComponent;
		public var label: Label;
		
		public var labelText: String;
		
		public function drawMarker() : void {

			if (marker) {
				marker.graphics.clear();
			} else {
				marker = new UIComponent();
				parent.addChild(marker);
			}
			
			var d: Number = projection.zoom * 0.02;
			
			x1 = x - vy * d;
			y1 = y + vx * d;
			x2 = x + vy * d;
			y2 = y - vx * d;
			
			with (marker.graphics) {
				lineStyle(2, 0xFF0000, 1);
				drawPath(
					Vector.<int>([GraphicsPathCommand.MOVE_TO,GraphicsPathCommand.LINE_TO]),
					Vector.<Number>([x1, y1, x2, y2])
				);
				drawCircle(x1, y1, 4);
				drawCircle(x2, y2, 4);
			}
			
		}
		
		public function drawLabel() : void {
			
			if (!label) {
				label = new Label();
				parent.addChild(label);
			}
			
			label.text = labelText;
			var tlm: TextLineMetrics = label.measureText(labelText);
			label.x = x + 24 * vy - (tlm.width + 5) / 2;
			label.y = y - 24 * vx - (tlm.height + 4) / 2;

		}

		public function draw() : void {
			
			var p: Point = projection.latLng2xy(latLng);
			x = p.x;
			y = p.y;
			vx = Math.cos(angle);
			vy = Math.sin(angle);
			
			drawMarker();
			drawLabel();
		}
		
		public function hide() : void {
			if (parent) {
				if (marker) {
					parent.removeChild(marker);
					marker == null;
				}
				if (label) {
					parent.removeChild(label);
					label == null;
				}
			}
		}
		
		public function destroy() : void {
			hide();
			parent = null;
			projection = null;
		}
		
	}

}