class LinkedList
  attr_reader :value, :child

  def initialize(value)
    @value = value
    @child = nil
  end

  def insert(value)
    if @child
      @child.insert(value)
    else
      @child = LinkedList.new(value)
    end
  end
end
