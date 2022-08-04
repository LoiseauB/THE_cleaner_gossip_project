class Gossip < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum:14}
  validates :content, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags
end
