class Provider::Whatsapp
  def initialize;end

  def send_message(message)
    puts "Mensagem enviada por whatsapp: '#{message}'"
  end
end
