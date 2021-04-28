# == Schema Information
#
# Table name: notes
#
#  id                :bigint           not null, primary key
#  title             :string
#  unique_identifier :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  reference_id      :bigint
#  tree_id           :bigint           not null
#
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
