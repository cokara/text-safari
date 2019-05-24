class Hadithi
  attr_reader :actions, :grouped_actions

  def initialize(actions)
    @actions = actions
  end

  def call
    group_actions
    sentences(build_phrases)
  end

  def sentences(grouped_phrases)
    hadithi = ""
    grouped_phrases.each_with_index do |phrases, j|
      if j == 0
        sentence = 'X '
      else
        sentence = "#{fillers.sample.capitalize} "
      end
      phrases.each_with_index do |phrase, i|
        if i == 0
          tense  = 'ali'
        else
          tense = 'aka'
        end
        sentence << "#{tense}#{phrase} "
        sentence << "#{fillers.sample} " unless i == phrases.count - 1
      end
      hadithi << sentence
      hadithi << ".\n"
      hadithi
    end
    hadithi
  end

  def group_actions
    current_count = 0
    current_array = []
    result_array  = []
    actions.each_with_index do |m, i|
      if current_count >= 4
        result_array << current_array
        current_count = 0
        current_array = []
      end
      current_array << m
      current_count += 1

      if actions.count == i+1
        result_array << current_array
      end
    end

    @grouped_actions = result_array
  end

  def build_phrases
    sentences = []
    grouped_actions.each do |group|
      sentences << group.map{|action| translate_action(action) }
    end
    sentences
  end

  def fillers
    %w[kisha halafu]
  end

  def translate_action(action)
    case action.to_s
    when 'turn'
      verb = 'piga'
      magnitude = translate_direction(action.magnitude)
    when 'move'
      verb = 'enda'
      magnitude = "dakika #{translate_number(action.magnitude)}"
    end

    "#{verb} #{magnitude}"
  end

  def translate_direction(direction)
    case direction
    when :right
      'kulia'
    when :left
      'kushoto'
    end
  end

  def translate_number(number)
    NumberDictionary.fetch(number)
  end
end
