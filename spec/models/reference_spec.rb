# == Schema Information
#
# Table name: references
#
#  id         :bigint           not null, primary key
#  author     :string           not null
#  content    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Reference, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
