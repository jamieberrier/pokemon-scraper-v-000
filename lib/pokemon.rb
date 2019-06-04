# responsible for saving, adding, removing, or changing
# anything about each Pokémon
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: id, name: name, type: type, db: db, hp: hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
      SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
    #binding.pry

    db.execute(sql, id).map do |row|
      @name = row[1]
      @type = row[2]
    end
    binding.pry
    self.new(id: id, name: @name, type: @type, db: db)
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
    sql = "UPDATE pokemon SET name = ?, type = ?, hp = ? WHERE id = ?"

    db.execute(sql, self.name, self.type, self.hp, self.id)

    #binding.pry
    #sql2 = "SELECT * FROM pokemon WHERE id = 1"
    #db.execute(sql2)
  end
end
