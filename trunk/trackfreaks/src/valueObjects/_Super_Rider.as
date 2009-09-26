/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Rider.as.
 */

package valueObjects
{
import flash.events.EventDispatcher;
import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.IValueObject;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.services.IFiberManagingService;
import mx.binding.utils.ChangeWatcher;
import mx.rpc.AbstractService;


import flash.events.Event;
import mx.events.CollectionEvent;
import mx.events.PropertyChangeEvent;


use namespace model_internal;

[ExcludeClass]
public class _Super_Rider extends EventDispatcher implements IValueObject
{
    model_internal static function initRemoteClassAlias(cz:Class) : void 
    {
        try 
        {
            if (flash.net.getClassByAlias("Rider") == null)
            {
                flash.net.registerClassAlias("Rider", cz);
            } 
        }
        catch (e:Error) 
        {
            flash.net.registerClassAlias("Rider", cz); 
        }
     }   

	model_internal var _dminternal_model : _RiderEntityMetadata;

	/**
	 * properties
	 */
	private var _internal_rider_id : int;
	private var _internal_firstname : String;
	private var _internal_lastname : String;
	private var _internal_picture_id : int;

    private static var emptyArray:Array = new Array();

    /**
     * derived property cache initialization
     */  
    model_internal var _cacheInitialized_isValid:Boolean = false;   
    
	model_internal var _changeWatcherArray:Array = new Array();   

	public function _Super_Rider() 
	{	
		_model = new _RiderEntityMetadata(this);
	
		// Bind to own data properties for cache invalidation triggering  
       
	}

    /**
     * data property getters
     */
	[Bindable(event="propertyChange")] 
    public function get rider_id() : int    
    {
            return _internal_rider_id;
    }    
	[Bindable(event="propertyChange")] 
    public function get firstname() : String    
    {
            return _internal_firstname;
    }    
	[Bindable(event="propertyChange")] 
    public function get lastname() : String    
    {
            return _internal_lastname;
    }    
	[Bindable(event="propertyChange")] 
    public function get picture_id() : int    
    {
            return _internal_picture_id;
    }    

    /**
     * data property setters
     */      
    public function set rider_id(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_rider_id;               
        if (oldValue !== value)
        {
        	_internal_rider_id = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rider_id", oldValue, _internal_rider_id));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set firstname(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_firstname == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_firstname;               
        if (oldValue !== value)
        {
        	_internal_firstname = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "firstname", oldValue, _internal_firstname));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set lastname(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_lastname == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_lastname;               
        if (oldValue !== value)
        {
        	_internal_lastname = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lastname", oldValue, _internal_lastname));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set picture_id(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_picture_id;               
        if (oldValue !== value)
        {
        	_internal_picture_id = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "picture_id", oldValue, _internal_picture_id));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    

    /**
     * data property setter listeners
     */   

   model_internal function setterListenerAnyConstraint(value:Event):void
   {
        if (model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }        
   }   

    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();    
        var validationFailureMessages:Array = new Array();    

		if (_model.isFirstnameAvailable && _internal_firstname == null)
		{
			violatedConsts.push("firstnameIsRequired");
			validationFailureMessages.push("firstname is required");
		}
		if (_model.isLastnameAvailable && _internal_lastname == null)
		{
			violatedConsts.push("lastnameIsRequired");
			validationFailureMessages.push("lastname is required");
		}

		var styleValidity:Boolean = true;
	
	
	
	
    
        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && styleValidity;
    }  

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
       	var oldValue:Boolean = model_internal::_isValid;               
        if (oldValue !== value)
        {
        	model_internal::_isValid = value;
        	_model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }        
    }

    /**
     * derived property getters
     */

    [Transient] 
	[Bindable(event="propertyChange")] 
    public function get _model() : _RiderEntityMetadata
    {
		return model_internal::_dminternal_model;              
    }	
    
    public function set _model(value : _RiderEntityMetadata) : void       
    {
    	var oldValue : _RiderEntityMetadata = model_internal::_dminternal_model;               
        if (oldValue !== value)
        {
        	model_internal::_dminternal_model = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }     
    }      

    /**
     * methods
     */  


    /**
     *  services
     */                  
     private var _managingService:IFiberManagingService;
    
     public function set managingService(managingService:IFiberManagingService):void
     {
         _managingService = managingService;
     }                      
     
    model_internal function set invalidConstraints_der(value:Array) : void
    {  
     	var oldValue:Array = model_internal::_invalidConstraints;
     	// avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;   
			_model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);   
        }     	             
    }             
    
     model_internal function set validationFailureMessages_der(value:Array) : void
    {  
     	var oldValue:Array = model_internal::_validationFailureMessages;
     	// avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;   
			_model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);   
        }     	             
    }        
     
     // Individual isAvailable functions     
	// fields, getters, and setters for primitive representations of complex id properties

}

}
