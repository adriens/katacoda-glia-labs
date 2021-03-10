Oh My Zsh comes bundled with [plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins), which allow
 you to take advantage of functionality of many sorts to your shell just by enabling them.

Get the complete list :

```
ls ~/.oh-my-zsh/plugins
```{{execute}}

They are each documented in the `README` file in their respective folder.

Enable a plugin by adding its name to the `plugins` array in your

`~/.zshrc`{{open}}

For example, this enables the `mvn`, `git` and `kubectl` plugins, **in that order**:


```
plugins=(mvn git kubectl)
```

**NOTE: elements in zsh arrays are separated by whitespace (spaces, tabs, newlines...). DO NOT use commas.**

For example, here is my plugins section :

```
plugins=(
docker
docker-compose
git
github
minikube
ng
mvn
npm
pip
sudo
vagrant
yarn)
```{{copy}}

Once your plugins updates, source your profile and you're done :

```
source ~/.oh-my-zsh/oh-my-zsh.sh
```{{execute}}


Check complete plugins list and descriptions on the [dedicated Wiki Page](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins).