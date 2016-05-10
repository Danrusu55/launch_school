class Crypto
  attr_reader :normalize_plaintext

  def initialize(original_text)
    @normalize_plaintext = original_text.gsub(/\W*/, '').downcase
  end

  def size
    Math.sqrt(@normalize_plaintext.length).ceil
  end

  def plaintext_segments
    @normalize_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    normalize_ciphertext.delete ' '
  end

  def normalize_ciphertext
    elem_size = size
    ciphertext = ''
    index = 0
    while index < elem_size
      plaintext_segments.each do |elem|
        break if index >= elem_size || elem[index].nil?
        ciphertext << elem[index]
      end
      ciphertext << ' '
      index += 1
    end
    ciphertext.strip
  end
end
