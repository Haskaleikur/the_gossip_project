class Gossip < ApplicationRecord
  has_many :join_table_gossip_tags
  has_many :tags, through: :join_table_gossip_tags
  belongs_to :user
end
