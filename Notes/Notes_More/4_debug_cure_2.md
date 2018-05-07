
Success! Now tap on the username field to enter your username — oh, wait. Remember the earlier note about the difference between the actual text field and the presentation layer? You can’t do anything with this pre-rendered image of a text field.


To complete the desired effect, you’ll need to remove the animation and show the real text field in its place.


<hr>


<hr>


## Updating the layer model





Remove the line below from your project:


> flyRight.isRemovedOnCompletion = false



Although you know how isRemovedOnCompletion works when set to false, try to avoid it whenever possible. Leaving animations on the screen affects performance, so you’ll let them be removed automatically and update the original layer’s position instead.


<hr>


<hr>



# When possible, design your layers in Interface Builder with their final values, and use fromValue for the starting and in-between values. This reduces the complexity of keeping your model and presentation layers in sync.
