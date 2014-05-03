#require_relative 'api'
require_relative 'database'

require 'twitter'

require 'erb'

require 'debugger'

class Model

  def initialize(storybook = Storybook.new)
    #instantiate database
    @user_1_tweets = []
    @user_2_tweets = []
    @storybook = storybook
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "V9fa9p8YxOPtjE9YTcxjYztlr"
      config.consumer_secret     = "g9Ee6hJe094DowCyD4Oyecui39a6Nynt31uzKDXK4uOgl9vFML"
      config.access_token        = "171597575-KikuQ7884uFrBP9GLmh8ejrdDEfnGsTA9aOlJvQb"
      config.access_token_secret = "kLccAab1THvQPHVIH2lzhOUPv7XfQTHnEqtQVirQlt1s7"
    end
  end

  def get_tweets(twittername, num_of_tweets)
    strings = []
    tweets = @client.user_timeline(twittername)
    raise ArgumentError, 'Please input Twitter handle with at least 10 tweets.' unless tweets.length >= 10

    tweets.sample(num_of_tweets).each do |tweet|
      remove_urls_hagtags = /(https?:\/\/)?([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})([\/\w\.-]*)*\/?|@\w+|#\w+/
      remove_punctuations = /(\.|!|:|--|-)?$/
      urls_removed = tweet.text.gsub(remove_urls_hagtags, "").strip
      punc_removed = urls_removed.gsub(remove_punctuations, "").strip
      strings << punc_removed if punc_removed.length > 2
    end

    strings
  end


  def select_genre
    #db.execute('#search for the story selected by user')
  end

  def sample_tweets_user_1
    @user_1_tweets.pop(3)
  end

  def sample_tweets_user_2
    @user_2_tweets.pop(3)
  end

  def select_tweets
    @user_1_tweets = get_tweets('katyperry',9)
    @user_2_tweets = get_tweets('kanyewest',9)
  end

  def build_story(user_1_tweets, user_2_tweets)
    #refactor to reduce dependency
    @storybook.read_in_story_file('spaceopera1.txt')
    @storybook.create_db_table
    @storybook.add_storys_to_table
    story = @storybook.return_story[0][0]

    user1_replace = { user1_1: "#{user_1_tweets[0]}", user1_2: "#{user_1_tweets[1]}", user1_3: "#{user_1_tweets[2]}" }
    user2_replace = { user2_1: "#{user_2_tweets[0]}", user2_2: "#{user_2_tweets[1]}", user2_3: "#{user_2_tweets[2]}" }

    user1_replace.each { |key,value| story.sub!(key.to_s, value) }
    user2_replace.each { |key,value| story.sub!(key.to_s, value) }
    story
  end


end
