# == Schema Information
#
# Table name: slipboxes
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Slipbox < ApplicationRecord
end
