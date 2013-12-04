class Comment < ActiveRecord::Base
  belongs_to :post
  include ActiveModel::ForbiddenAttributesProtection
end
