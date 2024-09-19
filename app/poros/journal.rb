class Journal
  attr_reader :id,
              :date,
              :entry,
              :affirmation

  def initialize(data)
    @id = data['id']
    @date = data['date'] 
    @entry = data['entry']
    @affirmation = data['affirmation']
  end
end