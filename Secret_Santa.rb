
require_relative 'models/Random_Picker'
require 'twilio-ruby'
#setting up the data
random = RandomPicker.new
random.match_up

account_sid = #your twilio account_sid
auth_token = #your twilio auth_token

@client = Twilio::REST::Client.new account_sid, auth_token

#going through the array of people and sending them their secret person
random.people_array.each do |person|
  @client.account.messages.create(
    :to => person.phone_number,
    :from => #your twilio number,
    :body => "You got #{person.their_secret_person} for secret santa!"
  )
end
