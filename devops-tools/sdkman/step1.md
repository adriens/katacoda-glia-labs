# Install SDKMAN!

First, install the minimal prerequisites:

```
sudo apt-get install -y unzip zip
```{{execute}}

**NB : That's all you need as `root` privileges.**

Then, simply use your personal account for the following step as the
install process only uses your `HOME` directory.

So, let's install `SDKMAN!` :

```
curl -s "https://get.sdkman.io" | bash
```{{execute}}

... and update your current session so you can use `SDKMAN!` now !


```
source "$HOME/.sdkman/bin/sdkman-init.sh"
```{{execute}}

Check its version:

```
sdk version
```{{execute}}

Finally, check help manual:

```
sdk help
```{{execute}}

That's all, `SDKMAN!` is installed.