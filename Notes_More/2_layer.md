
## Views vs. layers


A layer is a simple model class that exposes a number of properties to represents some image-based content. Every UIView is backed by a layer, so you can think of layers as the lower-level behind the scenes class behind your content.

> lower-level , 底层



• A layer is different from a view (with respect to animations) for the following reasons:

• A layer is a model object – it exposes data properties and implements no logic. It has no complex Auto Layout dependencies nor does it handle user interactions.

• It has pre-defined visible traits – these traits are a number of data properties that affect how the contents is rendered on screen, such as border line, border color, position and shadow.

• Finally, Core Animation optimizes the caching of layer contents and fast drawing directly on the GPU.


To compare views and layers side by side:


### Views :

• Complex view hierarchy layouts, Auto Layout, etc.
• User interactions.
• Often have custom logic or custom drawing code that executes on the main thread on the CPU.
• Very flexible, powerful, lots of classes to subclass.



### Layers :

• Simpler hierarchy, faster to resolve layout, faster to draw.
• No responder chain overhead.
• No custom logic by default. and drawn directly on the GPU.
• Not as flexible, fewer classes to subclass.
If you need to choose between views and layers here is my tip: choose view animations any time you can to do the job; you will know when you need more performance or flexibility and have to switch to layer animations instead.
Don’t stress yourself about it though, because you can mix and match view and layer animations freely.
By the end of this section, you will know how – and when! – to animate your views, and when it’s appropriate to use layers.
