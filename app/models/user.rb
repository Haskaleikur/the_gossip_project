class User < ApplicationRecord
  belongs_to :city
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :sent_messages, foreign_key: 'recipient_id', class_name: "JoinTableMessageRecipient"
  has_many :gossips
end
