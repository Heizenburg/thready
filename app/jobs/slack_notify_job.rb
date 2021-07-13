class SlackNotifyJob < ApplicationJob
    queue_as :default
  
    def perform(error_message, source_extract, backtrace)
      error = "Error: 500 - Internal Server Error"
      message = ""
      message << "*#{error}*\n"
      message << "*Date:* #{Time.now}\n"
      message << "*Error:* ```#{error_message}``` \n"
      message << "*Source:* ```#{source_extract}``` \n"
      message << "*Backtrace*: ```#{backtrace}``` \n"
      notifier = Slack::Notifier.new ENV['SLACK_URL']
      notifier.ping message, username: 'thatokagisosello', channel: '#general'
    end
  end