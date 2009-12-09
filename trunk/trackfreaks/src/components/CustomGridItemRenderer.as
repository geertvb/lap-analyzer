package components {

	import flash.text.engine.FontWeight;

	import mx.collections.ArrayCollection;
	import mx.controls.DataGrid;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.controls.dataGridClasses.DataGridItemRenderer;
	import mx.controls.dataGridClasses.DataGridListData;

	public class CustomGridItemRenderer extends DataGridItemRenderer {

		public override function validateProperties() : void {
			if (listData) {
				var dg: DataGrid = DataGrid(listData.owner);
				var dp: ArrayCollection = ArrayCollection(dg.dataProvider);
				var fw: String = FontWeight.BOLD;
				var fc: int = 0x00AA00;
				var v: Number = data[DataGridListData(listData).dataField];
				for (var i: int = 0; i < dp.length; i++) {
					var o: Object = dp.getItemAt(i);
					var vi: Number = o[DataGridListData(listData).dataField];
					if (vi < v) {
						fw = FontWeight.NORMAL;
						fc = 0x000000;
						break;
					}
				}
				var column:DataGridColumn = dg.columns[listData.columnIndex];
				setStyle("fontWeight", fw);
				setStyle("color", fc);
			}
			super.validateProperties();
		}

	}

}