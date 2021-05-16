# == Schema Information
#
# Table name: slipboxes
#
#  id             :bigint           not null, primary key
#  description    :string
#  owner_username :string
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Slipbox < ApplicationRecord
  # define associations and dependencies 
  has_many :trees, :dependent => :destroy
  has_and_belongs_to_many :users
  has_and_belongs_to_many :references

  # ensure there is a title when creating a slipbox
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  
  # validates :created_at, presence: true
  # validates :updated_at, presence: true

  before_create :set_owner_username

  def set_owner_username
    self.owner_username = @current_user_username
  end

end
