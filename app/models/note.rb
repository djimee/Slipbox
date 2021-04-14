# == Schema Information
#
# Table name: notes
#
#  id                :bigint           not null, primary key
#  content           :string           not null
#  title             :string
#  unique_identifier :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  tree_id           :bigint           not null
#
class Note < ApplicationRecord
    belongs_to :tree
    has_and_belongs_to_many :references
end
