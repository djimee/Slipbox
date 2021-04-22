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

    # ensures there is content, unique title and a unique ID in the format of letter/number alternating
    validates :unique_identifier, presence: true, uniqueness: { case_sensitive: false }
    format: { with: /\A^\b\d?(?:[a-z]\d)*[a-z]?$\z/, message: "unique ID must be in format: 1a2 for example - with letters in lower case"}
    validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }
    validates :content, presence: true
end
