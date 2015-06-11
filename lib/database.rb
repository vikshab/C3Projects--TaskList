require 'sqlite3' # TODO: Is this line necessary?

module TaskList
  class Database
    attr_reader :database_name

    def initialize(database_name)
      @database_path = "db/#{ database_name }"
    end

    private

    def query!(statement)
      db = SQLite3::Database.new(@database_path)
      db.execute statement
    rescue SQLite3::Exception => error
      # use this block to recover from an error
      # consider giving the user a special message back
      # inspect the `error` object for information about the error
    ensure
      db.close if db
    end
  end
end
