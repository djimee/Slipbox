# == Schema Information
#
# Table name: trees
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slipbox_id :bigint           not null
#
require 'rails_helper'

RSpec.describe Tree, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
