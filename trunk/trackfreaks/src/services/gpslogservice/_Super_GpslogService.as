/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - GpslogService.as.
 */
package services.gpslogservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.Gpslog;
import mx.collections.ItemResponder;
import mx.rpc.remoting.RemoteObject; 
import mx.rpc.remoting.Operation;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.serializers.utility.TypeUtility;

[ExcludeClass]
internal class _Super_GpslogService extends RemoteObjectServiceWrapper
{      
       
    // Constructor
    public function _Super_GpslogService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "findAll");
		 operation.resultElementType = Gpslog;
        operations["findAll"] = operation;
        operation = new Operation(null, "createGpslog");
        operations["createGpslog"] = operation;
        operation = new Operation(null, "findAllDates");
		 operation.resultElementType = Date;
        operations["findAllDates"] = operation;
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "GpslogService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "GpslogService";
        
    
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'findAll' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function findAll() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("findAll");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	

	/**
	  * This method is a generated wrapper used to call the 'createGpslog' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function createGpslog(rider_id:int, track_id:int, date:String, start_time:String, end_time:String, data:String) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("createGpslog");
		var _internal_token:AsyncToken = _internal_operation.send(rider_id,track_id,date,start_time,end_time,data) ;

		return _internal_token;
	}   
	

	/**
	  * This method is a generated wrapper used to call the 'findAllDates' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function findAllDates() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("findAllDates");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	

}

}
