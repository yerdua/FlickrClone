# == Schema Information
#
# Table name: album_inclusions
#
#  id         :integer          not null, primary key
#  photo_id   :integer          not null
#  album_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AlbumInclusionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
