# == Schema Information
#
# Table name: notes
#
#  content    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Note < ApplicationRecord
    belongs_to :tree
end
