
### The core idea behind Auto Layout is incredibly simple: it lets you define the layout of the UI elements of your app based on relationships you create between each of the elements in the layout.





## 第二章 ,  总第六节
### This chapter is for the readers that need an iOS Animations by Tutorials crash course on Auto Layout.





The auto-resizing and re-positioning system in Interface Builder provides a partial solution to these kinds of problems. However, if you’re serious about creating dynamic and beautiful user interfaces that work with multiple device sizes and orientations, then you’ll need to start using Auto Layout.





> Navigation bar
> Note: Be sure to position the bar on the top of the view controller. Otherwise Interface Builder will consider aligning it to the top layout guide, which is different than the top of the screen.




<hr>


<hr>


> In the image above, the label just happens to be placed precisely in the vertical center of the menu, so Interface Builder notes this with a blue guide indicating the vertical constraint has been satisfied.
> The orange guide, however, indicates that the horizontal alignment constraint is “broken”. Interface Builder shows you the current frame of your view in solid orange along with the frame that the constraint expects in a dashed orange line.





## 右下角 的 五个按钮 中， 常见 就是 灰色的， updates frame.

 view will automatically jump to the correct position and size:



#### Positioning elements with Auto Layout


> A relationship in Auto Layout, like any relationship in the world, has two sides to it. Constraint rules indicate the relationship between your two UI elements. For example, a rule could be: set the view’s height (the first item) to half that of its superview (the second item).

> Take a look at the constraint relationship above; the first item in the constraint is the Superview. That’s not right — you want the constraint to be based from the point of view of your Label instead.

When creating a constraint, Xcode isn’t always consistent with the order of the first and second item.

If you have the Packing List label as the first item, great! If not, that’s a relatively easy thing to fix. Click on the dropdown menu under First Item and select Reverse First And Second Item:

