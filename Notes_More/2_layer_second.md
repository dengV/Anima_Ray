
### Layer animations work much like view animations; you simply animate a property between a start and an end value over a defined period of time and let Core Animation take care of the rendering in between.
However, layers have a bigger number of animatable properties than views; this gives you a lot of choice and flexibility when it comes to designing your effects; many specialized CALayer subclasses add other properties that you can use in your animations.
This chapter will introduce you to the basics of CALayer and Core Animation. You’ll get a feel for working with animations in layers; you’ll learn how to move layers around, fade them in and out and create animations comparable to the ones you created using UIKit.

### Animatable properties

Some of the animatable properties in CALayer correspond directly to the view properties you worked with in previous chapters, such as frame, position and opacity. You’ll see both the familiar and the new animatable properties used in layer animation in this chapter.
You’ll re-create some of the earlier view animations but with layers, so you can draw the parallels and see for yourself where the similarities end — and where the new possibilities begin.




<hr>


<hr>


## Position and size
Animating the position, size, or transform of a layer equally affects any view contained within that layer, just as if you had directly animated the view itself.

• bounds: modify this to animate the bounding frame of the layer.

• position: modify this to animate the position of the layer within its parent layer. You can animate position.x or position.y separately if you want to control movement on only one axis.

• transform: modify this to move, scale, and rotate the layer. You can even animate layers in 3D space, which you can’t do with views alone. You’ll learn about 3D layer transforms in Section IV, “3D Animations”.


<hr>


<hr>


## Border
You can easily animate a layer’s border to change its color, width and corner radius:

•borderColor: modify this to change the border tint.

• borderWidth: modify this to grow or shrink the width of the border.


• cornerRadius: modify this to change the radius of the layer’s rounded corners.




<hr>


<hr>


## Shadow


You can animate all aspects of the layer’s shadow:

• shadowOffset: Modify this to make the shadow appear closer to or further away from the layer.

• shadowOpacity: Modify this to make the shadow fade in or out.

• shadowPath: Modify this to change the shape of the layer’s shadow. You can create different 3D effects to make your layer look like it’s floating with different shadow shapes and positions.

• shadowRadius: Modify this to control the blur of the shadow; this is especially useful when simulating movement of the view towards or away from the surface where the shadow is cast.


# 这句话， 怎么理解 ？

> 百度 翻译
> 修改这个控件来控制阴影的模糊度，当模拟视图移动或远离阴影投射的表面时，这特别有用。


<hr>


<hr>


## Contents


Finally, there are a few properties that control how the layer’s contents are rendered:

• contents: Modify this to assign raw TIFF or PNG data as the layer contents.

• mask: Modify this to establish the shape or image you’ll use to mask the visible contents of the layer; you’ll use this property to create some very cool effects in Chapter 13, “Shapes and Masks”.

• opacity: Modify this to animate the transparency of the layer contents.


> Keep in mind that this is only a partial list of properties you can animate; subclasses of CALayer usually have other properties that you can animate as well.
The properties listed above are enough to get you started; it’s time to get to work on
your first animation with layer properties.






