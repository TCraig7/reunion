require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new(name)

    assert_instance_of Activity, activity
  end

  def test_it_has_attributes
    activity = Activity.new("lunch")

    assert_equal "lunch", activity.name
  end

  def test_it_has_participants
    activity = Activity.new("lunch")

    assert_equal [], activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("lunch")

    expected = [{:name => "Debbie", :paid => 10}]

    assert_equal expected, activity.add_participant({:name => "Debbie", :paid => 10})
  end

  def test_it_can_have_multiple_participants
    activity = Activity.new("lunch")
    activity.add_participant({:name => "Debbie", :paid => 20})

    expected = [{:name=>"Debbie", :paid=>20}, {:name=>"Joe", :paid=>10}]

    assert_equal expected, activity.add_participant({:name => "Joe", :paid => 10})
  end

  def test_it_can_calculate_base_cost
    activity = Activity.new("lunch")
    activity.add_participant({:name => "Debbie", :paid => 20})
    activity.add_participant({:name => "Joe", :paid => 10})

    assert_equal 30, activity.calculate_base_cost
  end

  def test_it_has_average_cost
    activity = Activity.new("lunch")
    activity.add_participant({:name => "Debbie", :paid => 20})
    activity.add_participant({:name => "Joe", :paid => 10})

    assert_equal 15, activity.calculate_average_cost
  end
end
