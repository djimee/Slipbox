# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  current_sign_in_at :datetime
#  current_sign_in_ip :inet
#  dn                 :string
#  email              :string           default(""), not null
#  givenname          :string
#  last_sign_in_at    :datetime
#  last_sign_in_ip    :inet
#  mail               :string
#  ou                 :string
#  remember_token     :string
#  sign_in_count      :integer          default(0), not null
#  sn                 :string
#  uid                :string
#  username           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_username  (username)
#
class User < ApplicationRecord
  # define associations
  include EpiCas::DeviseHelper
  has_many :slipbox_users
  has_many :slipboxes, :through => :slipbox_users
  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  # validates :email, presence: true
  # validates :sign_in_count, presence: true
  # validates :created_at, presence: true
  # validates :updated_at, presence: true
  end
