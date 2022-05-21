class Item < ApplicationRecord
  include Deletable

  has_many :comments, dependent: :destroy

  def deleted?
    self.deleted_at.present?
  end

  def filter_by_deleted
    self.deleted? ? self.deleted_at : self
  end

  def show_deleted_filter
    self.deleted? ? 'deleted' : 'all'
  end


  def self.filter(params)
    if params[:filter] == 'show_deleted'
      self.with_deleted
    else
      self.without_deleted
    end
  end






end
