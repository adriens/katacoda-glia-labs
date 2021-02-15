Be aware how katacoda courses and scenarios are linked, keep in mind that
there is a hierarchy.
Using courses allows you to better organize your content.

In the following steps, you'll create that kind of hierarchy :

- Course
  - Scenario 1
    - Intro
    - Step 1
    - Step 2
    - ...
    - Finish
  - Scenario 2

# Create a course

To be aware of all the available commands around courses management, just :

`katacoda help courses`{{execute}}

Let's create a course :

`katacoda courses:create`{{execute}}

Next, interactively answer the questions :

Put the course name. Keep it short (less than 15 characters is ok) and clear :

`My first course`{{execute}}

Then put a short yet understandable text to tell people what they will learn by running this
course.

**Keep in mind that a course is a set of scenarios, so it could be "Deal with PostgreSQL techniques".**

`This course is cool, come discover it`{{execute}}

Next, the `friendly-url`, keeping it lower-case and short is a best practice.

`first-course`{{execute}}

Now, you should have this status :

`Course created successfully.`

You have created a first - yet empty - course.

**What we have to do next is to put scenarios in it.**

Take a glance at directory layout :

`tree`{{execute}}