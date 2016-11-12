
require_relative 'models/Random_Picker'
require 'twilio-ruby'

random = RandomPicker.new
random.match_up
caseys_phone_num = 0
caseys_secret_person = ''

#testing if it reads the right 'secret person'
random.people_array.each do |person|
  if person.name == 'casey'
    caseys_phone_num = person.phone_number
    caseys_secret_person = person.their_secret_person
  end
end

account_sid = #your twilio account_sid
auth_token = #your twilio auth_token

@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  :to => #num you want to send the message too,
  :from => #your twilio number,
  :body => 'Your secret person is ' + caseys_secret_person.to_str
)
