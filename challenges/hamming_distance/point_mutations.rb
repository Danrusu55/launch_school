class DNA
  attr_reader :original_strand

  def initialize(original_strand)
    @original_strand = original_strand
  end

  def hamming_distance(new_strand)
    index = 0
    number_of_mutations = 0
    loop do
      if original_strand[index] != new_strand[index]
        number_of_mutations += 1
      end
      index += 1
      break if index > original_strand.size - 1
      break if index > new_strand.size - 1
    end
    number_of_mutations
  end
end
