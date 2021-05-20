# == Schema Information
#
# Table name: slipboxes
#
#  id             :bigint           not null, primary key
#  description    :string
#  owner_username :string
#  sort           :integer
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Slipbox, type: :model do
  context 'validation tests' do
    

    it 'should check if a title is present' do
      slipbox = described_class.new(title: "hello123", created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6))
      slipbox.title = nil
      expect(slipbox).to_not be_valid
    end

    it 'should check if a created_at is present' do
      slipbox = described_class.new(title: "hello123", created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6))
      slipbox.created_at = nil
      expect(slipbox).to_not be_valid
    end

    it 'should check if a updated_at is present' do
      slipbox = described_class.new(title: "hello123", created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6))
      slipbox.updated_at = nil
      expect(slipbox).to_not be_valid
    end

    it 'should save slipbox successfully' do
      slipbox = described_class.new(title: "hello123", created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6))
      
      expect(slipbox).to be_valid
    end
  end
end
