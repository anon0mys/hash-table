class LinkedList
  attr_reader :key, :value, :child

  def initialize(key, value)
    @key = key
    @value = value
    @child = nil
  end

  def insert(key, value)
    if @child
      @child.insert(key, value)
    else
      @child = LinkedList.new(key, value)
    end
  end

  def find(key)
    if @key == key
      self
    elsif @child.nil?
      false
    else
      @child.find(key)
    end
  end

  def list_keys(result = "")
    if result == ""
      result += "#{@key}"
    else
      result += ",#{@key}"
    end
    if @child
      @child.list_keys(result)
    else
      result
    end
  end
end
