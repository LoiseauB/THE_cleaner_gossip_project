class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Adresse invalide, boulet!" }
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    puts "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
    puts remember_digest
    puts "yyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
    self.update!(remember_digest: remember_digest)
    
  end
end
