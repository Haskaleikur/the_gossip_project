class User < ApplicationRecord
    
    validates :first_name,
    presence: true
  
    validates :last_name,
    presence: true
  
    validates :email,
    presence: true,
    uniqueness: true

    validates :age,
    presence: true

  belongs_to :city
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :sent_messages, foreign_key: 'recipient_id', class_name: "JoinTableMessageRecipient"
  has_many :gossips
  has_many :comments
  has_secure_password

end
