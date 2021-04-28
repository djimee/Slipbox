# == Schema Information
#
# Table name: references
#
#  id               :bigint           not null, primary key
#  author           :string           not null
#  content          :string
#  publication_year :integer
#  sort             :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Reference < ApplicationRecord
  # define association with slipbox
  has_and_belongs_to_many :slipboxes

  # ensure author is present when creating a reference
  validates :author, presence: true
end
