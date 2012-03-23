/* ApsalarPlugin for PhoneGap - Apsalar communicator!
*
 * @author WizCorp Inc. [ Incorporated Wizards ] 
 * @copyright 2011
 * @file - apsalar.js
 * @about - JavaScript PhoneGap bridge for Apsalar native SDKs 
 *
 *
*/

var apsalarPlugin = { 

		event: function(a,b,s,f) {
			if(typeof(b) == "undefined") {
		 		return PhoneGap.exec( s, f, 'ApsalarPlugin', 'event', [a, {}] );	
			} else {
				return PhoneGap.exec( s, f, 'ApsalarPlugin', 'event', [a, b] );
			}
				
		},
    
        startSession: function(s,f) {
            return PhoneGap.exec( s, f, 'ApsalarPlugin', 'startSession', [] );	
        },
    
        endSession: function(s,f) {
            return PhoneGap.exec( s, f, 'ApsalarPlugin', 'endSession', [] );	
        }
    
    
};