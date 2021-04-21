# == Schema Information
#
# Table name: edit_notes
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :edit_note do
    title { "MyString" }
  end
end
