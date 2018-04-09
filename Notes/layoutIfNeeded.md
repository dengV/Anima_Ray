


# Animating layout changes
Add the following code to the bottom of actionToggleMenu:


> UIView.animate(withDuration: 1.0, delay: 0.0,
usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0,
options: .curveEaseIn,
animations: {
self.view.layoutIfNeeded()
},
completion: nil
> )





In the code above, you create a spring animation (just as you learned about in Chapter 2, “Springs”) and force an update of the layout from within the animations closure. This is all it takes to animate your constraint modifications.
Still a little fuzzy on what’s happening above? Here’s a bit more background on how the animation works.
When you modify pertinent view properties inside an animation closure, they’ll be animated as you would expect, and Auto Layout will still set the bounds and center of your views once it finishes its calculations.
In this case, you’ve already updated the constraint value, but iOS hasn’t had a chance to update the layout yet. By calling layoutIfNeeded() from within the animation closure, you set the center and bounds of every view involved in the layout. That’s it — there’s no magic happening in the background!
If you hadn’t called layoutIfNeeded(), UIKit would have performed a layout anyway since you changed a constraint, which marked the layout as dirty.






## Two animations for the price of one!


# 关联部分，视图的消长 ，用 layout 动画， 特别好。


### 独立 视图 自己的动画， 用 frame 动画， 也行吧。


Of course, once the animation settles down it all looks good again.
Did you notice that the table view also shrank and grew along with the menu? Instead
of covering up the table, the menu actually pushed the table view away as it expanded.
This is because of the existing constraint you added in the previous chapter that attaches the top of the table to the bottom of the menu. When the menu grows, the table shrinks to satisfy the constraint.
