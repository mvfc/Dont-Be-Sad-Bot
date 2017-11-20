require 'twitter'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end


sender = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
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
