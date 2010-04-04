/**
 * This is a generated class and is not intended for modfication.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - TrackdayRow.as.
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
public class _Super_TrackdayRow extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void 
    {
        try 
        {
            if (flash.net.getClassByAlias("TrackdayRow") == null)
            {
                flash.net.registerClassAlias("TrackdayRow", cz);
            } 
        }
        catch (e:Error) 
        {
            flash.net.registerClassAlias("TrackdayRow", cz); 
        }
    }   
     
    model_internal static function initRemoteClassAliasAllRelated() : void 
    {
    }

	model_internal var _dminternal_model : _TrackdayRowEntityMetadata;

	/**
	 * properties
	 */
	private var _internal_trackday_id : int;
	private var _internal_track_id : int;
	private var _internal_organization_id : int;
	private var _internal_date : String;
	private var _internal_trackname : String;
	private var _internal_organizationname : String;

    private static var emptyArray:Array = new Array();

    /**
     * derived property cache initialization
     */  
    model_internal var _cacheInitialized_isValid:Boolean = false;   
    
	model_internal var _changeWatcherArray:Array = new Array();   

	public function _Super_TrackdayRow() 
	{	
		_model = new _TrackdayRowEntityMetadata(this);
	
		// Bind to own data properties for cache invalidation triggering  
       
	}

    /**
     * data property getters
     */
	[Bindable(event="propertyChange")] 
    public function get trackday_id() : int    
    {
            return _internal_trackday_id;
    }    
	[Bindable(event="propertyChange")] 
    public function get track_id() : int    
    {
            return _internal_track_id;
    }    
	[Bindable(event="propertyChange")] 
    public function get organization_id() : int    
    {
            return _internal_organization_id;
    }    
	[Bindable(event="propertyChange")] 
    public function get date() : String    
    {
            return _internal_date;
    }    
	[Bindable(event="propertyChange")] 
    public function get trackname() : String    
    {
            return _internal_trackname;
    }    
	[Bindable(event="propertyChange")] 
    public function get organizationname() : String    
    {
            return _internal_organizationname;
    }    

    /**
     * data property setters
     */      
    public function set trackday_id(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_trackday_id;               
        if (oldValue !== value)
        {
            _internal_trackday_id = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trackday_id", oldValue, _internal_trackday_id));
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
    public function set organization_id(value:int) : void 
    {    	
        var recalcValid:Boolean = false;
    	
    	
    	var oldValue:int = _internal_organization_id;               
        if (oldValue !== value)
        {
            _internal_organization_id = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "organization_id", oldValue, _internal_organization_id));
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
    public function set trackname(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_trackname == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_trackname;               
        if (oldValue !== value)
        {
            _internal_trackname = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "trackname", oldValue, _internal_trackname));
        }    	     
        
        if (recalcValid && model_internal::_cacheInitialized_isValid)
        {
            model_internal::isValid_der = model_internal::calculateIsValid();
        }  
    }    
    public function set organizationname(value:String) : void 
    {    	
        var recalcValid:Boolean = false;
    	if (value == null || _internal_organizationname == null)
    	{
    		recalcValid = true;
    	}	
    	
    	
    	var oldValue:String = _internal_organizationname;               
        if (oldValue !== value)
        {
            _internal_organizationname = value;
        	this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "organizationname", oldValue, _internal_organizationname));
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

		if (_model.isDateAvailable && _internal_date == null)
		{
			violatedConsts.push("dateIsRequired");
			validationFailureMessages.push("date is required");
		}
		if (_model.isTracknameAvailable && _internal_trackname == null)
		{
			violatedConsts.push("tracknameIsRequired");
			validationFailureMessages.push("trackname is required");
		}
		if (_model.isOrganizationnameAvailable && _internal_organizationname == null)
		{
			violatedConsts.push("organizationnameIsRequired");
			validationFailureMessages.push("organizationname is required");
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
    public function get _model() : _TrackdayRowEntityMetadata
    {
		return model_internal::_dminternal_model;              
    }	
    
    public function set _model(value : _TrackdayRowEntityMetadata) : void       
    {
    	var oldValue : _TrackdayRowEntityMetadata = model_internal::_dminternal_model;               
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
