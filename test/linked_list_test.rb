require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_it_exists_with_attributes
    list = LinkedList.new('Name')

    assert_instance_of LinkedList, list
    assert_equal 'Name', list.value
  end

  def test_it_initializes_with_no_children
    list = LinkedList.new('Name')

    assert_equal nil, list.child
  end

  def test_it_inserts_a_second_node
    list = LinkedList.new('First')

    list.insert('Second')

    assert_instance_of LinkedList, list.child
    assert_equal 'Second', list.child.value
  end

  def test_it_inserts_a_third_node
    list = LinkedList.new('First')

    list.insert('Second')
    list.insert('Third')

    assert_instance_of LinkedList, list.child.child
    assert_equal 'Third', list.child.child.value
  end
end
