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
end