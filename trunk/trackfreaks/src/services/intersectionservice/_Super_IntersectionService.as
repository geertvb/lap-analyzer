/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - IntersectionService.as.
 */
package services.intersectionservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import mx.collections.ArrayCollection;
import valueObjects.Intersection;
import mx.collections.ItemResponder;
import mx.rpc.remoting.RemoteObject; 
import mx.rpc.remoting.Operation;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.serializers.utility.TypeUtility;

[ExcludeClass]
internal class _Super_IntersectionService extends RemoteObjectServiceWrapper
{      
       
    // Constructor
    public function _Super_IntersectionService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "getIntersection");
		 operation.resultType = valueObjects.Intersection; 		 
        operations["getIntersection"] = operation;
        operation = new Operation(null, "updateByTrack");
        operations["updateByTrack"] = operation;
        operation = new Operation(null, "findByTrack");
		 operation.resultType = Object; 		 
        operations["findByTrack"] = operation;
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "IntersectionService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "IntersectionService";
        
    
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'getIntersection' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function getIntersection() : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("getIntersection");
		var _internal_token:AsyncToken = _internal_operation.send() ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'updateByTrack' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function updateByTrack(track_id:int, intersections:ArrayCollection) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("updateByTrack");
		var _internal_token:AsyncToken = _internal_operation.send(track_id,intersections) ;

		return _internal_token;
	}   
	 
	/**
	  * This method is a generated wrapper used to call the 'findByTrack' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function findByTrack(track_id:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("findByTrack");
		var _internal_token:AsyncToken = _internal_operation.send(track_id) ;

		return _internal_token;
	}   
	 
}

}
