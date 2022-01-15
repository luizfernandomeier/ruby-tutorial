require 'test/unit'
require './class.rb'

class TestSongList < Test::Unit::TestCase
  def test_delete
    list = SongList.new
    s1 = Song.new("title1", "artist1", 100)
    s2 = Song.new("title2", "artist2", 200)
    s3 = Song.new("title3", "artist3", 300)
    s4 = Song.new("title4", "artist4", 400)
    list.append(s1).append(s2).append(s3).append(s4)

    assert_equal(s1, list[0])
    assert_equal(s3, list[2])
    assert_nil(list[4])

    assert_equal(s2, list.with_title("title2"))
    assert_nil(list.with_title("title5"))

    assert_equal(s1, list.delete_first)
    assert_equal(s2, list.delete_first)
    assert_equal(s4, list.delete_last)
    assert_equal(s3, list.delete_last)
    assert_nil(list.delete_last)
  end
end
