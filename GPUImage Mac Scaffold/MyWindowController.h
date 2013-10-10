#import <Cocoa/Cocoa.h>
#import <GPUImage/GPUImage.h>

@interface MyWindowController : NSWindowController
{
    // our filter
    GPUImageFilter *imageFilter;
    // our camera
    GPUImageAVCamera *videoCamera;
}

// our view
@property(readwrite) IBOutlet GPUImageView *imageView;
@property (unsafe_unretained) IBOutlet NSTextView *shaderCodeTextView;
@property (weak) IBOutlet GPUImageView *inputImageView;
@property (unsafe_unretained) IBOutlet NSTextView *vertexShaderTextView;

- (IBAction)clickedUseShaderCodeButton:(id)sender;
@end
