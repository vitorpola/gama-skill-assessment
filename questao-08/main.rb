require 'json'
require 'csv'

class Writer
  AVAILABLE_FORMATS = %w[xml csv json]
  DATA = { breakfast_menu: { foods:[{
    name: 'Belgian Waffles',
    price: '$5.95',
    description: 'Two of our famous Belgian Waffles with plenty of real maple syrup',
    calories: 650
  },
  {
    name: 'Strawberry Belgian Waffles',
    price: '$7.95',
    description: 'Light Belgian waffles covered with strawberries and whipped cream',
    calories: 900
  },
  {
    name: 'Berry-Berry Belgian Waffles',
    price: '$8.95',
    description: 'Belgian waffles covered with assorted fresh berries and whipped cream',
    calories: 900
  }]}}.freeze

  def initialize;end

  def execute(format:)
    raise 'Format not supported' unless AVAILABLE_FORMATS.include?(format.downcase.to_s)
    provider = Kernel.const_get("Writer::#{format.upcase}")
    provider.new.materialize
  end

  def materialize(_data)
    raise 'Not implemented'
  end
end

class Writer::XML < Writer
  def materialize
    File.write('./file.xml', Writer::DATA.to_xml)
  end
end

class Writer::JSON < Writer
  def materialize
    File.write('./file.json', Writer::DATA.to_json)
  end
end

class Writer::CSV < Writer
  def materialize
    CSV.open("./file.csv", "wb") {|csv| Writer::DATA.to_a.each {|elem| csv << elem} }
  end
end

puts "Qual arquivo você deseja salvar?"
puts "JSON"
puts "CSV"
puts "XML"

option = gets

writer = Writer.new
writer.execute(format: option.strip)


