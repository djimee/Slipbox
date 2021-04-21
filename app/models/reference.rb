# == Schema Information
#
# Table name: references
#
#  id         :bigint           not null, primary key
#  author     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Reference < ApplicationRecord
  has_and_belongs_to_many :notes
  has_and_belongs_to_many :slipboxes

  validates :author, presence: true
    
  # add a rich text field to note using Action Text
  has_rich_text :content

end
