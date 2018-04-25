
One of the tricky parts about UIKit animations and the corresponding closure syntax is that once you create
### and run a view animation
### you can’t pause it, stop it or access it in any way.


<hr>

With Core Animation, however, you can easily inspect animations that are running on a layer and stop them if you need to. Furthermore, you can even set a delegate object on your animations and react to animation events.
In contrast to the completion block you’ve seen in view animations,
### you can receive delegate callbacks for when an animation begins and ends (or is interrupted).



<hr>

In this chapter you’ll continue to work with the Bahama Air login project

### and use animation delegates to make your animations more interactive.






<hr>



<hr>


> CAAnimation and its subclass CABasicAnimation implement the delegate pattern and let you respond to animation events.



> CAAnimationDelegate features two methods that you can implement if you need either or both of them:


<hr>




<hr>


<hr>



<hr>


<hr>
