## Animations vs. real content


When you animate a text field, you’re not actually seeing the field itself animated; instead, you’re seeing a cached version of it known as <u>the presentation layer</u>. The presentation layer is removed from the screen once the animation completes and the original layer shows itself again.

<hr>

To start, remember you’re setting the text field to be positioned offscreen in viewWillAppear(_:):







<hr>



When the animation starts, a pre-rendered animation object replaces the field and the original text field is temporarily hidden:

<hr>

<hr>

You can’t tap the animated field, enter any text or engage any other specific text field functionality, because it’s not the real text field, just a “phantom” visible representation.




As soon as the animation completes, it disappears from the screen and the original text field is un-hidden. The text field is right where you left it: offscreen to the left!
<hr>

<hr>



To solve this conundrum, you’ll need to use another CABasicAnimation property:
isRemovedOnCompletion.


Setting fillMode to kCAFillModeBoth instructs your animation to remain on screen after it completes and also show the animation’s first frame before its start. To complete the effect, you’ll need to set removedOnCompletion accordingly; the combination of the two will leave the animation visible on the screen.


Add the following line to viewWillAppear(), just after you set the fillMode:



> flyRight.isRemovedOnCompletion = false



<i><b>isRemovedOnCompletion</b></i> is true by default, so the animation disappears as soon as it completes. Setting it to false and combining it with the proper fillMode keeps the animation on the screen — and visible as well.


Build and run your project now; you should see that all elements remain on the screen as expected once the animation completes:
