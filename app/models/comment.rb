class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :content, :commentable_type
  belongs_to :commentable, :polymorphic => true
end
