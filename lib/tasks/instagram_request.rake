require "assets/instagram_module.rb"

namespace :instagram_request do
  desc "rake task for instagram feed"
  task requestdata: :environment do

    include InstagramModule
    p "sending request..."
    request = InstagramModule::Request.new
    request.get_recent_media_by_tag("reeses", 20)
  end

end
