require 'test_helper'

class EntryControllerTest < ActionDispatch::IntegrationTest
  test "should create entry associated with a list which is then associated with a user" do
    entry = Entry.new
    assert_not entry.save, "Saved the entry without reference to list"
  end
  test ""
end
