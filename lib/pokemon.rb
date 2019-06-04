# responsible for saving, adding, removing, or changing
# anything about each Pokémon
class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)

  end

  def self.save(name, type, db)
    #binding.pry
    #if self.id
    #  self.update
    #else
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
      db[:conn].execute(sql, name, type)
      @id = db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    #end
  end
end
