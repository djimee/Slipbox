# == Schema Information
#
# Table name: references
#
#  id         :bigint           not null, primary key
#  author     :string           not null
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Reference < ApplicationRecord
  has_and_belongs_to_many :slipboxes

  validates :author, presence: true
end
