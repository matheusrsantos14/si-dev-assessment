class PagesController < ApplicationController
  def home
  end

  def sms
    require 'twilio-ruby'
    
   # ENV["ACCOUNT_SID"] # Your Account SID from www.twilio.com/console
   # ENV["AUTH_TOKEN"]   # Your Auth Token from www.twilio.com/console
    
    @client = Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"] 
    
    message = @client.account.messages.create(:body => params[:message],
        :to => "7818598110",    # Replace with your phone number
        :from => "6176827977")  # Replace with your Twilio number
    
    puts message.sid
  end

end
