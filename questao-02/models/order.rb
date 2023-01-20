require './models/notifier.rb'

class Order
  def initialize;end

  def confirm
    Notifier.new.execute(:sms, 'Mensagem qualquer')
    Notifier.new.execute(:whatsapp, 'Mensagem qualquer')
    Notifier.new.execute(:email, 'Mensagem qualquer')
  end
end
