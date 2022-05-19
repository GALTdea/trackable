class Item < ApplicationRecord
  include Deletable

  has_many :comments, dependent: :destroy

  def deleted?
    self.deleted_at.present?
  end

end
