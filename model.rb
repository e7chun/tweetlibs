require_relative 'api'

require 'twitter'

class Model

  def initialize
    #instantiate database
    @user_1_tweets = []
    @user_2_tweets = []
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

  end


end