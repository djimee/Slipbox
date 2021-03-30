# == Schema Information
#
# Table name: slipbox_users
#
#  admin      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :slipbox_user do
    admin { false }
  end
end
