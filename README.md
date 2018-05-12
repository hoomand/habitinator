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

#### Docker
The easiest way to run Habitinator locally on your machine.

* [Install Docker](https://docs.docker.com/install/)

Now you can either manually build the Docker image or pull it down from Docker
Hub.

To pull it down, run <i>docker pull sirbijan/habitinator</i>

If you want to build it manually, run:
* git clone git@github.com:sirbijan/habitinator.git
* cd habitinator
* Run <i>docker build -t habitinator .</i>

After having the image, you simply need to run it:
* Run <i>docker container run -p 80:3000 -d habitinator</i>

Give it a few seconds to pass health checks and then you should be able to browse it on localhost:80.

Needless to mention that if you already have another service listening on port 80, you can change the port to any desired free port.

#### Local Installation

It's very easy to run Habitinator on your own local machine.

##### Software Requirements
You need to install below requirements before attempting to install Habitinator locally. 

* Ruby 2.4 ([recommended way to install](https://rvm.io/rvm/install))
* Ruby on Rails 5.1 ([official installation guide](http://guides.rubyonrails.org/getting_started.html))

If you are on Linux or Mac OSX, you should already have 'ruby' installed. You can try 'ruby -v' to see if you have it. However, if your ruby version is below 2.4, or if you do not have it installed, you can use the link I provided below.

Follow the official Rails tutorial as how to install it on your box.

##### Installation Guide
Now that you have Ruby 2.4+ and Rails 5.1+ installed, you can safely run below commands in order:
* git clone git@github.com:sirbijan/habitinator.git
* cd habitinator
* bundle install
* rake db:setup
* rails server

At this point if everything went fine, you should see that Rails is listening on localhost:3000. Open your browser and browse to localhost:3000 to see your local version of Habitinator.

You can use the email/password in the [seed file](https://github.com/sirbijan/habitinator/blob/master/db/seeds.rb) to login.

#### Cloud
##### Elastic Beanstalk
If you are familiar with AWS Elastic Beanstalk, I'm happy to let you know that Habitinator gets easily deployed via Elastic Beanstalk and its EB CLI. You can follow [this tutorial](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_Ruby_rails.html) using your AWS account to have it setup in no time. I am using Elastic Beanstalk myself to deploy at [www.habitinator.com](https://www.habitinator.com). 
