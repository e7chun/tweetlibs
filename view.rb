class View

  def menu
    puts "Welcome to Tweetlibs, the best thing you will ever do in bash!"
    puts "Please type a number to continue"
    puts "1) Start game\n 2)Exit"
    gets.chomp
  end

  def select_genre
    puts "Please type a number to choose a genre"
    puts "1) Sci-Fi\n 2) Horror\n 3) Romance"
    gets.chomp
  end

  def select_tweets
    #display 3 tweets and take a selection
  end

end