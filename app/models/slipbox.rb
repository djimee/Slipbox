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
  # define associations and dependencies 
  has_many :trees, :dependent => :destroy
  has_many :users, :through => :slipbox_users
  has_many :slipbox_users
  has_and_belongs_to_many :references

  # ensure there is a title when creating a slipbox
  validates :title, presence: true, uniqueness: { case_sensitive: false }
 
  # validates :created_at, presence: true
  # validates :updated_at, presence: true
end
