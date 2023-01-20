require './providers/provider.rb'
require './providers/email.rb'
require './providers/sms.rb'
require './providers/whatsapp.rb'

class Notifier
  PROVIDERS = {
    sms: Provider::Sms,
    whatsapp: Provider::Whatsapp,
    email: Provider::Email
  }

  def initialize;end

  def execute(provider, message)
    provider_instance = PROVIDERS[provider].new
    provider_instance.send_message(message)
  end
end