keepalive
=========

Keep sites loaded by pinging them gently.
    
    heroku create keepalive-app-name
    padrino rake secret
    heroku config:add SESSION_SECRET="output-of-last-command"
    git push heroku master
    heroku run dm:migrate
    heroku run seed
    heroku open # Go to /admin/ and login - enter your sites and intervals.
    
To activate the gentle pings:

    heroku scale web=0 keepalive=1
    
To add new sites without loading the web admin:
    
    heroku run padrino console
    Sites.create :url => 'http://www.cnn.com/', :interval => '9000'
    # When you're done entering sites, exit from the console.
    heroku restart
    
Thanks
------

To [austinthecoder](https://github.com/austinthecoder/remote_cron) for a Rails example.