

/* ApsalarPlugin - IOS side of the bridge to AppsalarPlugin JavaScript for PhoneGap
 *
 * @author WizCorp Inc. [ Incorporated Wizards ] 
 * @copyright 2011
 * @file ApsalarPlugin.mm for PhoneGap
 *
 */

#import "ApsalarPlugin.h"
#import "ZombieJombiePluginCustomization.h"
#import "WizDebugLog.h"

#ifdef PHONEGAP_FRAMEWORK
#import <PhoneGap/JSON.h>
#else
#import "JSON.h"
#endif



@implementation ApsalarPlugin

- (void)startSession:(NSArray *)arguments withDict:(NSDictionary *)options
{
    NSUInteger argc = [arguments count];
    
    if (argc < 1) {
        // Send Exception?
		return;
	}

    
    WizLog(@"[ApsalarPlugin] ******* Starting Apsalar Session");
    
    NSString* callbackID  = [arguments objectAtIndex:0];
    
    @try {
        [[ZombieJombiePluginCustomization sharedZombieJombiePluginCustomization:nil].pluginAnalytics startAnalyticsSession];
    }
    @catch (NSException *exception) {
        WizLog(@"main: Caught %@: %@", [exception name], [exception reason]);
        PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_ERROR messageAsString:@"Apsalar: error connecting"];
        [self writeJavascript: [pluginResult toErrorCallbackString:callbackID]];
    }
    @finally {
        WizLog(@"Apsalar session started");
        PluginResult* pluginResult = [PluginResult resultWithStatus:PGCommandStatus_OK messageAsString:@"Apsalar session started"];
        [self writeJavascript: [pluginResult toSuccessCallbackString:callbackID]];
    }    
}


- (void)endSession:(NSArray *)arguments withDict:(NSDictionary *)options
{
    WizLog(@"[ApsalarPlugin] ******* Ending Apsalar Session");
    
    //[Apsalar endSession];
    [[ZombieJombiePluginCustomization sharedZombieJombiePluginCustomization:nil].pluginAnalytics endAnalyticsSession];}


- (void)reStartSession:(NSArray *)arguments withDict:(NSDictionary *)options
{
    WizLog(@"[ApsalarPlugin] ******* Re-Starting Apsalar Session");
    
   
    WizLog(@"Arguments:%@", arguments);
    WizLog(@"Options:%@", options);

    
    //[Apsalar reStartSession:apsKey withKey:apsSecret];
    [[ZombieJombiePluginCustomization sharedZombieJombiePluginCustomization:nil].pluginAnalytics reStartAnalyticsSession];}


- (void)event:(NSArray *)arguments withDict:(NSDictionary *)options
{
    
    NSUInteger argc = [arguments count];
    
    if (argc < 1) {
        // Send Exception?
		return;	
	}
    
    NSString *eventName = [arguments objectAtIndex:1];

    [[ZombieJombiePluginCustomization sharedZombieJombiePluginCustomization:nil].pluginAnalytics analyticsEvent:eventName
                                                                                              withExtraMetadata:options];
    //[Apsalar event:eventName];
    WizLog(@"[ApsalarPlugin] ******* [event] %@: %@", eventName, options);
    
}

/*
- (void)eventParams:(NSArray *)arguments withDict:(NSDictionary *)options
{
    NSUInteger argc = [arguments count];
    
    if (argc < 1) {
        // Send Exception?
		return;	
	}
    
    NSString *eventName = [arguments objectAtIndex:1];
    
    if(!options)
    {
        [Apsalar event:eventName];
        WizLog(@"[ApsalarPlugin] ******* [event] %@", eventName);
        
    }
    else
    {
        [Apsalar event:eventName withArgs:options];
        WizLog(@"[ApsalarPlugin] ******* [event with params] %@", eventName);
    }
}
*/

- (void)eventWithArgs:(NSArray *)arguments withDict:(NSDictionary *)options
{
    //not needed as for dictionary object [Apsalar event:eventName withArgs:options]; well surfice
    
}


@end