
#### The button flies in and rotates as expected, but the animation looks stiff. In real life, objects tend to accelerate as they fall through space.


<hr>

Fortunately, it’s easy to add some realism to your animation. This is a great opportunity
to learn about using easing with Core Animation.



<hr>

<hr>

<hr>


## Animation easing


You’ve already seen easing in action in the first chapters of this book that dealt with UIKit animations. Easing in layer animations is conceptually the same thing — only the syntax is different.


CAMediaTimingFunction has a few pre-defined easing functions, which you can use by name:

<hr>


* • kCAMediaTimingFunctionLinear runs the animation with an equal pace throughout its whole duration.


* • kCAMediaTimingFunctionEaseIn alters the animation so it starts slower and finishes at a faster pace.

<hr>

* • kCAMediaTimingFunctionEaseOut produces the opposite effect of kCAMediaTimingFunctionEaseIn: the animations starts out faster and slows down as it finishes.



* • kCAMediaTimingFunctionEaseInEaseOut slows the animation in the beginning and at the end, but increases the pace during the middle section.






<hr>

<hr>

<hr>




> Note: Although it’s beyond the scope of this chapter, you can build your own custom easing function.


Read up on the convenience initializer CAMediaTimingFunction(controlPoints: _: _: _:) in the Apple documentation or elsewhere on the web; this lets you define your easing function based on the control points of a cubic Bézier curve.
