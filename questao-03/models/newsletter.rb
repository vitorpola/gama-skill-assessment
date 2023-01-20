require './models/notifier.rb'

class Newsletter
  def initialize;end

  def subscribe
    Notifier.new.execute(%i[sms email], 'Mensagem qualquer')
  end
end
