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
require 'rails_helper'

RSpec.describe Tree, type: :model do
  context 'validation tests' do
    it 'should save tree successfully' do
      tree1 = described_class.new
      tree1.title = "hello"
      expect(tree1).to be_valid
    end
  end

end
