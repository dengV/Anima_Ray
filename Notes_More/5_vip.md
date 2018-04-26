
> 1. Call removeAllAnimations() on the layer to stop all running animations or removeAnimation(forKey:) to remove just one.



```

info.layer.removeAnimation(forKey: "infoappear")

```


<hr>




> 2. Enumerate over the list of animations returned by animationKeys(). The animation
objects are immutable, so you can’t modify the animation while they’re in progress.





<hr>





> 3. Fetch an animation by key using animationForKey(_:). As before, the returned animation object will be immutable.



<hr>

<hr>

<hr>


<hr>



You’ve probably noticed that  `add(_:key:)`    has two parameters; so far, you’ve only been using the first to pass in the animation object itself.




The key parameter is a string identifier that lets you access and control the animation after it’s been started.




In this part you’ll create another layer animation, learn how to run more than one animation at a time, and discover how to use animation keys to control running animations.




<hr>


<hr>



> 一般 我想要 达到这种效果， 就是用 计时器，
或者用 for 循环调用 事件/ 方法递归 （   外部参数，属性，判断执行结束   ）



<hr>


<hr>


## 交互性 的 动画， 太给力了
