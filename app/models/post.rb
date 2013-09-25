class Post < ActiveRecord::Base
  has_many  :comments,
            dependent: :destroy,
            inverse_of: :post

  default_scope { where(deleted: false) }

  def destroy
    self.deleted = true
    self.save!
    self.comments.destroy_all
  end
end
