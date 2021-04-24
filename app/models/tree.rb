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
    belongs_to :slipbox
    has_many :notes

    validates :title, presence: true, uniqueness: { case_sensitive: false }
end
