
## Key-value coding compliance


The CAAnimation class and its subclasses are written in Objective-C and are key-value coding compliant, which means you can treat them like dictionaries and add new properties to them at run time.


> You’ll use this mechanism to assign a name to the flyRight animation so that you can identify it out of the pack of other active animations.



<hr>


> Note: Remember that value(forKey:) always returns an AnyObject?; therefore you must cast the result to your desired type. Don’t forget that the cast operation can fail, so you must use optionals in the example above to handle error conditions, such as when the name key exists but the layer key does not.


<hr>



<hr>

## Animation Keys


You’ve probably noticed that `add(_:key:)`
has two parameters;
so far, you’ve only been using the first to pass in the animation object itself.


> The key parameter is a string identifier that lets you access and control the animation after it’s been started.



In this part you’ll create another layer animation, learn how to run more than one animation at a time, and discover how to use animation keys to control running animations.

<hr>



<hr>
