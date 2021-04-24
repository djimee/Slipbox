# == Schema Information
#
# Table name: slipboxes
#
#  id          :bigint           not null, primary key
#  description :string
#  sort        :integer
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Slipbox < ApplicationRecord
    has_many :trees
    has_many :slipbox_users
    has_many :users, :through => :slipbox_users
    has_and_belongs_to_many :references

    # ensure there is a title
    validates :title, presence: true, uniqueness: { case_sensitive: false }
end
