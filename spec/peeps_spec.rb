require 'peeps'

describe Peeps do

  describe '.all' do
    it 'returns all of the peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')

      connection.exec("INSERT INTO peeps VALUES (1, 'here is my new peep!');")
      connection.exec("INSERT INTO peeps VALUES (2, 'here is my next peep!');")

      peeps = Peeps.all.join

      expect(peeps).to include("here is my new peep!")
      expect(peeps).to include("here is my next peep!")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create(newpeep: 'here is my new peep!')

      expect(Peeps.all).to include('here is my new peep!')
    end
  end

end