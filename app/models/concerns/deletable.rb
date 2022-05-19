module Deletable
  extend ActiveSupport::Concern
  

  included do
    # where the deleted_at field is not nil or null in the database
    # scope :deleted, ->{ where.not(deleted_at: nil) }

    # will unscope the deleted scope and return all records
    scope :with_deleted, ->{ unscope(where: :deleted_at) }
    scope :deleted, ->{ with_deleted.where.not(deleted_at: nil)  }

    scope :without_deleted, ->{ where(deleted_at: nil) }

    def soft_delete
      update(deleted_at: Time.now)
    end


    def soft_delete(mode=:soft, comment)
      if mode == :hard
        super
      else
        update(deleted_at: Time.now)
        if comment
          # self.comments.create( body: "Deleted #{self.class.name} #{self.id}")
          # self.comments.create( body: "Deleted #{self.class.name} #{self.id}")
          self.comments.create( body: comment)
        end
      end
    end
# https://gist.github.com/Chryus/d2ff4b2ba52ad8809fd0 for call backs after

  end



end