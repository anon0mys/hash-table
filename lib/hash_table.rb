require './lib/linked_list'
require 'pry'

class HashTable
  def initialize
    @table = []
  end

  def put(key, value)
    index = key_hasher(key)
    return false if get(key)
    if @table[index]
      @table[index].insert(key, value)
    else
      @table[index] = LinkedList.new(key, value)
    end
  end

  def get(key)
    index = key_hasher(key)
    node = @table[index].find(key) if @table[index]
    node.value if node
  end

  private

    def key_hasher(key)
      key.sum % 10
    end
end
