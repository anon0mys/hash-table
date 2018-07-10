require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_it_exists_with_attributes
    list = LinkedList.new('key', 'Name')

    assert_instance_of LinkedList, list
    assert_equal 'Name', list.value
    assert_equal 'key', list.key
  end

  def test_it_initializes_with_no_children
    list = LinkedList.new('key', 'Name')

    assert_nil list.child
  end

  def test_it_inserts_a_second_node
    list = LinkedList.new('key', 'First')

    list.insert('key', 'Second')

    assert_instance_of LinkedList, list.child
    assert_equal 'Second', list.child.value
  end

  def test_it_inserts_a_third_node
    list = LinkedList.new('key', 'First')

    list.insert('key', 'Second')
    list.insert('key', 'Third')

    assert_instance_of LinkedList, list.child.child
    assert_equal 'Third', list.child.child.value
  end

  def test_it_can_find_a_key
    list = LinkedList.new('key1', 'First')

    list.insert('key2', 'Second')
    list.insert('key3', 'Third')

    assert_equal 'Second', list.find('key2').value
  end
end
