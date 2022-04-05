require 'game'
require 'test/unit/rr'
require 'stringio'

class TestForGameStart < Test::Unit::TestCase
  def setup
    @__current_stdout__ = $stdout
    $stdout = StringIO.new

    @game = Game.new
  end

  def cleanup
    $stdout = @__current_stdout__
  end

  def test_start_if_player1_win
    mock(@game).shuffle_deck do
      [
        1, 1, 2, 3, 4,
        5, 7, 8, 10, 12
      ]
    end
    assert_empty(@game.results)
    @game.start
    assert_match(/player1 win/, $stdout.string)
    last_result = @game.results.last
    assert_equal([1, 1, 2, 3, 4], last_result[0])
    assert_instance_of(OnePair, last_result[1])
    assert_equal([5, 7, 8, 10, 12], last_result[2])
    assert_instance_of(NoHand, last_result[3])
    assert_equal('player1', last_result[4])
  end

  def test_start_if_player2_win
    mock(@game).shuffle_deck do
      [
        1, 2, 3, 4, 5,
        1, 1, 2, 2, 2
      ]
    end
    assert_empty(@game.results)
    @game.start
    assert_not_empty(@game.results)
    assert_match(/player2 win/, $stdout.string)
    last_result = @game.results.last
    assert_equal([1, 2, 3, 4, 5], last_result[0])
    assert_instance_of(NoHand, last_result[1])
    assert_equal([1, 1, 2, 2, 2], last_result[2])
    assert_instance_of(FullHouse, last_result[3])
    assert_equal('player2', last_result[4])
  end
end
