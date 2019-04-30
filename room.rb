class Room
  class CapacityExeededException < Exception; end

  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @number = attributes[:number]
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.length >= @capacity
  end

  def add_patient(patient)
    # throw and exception if room is full
    fail CapacityExeededException, "Room is full" if full?

    # push patient into array
    @patients << patient
    # reference room instantance (self) in patient
    patient.room = self
  end
end
