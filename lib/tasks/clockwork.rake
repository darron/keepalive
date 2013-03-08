# Thanks to: https://github.com/austinthecoder/remote_cron

task :clockwork => :environment do
  require 'httparty'

  Sites.all.each do |site|
    Clockwork.every site.interval, site.url do
      response = HTTParty.get(site.url)
    end
  end

  Clockwork.run
end