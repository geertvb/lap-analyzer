/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - TimingService.as.
 */
package services.timingservice
{
import mx.rpc.AsyncToken;
import com.adobe.fiber.core.model_internal;
import mx.rpc.AbstractOperation;
import mx.collections.ItemResponder;
import mx.rpc.remoting.RemoteObject; 
import mx.rpc.remoting.Operation;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.serializers.utility.TypeUtility;

[ExcludeClass]
internal class _Super_TimingService extends RemoteObjectServiceWrapper
{      
       
    // Constructor
    public function _Super_TimingService()
    {
        // initialize service control
        _serviceControl = new RemoteObject(); 
        
        var operations:Object = new Object();
        var operation:Operation;         
         
        operation = new Operation(null, "findByGpslogID");
		 operation.resultType = Object; 		 
        operations["findByGpslogID"] = operation;
    
        _serviceControl.operations = operations;   
		_serviceControl.convertResultHandler = TypeUtility.convertResultHandler;
        _serviceControl.source = "TimingService";
        _serviceControl.endpoint = "gateway.php";
		_serviceControl.destination = "TimingService";
        
    
                      
         model_internal::initialize();
    }

	/**
	  * This method is a generated wrapper used to call the 'findByGpslogID' operation. It returns an AsyncToken whose 
	  * result property will be populated with the result of the operation when the server response is received. 
	  * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	  * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	  */          
	public function findByGpslogID(gpslog_id:int) : AsyncToken
	{
		var _internal_operation:AbstractOperation = _serviceControl.getOperation("findByGpslogID");
		var _internal_token:AsyncToken = _internal_operation.send(gpslog_id) ;

		return _internal_token;
	}   
	 
}

}
