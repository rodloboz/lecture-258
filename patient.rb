class Patient
  attr_reader :name, :age
  attr_accessor :id, :room

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
    @cured = attributes[:cured] || false
  end

  def cured?
    @cured
  end

  def cured!
    @cured = true
  end

  # def name
  #   @name
  # end

  # def age
  #   @age
  # end

  # def room
  #  @room
  # end

  # def room=(room)
  #   @room = room
  # end
end







