# == Schema Information
#
# Table name: notes
#
#  content           :string
#  title             :string
#  unique_identifier :string           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  thread_id         :bigint           not null
#
FactoryBot.define do
  factory :note do
    title { "MyString" }
    content { "MyString" }
  end
end
