#!/usr/bin/env ruby

require 'net/http'
require 'json'

if ARGV[0]

  display_name = ENV['HOSTNAME']
  slack_url = %x( user-data slackurl )
  if slack_url == ""
    puts "`user-data slackurl` was empty. Define it in userdata in the EC2 console or in /srv/user-data/slackurl"
    exit 1
  end
  data = {
          username: display_name,
          text: ARGV[0]
  }

  data[:channel] = "##{ARGV[1]}" if ARGV[1]

  uri = URI(slack_url)

  response = Net::HTTP.post_form uri, 'payload' => data.to_json

  exit response.code == 200 ? 0 : 1

else

  puts "Usage: slack-notify message [channel]"
  exit 0

end