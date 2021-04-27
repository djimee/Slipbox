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
class Tree < ApplicationRecord
  # define assocations and dependencies
  belongs_to :slipbox
  has_many :notes, :dependent => :destroy

  # ensure there is a unique title for a tree when creating
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
