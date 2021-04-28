require 'rails_helper'

RSpec.describe Slipbox, type: :model do
  context 'validation tests' do
    it 'should check if a title is present' do
      slipbox = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6))
      expect(slipbox).to_not be_valid
    end

    it 'should check if a created_at is present' do
      slipbox = described_class.new(title: "hello123", updated_at: DateTime.new(2021,2,3,4,5,6))
      expect(slipbox).to_not be_valid
    end

    it 'should check if a updated_at is present' do
      slipbox = described_class.new(title: "hello123", created_at: DateTime.new(2021,2,3,4,5,6))
      expect(slipbox).to_not be_valid
    end

    it 'should save slipbox successfully' do
      slipbox = described_class.new(title: "hello123", created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6))
      expect(slipbox).to be_valid
    end
  end
end
