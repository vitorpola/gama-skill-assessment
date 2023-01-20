class DataWriter
  AVAILABLE_FORMATS = %w[xml html csv json]

  def initialize(data)
    @data = data
  end

  def execute(format:)
    raise 'Format not supported' unless AVAILABLE_FORMATS.include?(format.downcase.to_s)
    provider = Kernel.const_get("Writer::#{format.upcase}")
    provider.new.materialize(@data)
  end
end

class Writer
  def materialize(_data)
    raise 'Not implemented'
  end
end

class Writer::XML
  def materialize(data)
    puts 'aaaa'
  end
end

class Writer::HTML
  def materialize(data)
    puts 'aaaa'
  end
end

class Writer::JSON
  def materialize(data)
    puts 'aaaa'
  end
end

class Writer::CSV
  def materialize(data)
    puts 'aaaa'
  end
end

writer = DataWriter.new('io')
writer.execute(format: :xml)
writer.execute(format: :txt)



