# == Schema Information
#
# Table name: photo_shares
#
#  id         :integer          not null, primary key
#  photo_id   :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PhotoSharesTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
