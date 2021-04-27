# == Schema Information
#
# Table name: references
#
#  id               :bigint           not null, primary key
#  author           :string           not null
#  content          :string
#  publication_year :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Reference < ApplicationRecord
  has_and_belongs_to_many :slipboxes

  # show 10 references per page for ref table
  paginates_per 8

  validates :author, presence: true
end
