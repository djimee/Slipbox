# == Schema Information
#
# Table name: slipboxes
#
#  id             :bigint           not null, primary key
#  description    :string
#  owner_username :string
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :slipbox do
    
  end
end
