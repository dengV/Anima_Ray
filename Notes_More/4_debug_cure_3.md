
## Best practices

Whoa — this was a long chapter! You tried out a ton of different layer animation techniques, and that’s just the start!


At this point you might be feeling a bit overwhelmed and asking yourself “Should I use fillMode? Should I be removing my animations? And how do I update my layer to have smooth animation completion?”


As a rule of thumb: remove your animations and consider never using fillMode, except if the effect you want to achieve is not possible otherwise. fillMode makes your UI elements lose their interactivity and also makes the screen not reflect the actual values in your layer object.


In some rare cases when you animate non-interactive visual elements fillMode will save your bacon; you’ll read more about this in Chapter 16, “Replicating animations.”


As for updating your layer properties: consider always doing that immediately after you add the animation to your layer. Sometimes you might get the odd flash between the initial and final animation values.


In this case, try updating your layer property to the final animation value even before adding the animation.
