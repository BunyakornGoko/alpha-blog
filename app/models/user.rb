class User < ApplicationRecord
    before_save { self.email = email.downcase }
    has_many :articles
    has_secure_password
  
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
  
    VALID_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
  
    # Add custom password validation
    validates :password, presence: true, length: { minimum: 6 }, if: :validate_password?
  
    private
  
    # Ensure password is validated on create or if explicitly updated
    def validate_password?
      new_record? || password.present?
    end
  end
  