#import <Cocoa/Cocoa.h>
#import "MyWindowController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    MyWindowController *windowController;
}

@property (assign) IBOutlet NSWindow *window;

@end
