## Getting Started

Follow these steps to create a new local rails app and then deploy it to Heroku. I'm considering making it a point and click solution so you can get up and running without any code. If you'd be interested in something like that please submit your email on the [demo](http://rails4landing.herokuapp.com) site and I'll get in touch.

### 1. Clone The App
```
git clone git@github.com:GAFuller/rails-4-landing.git YourAppName
```

### 2. Change Name of Application
Change the application name from ```Rails4landing``` to whatever you want in the following files:
```
config/environments/development.rb
config/environments/production.rb
config/environments/test.rb
config/initializers/secret_token.rb
config/initializers/session_store.rb
config/application.rb
config/database.yml
config/environment.rb
config/routes.rb
Rakefile
```

### 2. Setup Development Environment
cd into your app directory.
```
cd YourAppName
```
Install the app bundle.
```
bundle install
```
Setup the development database.
```
rake db:setup
```

### 3. Organise Git
Remove this repository as the origin.
```
git remote rm origin
```
If you want to push it to your own repository on Github, first create a new empty app on Github, then add it as origin.
```
git remote add origin git@github.com:YourUserName/your-new-app.git
git add -a
git commit -m "init"
git push -u origin master
```

### 4. Start Development Server
Rails 4 landing uses foreman to start it's servers. To start the development server run:
```
foreman start -f Procfile.dev
```
Then browse to: 
```
localhost:5000
```


### 5. Create Heroku App
If you want to deploy to heroku and you have the heroku toolbelt installed run:
```
heroku create --addons heroku-postgresql YourAppName
git push heroku master
heroku run rake db:migrate
heroku ps:scale web=1
heroku config:set SECRET_TOKEN=`rake secret`
```

Your app should now be live at ```yourappname.herokuapp.com```. You can open it from the command line with ```heroku open```.

