/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Gpslog.as.
 */

package valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_Gpslog extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void 
    {
        try 
        {
            if (flash.net.getClassByAlias("Gpslog") == null)
            {
                flash.net.registerClassAlias("Gpslog", cz);
            } 
        }
        catch (e:Error) 
        {
            flash.net.registerClassAlias("Gpslog", cz); 
        }
    }   
     
    model_internal static function initRemoteClassAliasAllRelated() : void 
    {
    }

	model_internal var _dminternal_model : _GpslogEntityMetadata;

	/**
	 * properties
	 */
	private var _internal_gpslog_id : int;
	private var _internal_track_id : int;
	private var _internal_track_name : String;
	private var _internal_rider_id : int;
	private var _internal_rider_firstname : String;
	private var _internal_rider_lastname : String;
	private var _internal_date : String;
	private var _internal_start_time : String;
	private var _internal_end_time : String;

    private static var emptyArray:Array = new Array();

    /**
     * derived property cache initialization
     */  
    model_internal var _cacheInitialized_isValid:Boolean = false;   
    
	model_internal var _changeWatcherArray:Array = new Array();   

	public function _Super_Gpslog() 
	{	
		_model = new _GpslogEntityMetadata(this);
	
		// Bind to own data properties for cache invalidation triggering  
       
	}

    /**
     * data property getters
     */
	[Bindable(event="propertyChange")] 
    public function get gpslog_id() : int    
    {
            return _internal_gpslog_id;
    }    
	[Bindable(event="propertyChange")] 
    public function get track_id() : int    
    {
            return _internal_track_id;
    }    
	[Bindable(event="propertyChange")] 
    public function get track_name() : String    
    {
            return _internal_track_name;
    }    
	[Bindable(event="propertyChange")] 
    public function get rider_id() : int    
    {
            return _internal_rider_id;
    }    
	[Bindable(event="propertyChange")] 
    public function get rider_firstname() : String    
    {
            return _internal_rider_firstname;
    }    
	[Bindable(event="propertyChange")] 
    public function get rider_lastname() : String    
    {
            return _internal_rider_lastname;
    }    
	[Bindable(event="propertyChange")] 
    public function get date() : String    
    {
            return _internal_date;
    }    
	[Bindable(event="propertyChange")] 
    public function get start_time() : String    
    {
            return _internal_start_time;
    }    
	[Bindable(event="propertyChange")] 
    public function get end_time() : String    
    {
            return _internal_end_time;
    }    

    /**
     * data property setters
     */      
    public function set gpslog_id(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_gpslog_id;               
        if (oldValue !== value)
        {
            _internal_gpslog_id = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "gpslog_id", oldValue, _internal_gpslog_id));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set track_id(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_track_id;               
        if (oldValue !== value)
        {
            _internal_track_id = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "track_id", oldValue, _internal_track_id));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set track_name(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_track_name == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_track_name;               
        if (oldValue !== value)
        {
            _internal_track_name = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "track_name", oldValue, _internal_track_name));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
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
    public function set rider_firstname(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_rider_firstname == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_rider_firstname;               
        if (oldValue !== value)
        {
            _internal_rider_firstname = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rider_firstname", oldValue, _internal_rider_firstname));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set rider_lastname(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_rider_lastname == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_rider_lastname;               
        if (oldValue !== value)
        {
            _internal_rider_lastname = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rider_lastname", oldValue, _internal_rider_lastname));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set date(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_date == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_date;               
        if (oldValue !== value)
        {
            _internal_date = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "date", oldValue, _internal_date));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set start_time(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_start_time == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_start_time;               
        if (oldValue !== value)
        {
            _internal_start_time = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "start_time", oldValue, _internal_start_time));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set end_time(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_end_time == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_end_time;               
        if (oldValue !== value)
        {
            _internal_end_time = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "end_time", oldValue, _internal_end_time));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    

    /**
     * data property setter listeners
     */   

   model_internal function setterListenerAnyConstraint(value:flash.events.Event):void
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

		if (_model.isTrack_nameAvailable && _internal_track_name == null)
		{
			violatedConsts.push("track_nameIsRequired");
			validationFailureMessages.push("track_name is required");
		}
		if (_model.isRider_firstnameAvailable && _internal_rider_firstname == null)
		{
			violatedConsts.push("rider_firstnameIsRequired");
			validationFailureMessages.push("rider_firstname is required");
		}
		if (_model.isRider_lastnameAvailable && _internal_rider_lastname == null)
		{
			violatedConsts.push("rider_lastnameIsRequired");
			validationFailureMessages.push("rider_lastname is required");
		}
		if (_model.isDateAvailable && _internal_date == null)
		{
			violatedConsts.push("dateIsRequired");
			validationFailureMessages.push("date is required");
		}
		if (_model.isStart_timeAvailable && _internal_start_time == null)
		{
			violatedConsts.push("start_timeIsRequired");
			validationFailureMessages.push("start_time is required");
		}
		if (_model.isEnd_timeAvailable && _internal_end_time == null)
		{
			violatedConsts.push("end_timeIsRequired");
			validationFailureMessages.push("end_time is required");
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
    public function get _model() : _GpslogEntityMetadata
    {
		return model_internal::_dminternal_model;              
    }	
    
    public function set _model(value : _GpslogEntityMetadata) : void       
    {
    	var oldValue : _GpslogEntityMetadata = model_internal::_dminternal_model;               
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
     private var _managingService:com.adobe.fiber.services.IFiberManagingService;
    
     public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
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
