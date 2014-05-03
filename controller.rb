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
    @user_1_tweets = []
    @user_2_tweets = []
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
    display_story
  end

  def select_genre
    @genre = @view.select_genre
  end

  def select_tweets
    @model.select_tweets
    until @user_1_tweets.length == 3
      make_tweet_selections
    end
  end

  def make_tweet_selections
    tweet_sample_1 = @model.sample_tweets_user_1
    tweet_sample_2 = @model.sample_tweets_user_2
    @user_1_tweets << tweet_sample_1[@view.select_tweets(tweet_sample_1)]
    @user_2_tweets << tweet_sample_2[@view.select_tweets(tweet_sample_2)]
  end

  def display_story
    story = @model.build_story(@user_1_tweets, @user_2_tweets)
    @view.display_story(story)
    menu
  end


end