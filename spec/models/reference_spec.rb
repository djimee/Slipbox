# == Schema Information
#
# Table name: references
#
#  id               :bigint           not null, primary key
#  author           :string           not null
#  content          :string
#  publication_year :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe Reference, type: :model do
  
    it 'should check if a author is present' do
      reference = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), author: "testAuthor")
      reference.author = nil
      expect(reference).to_not be_valid
    end

    it 'should check if a created_at is present' do
      reference = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), author: "testAuthor")
      reference.created_at = nil
      expect(reference).to_not be_valid
    end

    it 'should check if a updated_at is present' do
      reference = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), author: "testAuthor")
      reference.updated_at = nil
      expect(reference).to_not be_valid
    end

    it 'should save User successfully' do
      reference = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), author: "testAuthor")
      expect(reference).to be_valid
    end
end
