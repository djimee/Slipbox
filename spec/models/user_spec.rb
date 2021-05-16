# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  current_sign_in_at :datetime
#  current_sign_in_ip :inet
#  dn                 :string
#  email              :string           default(""), not null
#  givenname          :string
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :inet
#  mail               :string
#  ou                 :string
#  sign_in_count      :integer          default(0), not null
#  sn                 :string
#  uid                :string
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_username  (username)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
  
    it 'should check if a email is present' do
      user = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), email: "testemail@test.com", sign_in_count: 0)
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'should check if a created_at is present' do
      user = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), email: "testemail@test.com", sign_in_count: 0)
      user.created_at = nil
      expect(user).to_not be_valid
    end

    it 'should check if a updated_at is present' do
      user = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), email: "testemail@test.com", sign_in_count: 0)
      user.updated_at = nil
      expect(user).to_not be_valid
    end

    it 'should save User successfully' do
      user = described_class.new(created_at: DateTime.new(2021,2,3,4,5,6), updated_at: DateTime.new(2021,2,3,4,5,6), email: "testemail@test.com", sign_in_count: 0)
      expect(user).to be_valid
    end
  end
end
