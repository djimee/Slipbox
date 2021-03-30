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
    has_many :trees
    has_many :slipbox_users
    has_many :users, :through => :slipbox_users
    has_and_belongs_to_many :references
end
