require "tempfile"

module Eicar
  TEST_STRING = "X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*"

  # Instantiates an "infected" file in a temp folder, passes it to the block,
  # and then deletes it afterwards.
  def self.with_fake_virus(&block)
    Tempfile.open("eicar_test_virus") do |f|
      f.write(TEST_STRING)
      f.rewind
      block.call(f)
    end
  end
end