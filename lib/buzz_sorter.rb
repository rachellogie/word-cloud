class BuzzSorter

  def initialize(starting_hash)
    @starting_hash = starting_hash
  end

  def make_new_hash
    #iterate through each person
    final_buzz_words = {}
    @starting_hash.each do |person, list|
      list.each do |buzz_phrase|
        buzz_word_array = buzz_phrase.split(" ")
        buzz_word_array.each do |word|
          word.downcase!
          if !final_buzz_words.has_key? word
            final_buzz_words[word] = {:count=>1, :people=>[person]}
          else
            final_buzz_words[word][:count] += 1
            if !final_buzz_words[word][:people].include? person
              final_buzz_words[word][:people] << person
            end
          end
        end
      end
    end
    final_buzz_words
  end
end