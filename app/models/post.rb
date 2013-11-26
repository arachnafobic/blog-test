class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  attr_accessible :text, :title

  validate  :ensure_slug_uniqueness
  validates :title, presence: true, length: { minimum: 5 }

  def to_param
    [id, title.parameterize].join("-")
  end

  protected

    def ensure_slug_uniqueness
      if self.slug.blank?
        errors.add(:slug, "can't be blank")
      end

      unless Slug[self.slug].nil? || Slug[self.slug] == self.id.to_s
        errors.add(:slug, "is allready taken")
      end
    end

end
