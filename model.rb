class Model

  def initialize
    #instantiate database
    @user_1_tweets = []
    @user_2_tweets = []
  end

  def select_genre
    db.execute('#search for the story selected by user')
  end

  def sample_tweets_user_1
    select_tweets
    @user_1_tweets.slice(3)
  end

  def sample_tweets_user_2
    select_tweets
    @user_2_tweets.slice(3)
  end

  def select_tweets
    #populate the 2 tweet instaance varaibales with tweets from api
  end


end