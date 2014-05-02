=begin
  
# create menu with 3 options, start game, exit game (later add review old stories)
# start game brings up a select genre (3 options)
    store the genre selection
  begin a loop that will run as many times as there are dialogue blanks in the story
    display 3 tweets to the user to choose from without repeats
      store selection
  access the pertinent information from the database (story)
    put it together and display to user
  return to main menu
=end

require_relative 'view'
require_relative 'model'

class TweetLibs
  attr_accessor :genre

  def initialize(view, model)
    @view = view
    @model = model
    @user_1_tweets
    @user_2_tweets
  end

  def menu
    selection = @view.menu
    case selection.to_i
    when 1
      start_game
    when 2
      return
    else 
      menu
    end
  end

  def start_game
    select_genre
    select_tweets
  end

  def select_genre
    @genre = @view.select_genre
  end

  def select_tweets
    populate_tweet_arrays
    call_view_tweets(@user_1_tweets)
    call_view_tweets(@user_2_tweets) 
  end

  def call_view_tweets(tweet_array)
    final_array = []
    until tweet_array.length == 3
      selection_array = tweet_array.shift(3)
      selection = @view.select_tweets(selection_array)
      final_array << selection_array[selection]
    end
    tweet_array = final_array
  end

  def populate_tweet_arrays
    @user_1_tweets = @model.select_tweets(1)
    @user_2_tweets = @model.select_tweets(2)
  end


end