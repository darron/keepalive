# Thanks to: https://github.com/austinthecoder/remote_cron

task :clockwork => :environment do
  require 'httparty'

  Sites.all.each do |site|
    Clockwork.every site.interval, site.url do
      http = HTTParty.get(site.url)
      logger.info "#{site.url}: #{http.response.code}"
    end
  end

  Clockwork.run
end