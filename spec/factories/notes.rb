# == Schema Information
#
# Table name: notes
#
#  content    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :note do
    title { "MyString" }
    content { "MyString" }
  end
end
