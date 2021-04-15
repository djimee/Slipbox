# == Schema Information
#
# Table name: notes
#
#  content           :string           not null
#  title             :string
#  unique_identifier :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  tree_id           :bigint           not null
#
require 'rails_helper'

RSpec.describe Note, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
