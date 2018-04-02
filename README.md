# Anima_Ray
Anima_Ray




<hr>


<hr>



<img src="DescriptionImages/imageOne.png"> </img>

<hr>


<hr>


### Tips ， 第三章 :

#### 我没找到

>  Note: Some of your animations seem to run really quickly, don’t they? Sometimes it’s tricky to ensure the animation happens at just the right location, and in the correct sequence. Or maybe you just want things to happen slower so you can appreciate the effect!
> To slow down all animations in your app without changing your code, select Debug/Toggle Slow Animations in Frontmost App from the iPhone Simulator menu. Now tap the Login button in your app and enjoy the animations and transitions in vivid slow motion!



#### 我找到了

Simulator > Debug > Slow Animations.

<hr>

<hr>



###  Knowledges，  第四章:

#### CAEmitterCell


The definition of a particle emitted by a CAEmitterLayer.

https://developer.apple.com/documentation/quartzcore/caemittercell

#### CAEmitterLayer


A layer that emits, animates, and renders a particle system.

https://developer.apple.com/documentation/quartzcore/caemitterlayer



<hr>





You’ve learned an important technique here:<b> transitions can be used to animate changes to non-animatable properties of your views.</b>
<br>
That takes care of the image view, but the text labels for the flight number and gate number look like they could use some creative animation:
You’ll take care of those next with a faux-3D transition.
self.changeFlight(to: data.isTakingOff ?
parisToRome : londonToParis, animated: true)
<br>





> Note: If you want to have some fun, you can try also some of the transition effects from the previous chapter. Keep in mind that transitions
like .transitionFlipFromLeft are simply too distracting for the current
project. .transitionCrossDissolve is a subtle “background” effect which only enhances the animations, which will happen in the foreground.






<hr>

<hr>


### git 操作

<ul>
<li>
git push git@dengV:dengV/Anima_Ray.git
</li>

</ul>
