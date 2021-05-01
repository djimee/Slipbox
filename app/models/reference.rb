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

  # ensure author and content is present when creating a reference + set
  # maximum character counts for both
  validates :author, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 110 }

  # allow publication_year to have max 4 characters
  validates :publication_year, presence: true, length: { maximum: 4 }

  # validates :created_at, presence: true
  # validates :updated_at, presence: true

  # show 7 references per page for ref table
  paginates_per 7
end
