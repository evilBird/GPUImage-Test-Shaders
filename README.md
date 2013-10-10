# GPUImage Test shaders

Simple Xcode project to easily test GPUImage vertext and fragment shaders for Mac OS X.

Just start the app, and you see two GPUImageViews, showing the source image (from camera) and the processed image.

Also you can see two NSTextViews, where you can enter your own fragment and vertex shaders (per default, the vertex shader is set to the default GPUImage vertex shader and the fragment shader is set to the GPUImageGrayscaleFilter fragment shader). Just change the shaders click update and you'll see the results right away.

## Notes

You have to enter valid OS X conform shaders (though to change to iOS is pretty easy in most cases), if the shaders are not valid, the application is very likely to crash.

## License

Feel free to contribute, fork, add stuff, do your own stuff out of it, ect, ect.

I do not own this (or: you can do whatever you want with the [very little] part I wrote)

All rights belong to their respective owners.
Original license is included.
GPUImage Framework from https://github.com/BradLarson/GPUImage