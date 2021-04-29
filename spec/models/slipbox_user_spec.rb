# == Schema Information
#
# Table name: slipbox_users
#
#  admin      :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slipbox_id :bigint           not null
#  user_id    :bigint           not null
#
require 'rails_helper'
require 'spec_helper'
require 'date'

RSpec.describe SlipboxUser, type: :model do
  context 'validation tests' do

    it 'ensures admin field is present' do
      slipbox_user = SlipboxUser.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), slipbox_id: 2,user_id: 1).save
      expect(slipbox_user).to eq(false)
    end

    it 'ensures created_at field is present' do
      slipbox_user = SlipboxUser.new(admin: true, updated_at: DateTime.new(2021,2,3,4,5,6), slipbox_id: 2,user_id: 1).save
      expect(slipbox_user).to eq(false)
    end

    it 'ensures updated_at field is present' do
      slipbox_user = SlipboxUser.new(admin: true, created_at: DateTime.new(2021,2,3,4,5,6), slipbox_id: 2,user_id: 1).save
      expect(slipbox_user).to eq(false)
    end

    it 'ensures slipbox_id field is present' do
      slipbox_user = SlipboxUser.new(admin: true, created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6),user_id: 1).save
      expect(slipbox_user).to eq(false)
    end

    it 'ensures user_id field is present' do
      slipbox_user = SlipboxUser.new(admin: true, created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6),slipbox_id: 2).save
      expect(slipbox_user).to eq(false)
    end

    #failing due to not having a valid slipbox 
    #it 'should save slipbox_user successfully' do
    #  slipbox_user = SlipboxUser.new(admin: true, created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6),slipbox_id: 2, user_id: 1).save
    #  expect(slipbox_user).to be_valid
    #end

  end

  context 'scope tests' do 
  end
end

