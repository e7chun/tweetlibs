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
    tweets = @model.select_tweets
    @view.select_tweets(tweets)
  end


end