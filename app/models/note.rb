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
class Note < ApplicationRecord
    self.primary_key = "unique_identifier"
    belongs_to :tree
    has_and_belongs_to_many :references
end
