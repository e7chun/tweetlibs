require 'sqlite3'
require 'debugger'

DATABASE_NAME = 'tweetlibs-database'
$tweetlibs_database = SQLite3::Database.new "#{DATABASE_NAME}.db"

class Name_me_later
  def initialize
    @title = ''
    @genre = ''
    @story = ''
  end

  def read_in_story_file(file_name) #file_path should be a string
    file = File.new(file_name)
      story_array = file.readlines('\n')
      @title = story_array[0]
      @genre = story_array[1]
      @story = story_array[2]
  end

  def create_db_table
    $tweetlibs_database.execute(<<-SQL
      CREATE TABLE story_templates (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title VARCHAR DEFAULT NULL,
        genre VARCHAR DEFAULT NULL,
        story TEXT DEFAULT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
      );  
      SQL
    )

  end

  def add_storys_to_table
    $tweetlibs_database.execute(
      " INSERT into story_templates (title, genre, story, updated_at) 
      VALUES (' #{@title} ', ' #{@genre} ', ' #{@story} ', ' #{Time.now} ' ;) "
    )
  end

end

test = Name_me_later.new
test.read_in_story_file('spaceopera1.txt')
test.create_db_table
test.add_storys_to_table


