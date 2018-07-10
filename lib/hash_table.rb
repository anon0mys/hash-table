require './lib/linked_list'
require 'pry'

class HashTable
  def initialize
    @array = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end

  def put(key, value)
    index = key_hasher(key)
    return false if get(key)
    if @array[index]
      @array[index].insert(key, value)
    else
      @array[index] = LinkedList.new(key, value)
    end
  end

  def get(key)
    index = key_hasher(key)
    node = @array[index].find(key) if @array[index]
    node.value if node
  end

  def print_list
    @array.each_with_index.map do |item, index|
      position = "#{index}->"
      if item
        keys = item.list_keys
        position += keys
      end
      position
    end.join('\n')
  end

  private

    def key_hasher(key)
      key.sum % 10
    end
end
