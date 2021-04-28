require 'rails_helper'

RSpec.describe Note, type: :model do
  context 'validation tests' do

    # currently not passing due to not having a valid tree to test on
    it 'Should successfully create note' do
      note = described_class.new(unique_identifier: "1a2", content: "testContent", title: "testingtitle")
      expect(note).to be_valid
    end
  end
end
