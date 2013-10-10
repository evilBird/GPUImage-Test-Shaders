#import "MyWindowController.h"



@implementation MyWindowController

@synthesize imageView = _imageView;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow: window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // set up camera (you can set the preset down to medium or low, for faster processing)
    videoCamera = [[GPUImageAVCamera alloc] initWithSessionPreset:AVCaptureSessionPresetHigh cameraDevice:[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo]];
    
    [videoCamera addTarget:self.inputImageView];
    
    [self.shaderCodeTextView setFont:[NSFont fontWithName:@"Menlo" size:10]];
    [self.vertexShaderTextView  setFont:[NSFont fontWithName:@"Menlo" size:10]];
    
    // GPUImageGrayscaleFilter shader
    self.shaderCodeTextView.string =  @"varying vec2 textureCoordinate;\n\nuniform sampler2D inputImageTexture;\n\nconst vec3 W = vec3(0.2125, 0.7154, 0.0721);\n\nvoid main()\n{\n   vec4 textureColor = texture2D(inputImageTexture, textureCoordinate);\n   float luminance = dot(textureColor.rgb, W);\n\n   gl_FragColor = vec4(vec3(luminance), textureColor.a);\n}";
    
    
    // default vertex shader
    self.vertexShaderTextView.string = @"attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n\nvarying vec2 textureCoordinate;\n\nvoid main()\n{\n   gl_Position = position;\n\n   textureCoordinate = inputTextureCoordinate.xy;\n}";
    
    [self setUpNewFilterWithFragmentShader:self.shaderCodeTextView.string vertexShader:self.vertexShaderTextView.string];
    
    [videoCamera startCameraCapture];
}

-(void)setUpNewFilterWithFragmentShader:(NSString*)fragment vertexShader:(NSString*)vertex
{
    [videoCamera removeTarget:imageFilter];
    [imageFilter removeTarget:self.imageView];
    
    imageFilter = [[GPUImageFilter alloc] initWithVertexShaderFromString:vertex fragmentShaderFromString:fragment];
    [imageFilter forceProcessingAtSizeRespectingAspectRatio:self.imageView.sizeInPixels];
    
    [videoCamera addTarget:imageFilter];
    [imageFilter addTarget:self.imageView];
    [videoCamera startCameraCapture];
}

- (IBAction)clickedUseShaderCodeButton:(id)sender {
    [self setUpNewFilterWithFragmentShader:self.shaderCodeTextView.string vertexShader:self.vertexShaderTextView.string];
}
@end
