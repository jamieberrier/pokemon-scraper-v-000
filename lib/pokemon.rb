# responsible for saving, adding, removing, or changing
# anything about each Pokémon
class Pokemon
  attr_accessor :id, :name, :type, :db
  #attr_reader :id

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
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
      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    #end
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL

    db.execute(sql, id).map do |row|
      #self.new(id, row[1], row[2], db)
      #self.new(id: id, name: row[1], type: row[2], db: db)
      id = row[0]
      name = row[1]
      type = row[2]
      #binding.pry
      self.new(id: id, name: name, type: type, db: db)
      #p = self.new
      #binding.pry
    end
    #binding.pry

  end
end
