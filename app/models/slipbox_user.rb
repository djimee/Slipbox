# == Schema Information
#
# Table name: slipbox_users
#
#  admin      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SlipboxUser < ApplicationRecord
    belongs_to :slipbox
    belongs_to :note
end
