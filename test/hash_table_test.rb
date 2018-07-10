require 'minitest/autorun'
require 'minitest/pride'
require './lib/hash_table'

class HashTableTest < Minitest::Test
  def test_it_exists
    table = HashTable.new

    assert_instance_of HashTable, table
  end

  def test_it_can_insert_a_top_level_value
    table = HashTable.new

    assert table.put('key', 'value')
  end

  def test_it_can_retrieve_a_top_level_value
    table = HashTable.new

    table.put('key', 'value')

    assert_equal 'value', table.get('key')
  end

  def test_it_fails_to_insert_duplicate_keys
    table = HashTable.new

    table.put('key', 'value')

    refute table.put('key', 'value')
  end

  def test_it_can_insert_at_the_same_index
    table = HashTable.new

    table.put('key', 'value')

    assert table.put('yek', 'value2')
  end

  def test_it_can_retrieve_at_the_same_index
    table = HashTable.new

    table.put('key', 'value')
    table.put('yek', 'value2')

    assert_equal 'value2', table.get('yek')
  end

  def test_it_print_a_list_of_all_values
    table = HashTable.new

    table.put('key', 'value')
    table.put('yek', 'value2')
    table.put('another', 'value3')
    table.put('fourth', 'value4')

    expected = '0->\n1->\n2->\n3->another\n4->fourth\n5->\n6->\n7->\n8->\n9->key,yek'

    assert_equal expected, table.print_list
  end
end
