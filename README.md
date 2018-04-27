# Habitinator 

### Demo
http://www.habitinator.com/

### What is it?

A multi user Ruby on Rails application for goal tracking.

You can sign up and start defining categories:

![](https://github.com/sirbijan/habitinator/blob/master/app/assets/images/screenshots/categories.png)

There are 3 supported category types:

- Number: Goals of this category type allow you to enter a numerical value for progress.
- Percent: You should enter a percentage (a value less than 100) for any goal progress that you define of this category type.
- True/False: Goals of this category type only let you record whether you did achieved that goal today or not; i.e. did you go to Gym today?

After defining a category, you can have your goals defined. For each goal you should mention what category it belongs to and define an optional target value:

![](https://github.com/sirbijan/habitinator/blob/master/app/assets/images/screenshots/goals.png)

For instance you can define a goal named ![BodyPump](https://www.lesmills.com.au/bodypump), of category True/False and specify that you want to do 12 BodyPump sessions a month. You can save your progress and see how you did by clicking on BodyPump:

![](https://github.com/sirbijan/habitinator/blob/master/app/assets/images/screenshots/goal_progress.png)

This shows you your progress during the time frame you specified (monthly for this goal) and the days that you logged in.

### How do I install and run Habitinator?


* Ruby 2.4
* Ruby on Rails 5.1

