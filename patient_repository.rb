require 'byebug'
require 'csv'

require_relative 'patient'

class PatientRepository
  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @next_id = 1
    @patients = []
    load_csv
  end

  def add_patient(patient)
    # patient has no id;
    patient.id = @next_id
    # assigns next id to patient
    @patients << patient
    # increment next id
    @next_id += 1
    save_csv
  end

  private

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }

    CSV.foreach(@csv_filepath, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:cured] = row[:cured] == "true"
      @patients << Patient.new(row)
    end

    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end

PatientRepository.new('patients.csv')
