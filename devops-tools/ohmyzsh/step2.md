The first thing you see is the terminal look & feel. This is what we call the *Themes*.
There are a [lot](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)... and of course you
can create your own.

By default [robbyrussell](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#robbyrussell),
is installed as well as `git` plugin :

```
cd ~/.oh-my-zsh
git status
```{{execute}}

Now take a closer look at your customized prompt.

All the current themes can be found in the `themes/` directory in the oh-my-zsh
distribution. See [themes list](https://github.com/ohmyzsh/ohmyzsh/tree/master/themes).
You can have a preview on themes by taking a look at
 [screenshots](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)


Find all available themes [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes).

Now, let's select one by ourselves.

*[Robby's theme](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#robbyrussell) is the default
one. It's not the fanciest one. It's not the simplest one. 
It's just the right one (for him).*

Browse available themes from the terminal :

```
ls  ~/.oh-my-zsh/themes | less
```{{execute}}

Let's pick `agnoster`{{copy}}

Therefore, you will need to edit the `~/.zshrc` file. You'll see an environment
variable (all caps) in there that looks like:

`ZSH_THEME="robbyrussell"`

To use a different theme, simply change the value to match the name
of your desired theme. For example:

```
ZSH_THEME="agnoster" # (this is one of the fancy ones)
# see https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster
```

Now, do the job, update the file:

`~/.zshrc`{{open}}

And you're done : the [agnoster](https://github.com/agnoster/agnoster-zsh-theme) theme is installed.

Open up a new terminal :

```
cd ~/.oh-my-zsh
git status
```{{execute T2}}

and your prompt should look something like this:

![agnoster theme screenshot](https://cloud.githubusercontent.com/assets/2618447/6316862/70f58fb6-ba03-11e4-82c9-c083bf9a6574.png "agnoster theme screenshot")