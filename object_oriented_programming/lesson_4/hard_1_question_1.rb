class SecretFile
  attr_reader :security

  def initialize(secret_data)
    @data = secret_data
    @security = SecurityLogger.new
  end

  def read
    security.create_log_entry
    data
  end

  private

  def data
    @data
  end
end

class SecurityLogger

  def initialize
    @log = []
  end

  def create_log_entry
    @log << Time.now
  end

  def log
    @log.each do |elem|
      puts elem
    end
  end
end

new_file = SecretFile.new("data")
puts new_file.read
sleep(2)
puts new_file.read

new_file.security.log
