## Animations vs. real content


When you animate a text field, you’re not actually seeing the field itself animated; instead, you’re seeing a cached version of it known as the presentation layer. The presentation layer is removed from the screen once the animation completes and the original layer shows itself again.



To start, remember you’re setting the text field to be positioned offscreen in viewWillAppear(_:):







<hr>



When the animation starts, a pre-rendered animation object replaces the field and the original text field is temporarily hidden:

<hr>

<hr>

You can’t tap the animated field, enter any text or engage any other specific text field functionality, because it’s not the real text field, just a “phantom” visible representation.


As soon as the animation completes, it disappears from the screen and the original text field is un-hidden. The text field is right where you left it: offscreen to the left!