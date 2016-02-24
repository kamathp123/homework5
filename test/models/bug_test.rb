require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @bug = Bug.create(title: "a title", description: "This is the actual description. It can be rather long.", status: 0, issue_type: 2, priority: 1)
  end
  
  test "bug must be valid" do
    assert @bug.valid?
  end
  
  test "title must be present" do
    assert @bug.title =""
    assert_not @bug.valid?
  end
  
  test "title must not be too short" do
    assert @bug.title ="bb"
    assert_not @bug.valid?
  end
  
  test "title must not be too long" do
     assert @bug.title ="b" * 31
     assert_not @bug.valid?
  end
  
  test "description must be present" do
    assert @bug.description =""
    assert_not @bug.valid?
  end
  
  test "description must not be too short" do
    assert @bug.description ="bbbbbbbbbbbbbbbbbbbbb"
    assert_not @bug.valid?
  end
  
  test "description must not be too long" do
    assert @bug.description ="b" * 100
     assert_not @bug.valid?
  end
  
  test "issue_type must be valid" do
    invalid_statuses = [-10, -1, 3, 10]
    invalid_statuses.each do |is|
      begin
        @bug.issue_type = is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end
  
  test "priority must be valid" do
    invalid_statuses = [-10, -1, 3, 10]
    invalid_statuses.each do |is|
      begin
        @bug.priority = is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end
  
  test "status must be valid" do
    invalid_statuses = [-10, -1, 3, 10]
    invalid_statuses.each do |is|
      begin
        @bug.status = is
        assert false, "#{is} should be invalid"
      rescue
        assert true
      end
    end
  end
  
end
