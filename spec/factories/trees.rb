# == Schema Information
#
# Table name: trees
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slipbox_id :bigint           not null
#
FactoryBot.define do
  factory :tree do
    title { "MyString" }
  end
end
