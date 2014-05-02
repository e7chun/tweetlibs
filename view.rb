class View

  def menu
    puts "Welcome to Tweetlibs, the best thing you will ever do in bash!"
    puts "Please type a number to continue"
    puts "1) Start game\n2) Exit"
    gets.chomp
  end

  def select_genre
    system 'clear'
    puts "Please type a number to choose a genre"
    puts "1) Sci-Fi\n2) Horror\n3) Romance"
    gets.chomp
  end

  def select_tweets(tweets)
    system 'clear'
    puts "Please select a tweet by number"
    puts "1) #{tweets[0]}\n2) #{tweets[1]}\n3) #{tweets[2]}"
    gets.chomp.to_i
  end

  def display_story(story)
    puts story
    puts "\nPress enter to continue"
    gets.chomp
  end
end