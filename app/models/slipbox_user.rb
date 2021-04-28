# == Schema Information
#
# Table name: slipbox_users
#
#  admin      :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slipbox_id :bigint           not null
#  user_id    :bigint           not null
#
class SlipboxUser < ApplicationRecord
  belongs_to :slipbox
  belongs_to :note
  
end
