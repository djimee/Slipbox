# == Schema Information
#
# Table name: notes
#
#  id                :bigint           not null, primary key
#  title             :string
#  unique_identifier :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  reference_id      :bigint
#  tree_id           :bigint           not null
#
FactoryBot.define do
  factory :note do
    
  end
end
