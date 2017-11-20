require 'twitter'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "SXbWT2waQm7GjRGgbAO91IHUH"
  config.consumer_secret     = "zXEOTYH8xcNt8lZ7q881VYC9dXylpNwDnamtH9u9gNfmvZoue7"
  config.access_token        = "932430772501442564-Red7IFec6uj46L4lvy6LOojl6Duq2Ib"
  config.access_token_secret = "isZ7KbVZpiyQpAQLbNOr4IrUJKpLpksnXGhLBcSPoVlKV"
end


sender = Twitter::REST::Client.new do |config|
  config.consumer_key        = "SXbWT2waQm7GjRGgbAO91IHUH"
  config.consumer_secret     = "zXEOTYH8xcNt8lZ7q881VYC9dXylpNwDnamtH9u9gNfmvZoue7"
  config.access_token        = "932430772501442564-Red7IFec6uj46L4lvy6LOojl6Duq2Ib"
  config.access_token_secret = "isZ7KbVZpiyQpAQLbNOr4IrUJKpLpksnXGhLBcSPoVlKV"
end

topics = "sad"
client.filter(track: topics) do |object|
  if object.is_a?(Twitter::Tweet)
    puts "#{object.user.screen_name} - #{object.text}"
    puts "----------------------------------"
    puts "Hey @#{object.user.screen_name} Don't be down!! This may cheer you up: https://www.youtube.com/watch?v=mRf3-JkwqfU"
    puts "----------------------------------"
    sender.update("@#{object.user.screen_name} Don't be down!! Here's some puppies to cheer you up: https://www.youtube.com/watch?v=mRf3-JkwqfU")
    sleep 30
  end
end
