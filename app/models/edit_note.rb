# == Schema Information
#
# Table name: edit_notes
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EditNote < ApplicationRecord

    has_rich_text :body


end
