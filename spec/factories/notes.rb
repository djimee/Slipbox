# == Schema Information
#
# Table name: notes
#
#  content           :string           not null
#  title             :string
#  unique_identifier :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  tree_id           :bigint           not null
#
FactoryBot.define do
  factory :note do
    title { "MyString" }
    content { "MyString" }
  end
end
