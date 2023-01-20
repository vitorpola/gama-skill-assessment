class Action
  def initialize(type)
    @type = type
  end

  def call
    instance = Kernel.const_get("Action::#{@type.capitalize}").new
    instance.call
  rescue NameError
    # do nothing - like the old code
  end
end

class Action::Tipo1
  def call
    puts 'Executa ação TIPO1'
  end
end

class Action::Tipo2
  def call
    puts 'Executa ação TIPO2'
  end
end

class Action::Tipo3
  def call
    puts 'Executa ação TIPO3'
  end
end

class Action::Tipo4
  def call
    puts 'Executa ação TIPO4'
  end
end

class Action::Tipo5
  def call
    puts 'Executa ação TIPO5'
  end
end

class Action::Tipo6
  def call
    puts 'Executa ação TIPO6'
  end
end

Action.new('TIPO5').call
Action.new('TIPO2').call
Action.new('TIPO9').call