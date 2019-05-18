class NumberDictionary
  DICTIONARY = {
    1 => 'moja',
    2 => 'mbili',
    3 => 'tatu',
    4 => 'nne',
    5 => 'tano',
    6 => 'sita',
    7 => 'saba',
    8 => 'nane',
    9 => 'tisa',
    10 => 'kumi'
  }

  def self.fetch(number)
    DICTIONARY[number]
  end
end
