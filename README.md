keepalive
=========

Keep sites loaded by pinging them gently.

## Built with:

```
padrino g project keepalive -t rspec -d activerecord -s jquery -a postgres -e erb -c scss
cd keepalive
bundle install
padrino g admin
bundle
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
padrino g model Site url:string interval:integer
bundle exec rake db:migrate
padrino g admin_page site
```

## Deployed to Heroku like this:

```
heroku create keepalive-app-name
padrino rake secret
heroku config:add SESSION_SECRET="output-of-last-command"
heroku addons:add heroku-postgresql
heroku config:add DATABASE_URL="url-of-postgres-db"
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
heroku open
```

Edit the items via the web interface at /admin

## To activate the gentle pings:

```
heroku scale web=0 keepalive=1
```

## Can be added via the console:

```
heroku run padrino console
Site.create :url => 'http://put-the-website-here', :interval => '43200'
# When you're done entering sites, exit from the console.
heroku restart
```

If you want, you can deploy this to another Heroku instance and just activate the web interface. Use the DATABASE_URL from the first instance.

Thanks
------

To [austinthecoder](https://github.com/austinthecoder/remote_cron) for the original Rails example.
