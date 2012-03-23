/* ApsalarPlugin - IOS side of the bridge to AppsalarPlugin JavaScript for PhoneGap
 *
 * @author WizCorp Inc. [ Incorporated Wizards ] 
 * @copyright 2011
 * @file ApsalarManager.h for PhoneGap
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#ifdef PHONEGAP_FRAMEWORK
    #import <PhoneGap/PGPlugin.h>
#else
    #import "PGPlugin.h"
#endif

@interface ApsalarPlugin : PGPlugin {

}

/* Apsalar methods
 */
- (void)startSession:(NSArray*)arguments withDict:(NSDictionary*)options;
- (void)endSession:(NSArray*)arguments withDict:(NSDictionary*)options;
- (void)event:(NSArray*)arguments withDict:(NSDictionary*)options;

@end
