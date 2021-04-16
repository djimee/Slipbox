# == Schema Information
#
# Table name: notes
#
#  id                :bigint           not null, primary key
#  title             :string
#  unique_identifier :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  tree_id           :bigint           not null
#
class Note < ApplicationRecord
    belongs_to :tree
    has_and_belongs_to_many :references

    # add a rich text field to note using Action Text
    has_rich_text :content

    # ensures there is content and a unique title
    validates :unique_identifier, presence: true, uniqueness: { case_sensitive: false }
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :content, presence: true
end
