require './providers/provider.rb'
require './providers/email.rb'
require './providers/sms.rb'

class Notifier
  PROVIDERS = {
    sms: Provider::Sms,
    email: Provider::Email
  }

  def initialize;end

  def execute(providers, message)
    providers.each do |provider|
      provider_instance = PROVIDERS[provider].new
      provider_instance.send_message(message)
    end
  end
end