To discover all the katacoda scenarios options, just :

`katacoda help scenarios`{{execute}}

Let's focus on creating a new scenario :

`katacoda scenarios:create`{{execute}}

And provide some answers :

Put the friendly url, best practice is to keep it short and lowercase :

`first-scenario`{{execute}}

Give it a title (keep it short) :

`My first scenario`{{execute}}

Finally give it a description :

`A brief description`{{execute}}


Next:

- Interactively choose the default `Beginner` option by hitting `ENTER` in the terminal
- Opt for a 15 minutes course : `15 minutes`{{execute}}
- Provide a number of steps : `3`{{execute}}
- Pick the image by selecting `Ubuntu 20.04`
- Pick the first `Terminal` layout

You should have the following message :

`Scenario created successfully`

So you're done, you have just created you first scenario, have a look at the directory layout :

`tree`{{execute}}

One remarkable things : everything is at the same level in the directory.

We'd rather get a hierarchical strtucture of the code instead of this messy situation.