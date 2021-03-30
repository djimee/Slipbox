# == Schema Information
#
# Table name: slipboxes
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :slipbox do
    title { "MyString" }
  end
end
