/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TrackService.as.
 */
package services.trackservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import valueObjects.Track;
import mx.collections.ItemResponder;
import mx.rpc.remoting.RemoteObject; 
import mx.rpc.remoting.Operation;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.serializers.utility.TypeUtility;

[ExcludeClass]
internal class _Super_TrackService extends RemoteObjectServiceWrapper
{      
       
    // Constructor
    public function _Super_TrackService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "findByLatLng");
		 operation.resultType = valueObjects.Track; 		 
        operations["findByLatLng"] = operation;

        valueObjects.Track._initRemoteClassAlias();
        operation = new Operation(null, "findAll");
		 operation.resultElementType = valueObjects.Track;
        operations["findAll"] = operation;

        valueObjects.Track._initRemoteClassAlias();
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "TrackService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "TrackService";
        
    
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'findByLatLng' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function findByLatLng(minlat:Number, minlng:Number, maxlat:Number, maxlng:Number) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("findByLatLng");
		var _internal_token:AsyncToken = _internal_operation.send(minlat,minlng,maxlat,maxlng) ;

		return _internal_token;
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
	 
}

}
