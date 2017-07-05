class Item < ApplicationRecord
  belongs_to :to_do_list

  def completed?
    !completed_at.blank?
  end
end
