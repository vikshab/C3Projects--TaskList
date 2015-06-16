module TaskList
  class Database
    attr_reader :database_name

    def initialize(database_name)
      @database_path = "db/#{ database_name }.db"
    end

    private

    def query!(statement, *params)
      db = SQLite3::Database.new(@database_path)
      db.execute statement, params
    rescue SQLite3::Exception => error
      # we have not covered this in class yet
    ensure
      db.close if db
    end
  end
end
