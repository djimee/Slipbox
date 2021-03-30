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
require 'rails_helper'

RSpec.describe Note, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
