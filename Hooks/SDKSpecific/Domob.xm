#import "../SharedDefine.pch"
#import <UIKit/UIKit.h>
%group Domob
%hook DMFeedsAdView
- (id)initWithPublisherId:(NSString *)publisherId     // Domob PublisherId
              placementId:(NSString *)placementId     // Domob PlacementId
                   origin:(CGPoint)adOrigin{return nil;}          // origin for FeedsAdView

// load ad
- (void)loadAd{}
// present ad
- (void)present{}
%end
%hook DMInterstitialAdController
- (id)initWithPublisherId:(NSString *)publisherId                   // Domob PublisherId
              placementId:(NSString *)placementId                   // Domob PlacementId
       rootViewController:(UIViewController *)rootViewController{
        return nil;
       }   // set RootViewController


// load ad
- (void)loadAd{}

// present ad
- (void)present{}
%end
%hook DMSplashAdController
- (id)initWithPublisherId:(NSString *)publisherId   // Domob PublisherId
              placementId:(NSString *)placementId   // Domob PlacementId
                   window:(id)window{
                   	return nil;
                   }       // Key Window for presenting the ad

// init splash viewController
- (id)initWithPublisherId:(NSString *)publisherId   // Domob PublisherId
              placementId:(NSString *)placementId   // Domob PlacementId
                   window:(UIWindow *)window        // Key Window for presenting the ad
               background:(UIColor *)background{return nil;}    // background color/Image before the ad view appear, deafult is black

// init splash viewController
- (id)initWithPublisherId:(NSString *)publisherId   // Domob PublisherId
              placementId:(NSString *)placementId   // Domob PlacementId
                   window:(UIWindow *)keyWindow     // Key Window for presenting the ad
               background:(UIColor *)background     // background color/Image before the ad view appear, deafult is black
                animation:(BOOL)animation{return nil;}          // animation for close,deafult is yes

// init splash viewController
// You can specify ad size, and display position. So that a better combination of advertising and default.png
- (id)initWithPublisherId:(NSString *)publisherId   // Domob PublisherId
              placementId:(NSString *)placementId   // Domob PlacementId
                     size:(CGSize)adSize            // size for Vertical screen ,full screen size for Horizontal screen
                   offset:(CGFloat)offset           // offset in origin.y only support Vertical screen
                   window:(id)keyWindow     // Key Window for presenting the ad
               background:(id)background animation:(BOOL)animation{return nil;}    
%end
%hook DMTools
- (id)initWithPublisherId:(NSString *)publisherId{
return nil;
}
%end
%hook DMAdView
- (id)initWithPublisherId:(NSString *)publisherId // Publisher ID
              placementId:(NSString *)placementId{
              	return nil;
              } // Placement ID

- (id)initWithPublisherId:(NSString *)publisherId // Publisher ID
              placementId:(NSString *)placementId // Placement ID
              autorefresh:(BOOL)autorefresh{
              	return nil;
              }
- (void)loadAd{

}
%end
%end
extern void init_Domob_hook(){
	if(objc_getClass("DMAdView")!=NULL){
%init(Domob);
}
}
