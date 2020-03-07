class Pokemon
  attr_reader :id, :name, :type, :hp, :db
   @@all = []

    def initialize (id:, name:, type:, hp: nil, db:)
     @id = id
     @name = name
     @type = type
     @hp = hp
     @db = db
     @@all << self
   end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end

    def self.find(id_num, db)
      pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
      new_pokemon = self.new(pokemon)
      new_pokemon.id = pokemon[0]
      new_pokemon.name = pokemon[1]
      new_pokemon.type = pokemon[2]
      new_pokemon.hp = pokemon[3]
      new_pokemon
   end

    def alter_hp(new_hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end
      
    end	