# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  owner_id    :integer
#  name        :string(255)      not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
