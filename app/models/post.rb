class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :title,
                  :post_shares_attributes, :links_attributes

  belongs_to :author, class_name: 'User'
  has_many :links
  has_many :post_shares

  accepts_nested_attributes_for :post_shares
  accepts_nested_attributes_for :links, :reject_if => :all_blank
end
