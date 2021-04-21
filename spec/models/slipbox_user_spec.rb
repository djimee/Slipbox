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
require 'rails_helper'

RSpec.describe SlipboxUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
