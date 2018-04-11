
## Finalizing the UI
There’s just one more thing to take care of before you move on: you need to connect the existing outlets to their corresponding UI elements.
Ctrl-drag with the mouse from the view controller object to the table view, then select tableView from the popup menu:


<img src="https://github.com/dengV/Anima_Ray/blob/master/DescriptionImages/LayoutCtrlDragSecond.png">




Then Ctrl-drag from the view controller to the title and select titleLabel:






Do the same for the + button and select buttonMenu:






Now Ctrl-drag from the button back to the view controller and select actionToggleMenu :





Next, drag from the table view to the view controller and select dataSource:




Once again, Ctrl-drag from the table view to the view controller but this time select delegate:




All that’s left is to give your table a prototype cell. Drag a table view cell object onto the table view, like so:




## 第七章， 继续

> The animation looks gorgeous; you can temporarily set the animation duration to 5–6 seconds to see exactly how the + sign rotates to become an x. You can also see the button bounce around its center thanks to the spring animation that drives both the constraint and rotation animations.

the spring animation 作用域 很强大呀
