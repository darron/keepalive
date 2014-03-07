# Thanks to: https://github.com/austinthecoder/remote_cron

desc "Ping the urls."
task :clockwork => :environment do
  require 'httparty'

  Site.all.each do |site|
    if site.interval?
      Clockwork.every site.interval, site.url do
        http = HTTParty.get(site.url)
        logger.info "#{site.url}: #{http.response.code}"
      end
    elsif site.ping_at?
      Clockwork.every 1.day, site.url, :at => site.ping_at do
        http = HTTParty.get(site.url)
        logger.info "#{site.url}: #{http.response.code}"
      end
    end
  end

  Clockwork.run
end
