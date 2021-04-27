# == Schema Information
#
# Table name: references
#
#  id               :bigint           not null, primary key
#  author           :string           not null
#  content          :string
#  publication_year :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
FactoryBot.define do
  factory :reference do
    author { "MyString" }
    rest_of_reference { "MyString" }
  end
end
