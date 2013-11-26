class PostObserver < ActiveRecord::Observer
  def after_save(post)
    Slug[post.slug] = post.id
    return true
  end
  def after_create(post)
    Slug[post.slug] = post.id
    return true
  end
  def after_update(post)
    Slug[post.slug] = post.id
    return true
  end

  def after_destroy(post)
    Slug.destroy(post.id)
    return true
  end
end
