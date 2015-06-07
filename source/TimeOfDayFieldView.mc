using Toybox.WatchUi as Ui;
using Toybox.System as System;
using Toybox.Lang as Lang;

class TimeOfDayFieldView extends Ui.SimpleDataField {

    //! Set the label of the data field here.
    function initialize() {
        label = "Time";
    }

    //! The given info object contains all the current workout
    //! information. Calculate a value and return it in this method.
    function compute(info) {
        // See Activity.Info in the documentation for available information.
		var time = System.getClockTime();

		var hour = time.hour;
		var minute = time.min.toString();
		
		if (hour > 12 || hour == 0) {
	        var deviceSettings = System.getDeviceSettings();
	        if (!deviceSettings.is24Hour) {
	        	if (hour == 0) {
	        		hour = 12;
	        	} else {
	        		hour = hour - 12;
	        	}
	        }
        }
        
        if (minute.toNumber() < 10) {
        	minute = "0" + minute;
        }
        var timeString = Lang.format("$1$:$2$", [hour, minute]);
		
        return timeString;
    }
}