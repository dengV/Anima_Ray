

## 于 Debugging basic animations ， 第 8 节




### 前面 有一句 写错了

> Now the username and password layers are initially located outside the screen bounds. That means you can remove the following line from viewDidAppear() that sets fromValue:


## 不应该是 viewDidAppear，          应该是 viewWillAppear

<hr>


<hr>


Now run the project and wait. When execution reaches the line with the breakpoint, the Xcode window will jump in front of the iPhone Simulator and show you the position where you set the breakpoint:


<hr>


You are not interested in the code <u>per se</u>; instead, you need to debug the UI of your application and find out what happened to the missing text fields.

//  <u>per se</u> , 是 什么鬼


### Find the Debug Navigator on the left hand side of the Xcode window; it will show you the current app memory footprint and CPU usage. If you don’t see the Debug Navigator, ensure the sixth tab on the right is selected as shown below:


<hr>


<hr>





Next, click the second button to the right as indicated above; the button icon might differ for you, but it will still appear in the same position. You’ll see a list of debugging modes available to you:



<hr>


Click View UI Hierarchy to open the UI debugger:


<hr>

<hr>



You’ll see the UI hierarchy on the left hand side of the UI debugger, with the current runtime layout displayed in the center of the screen, including any hidden or transparent views as well as views outside the screen bounds.


For example, you can see the spinner view inside the Log In button, which is hidden at the time the breakpoint fired, but you can still see it in the debug view.


Let’s look for the text fields now.



Aha — there are those pesky fields; they’re outside the visible screen area. Select a field to inspect its live properties in the Object Inspector and other field properties in the Size Inspector in the next tab:


> 这幅图， 上半部分内容 是 点击
> UITextField
> 下半部分 是 点击 UITextField 的 子项， UITextFieldLabel - Username


