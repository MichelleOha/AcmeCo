class Employee < ApplicationRecord

  validates :first_name, presence: { message: 'Please add a first name!' }
  validates :last_name, presence: { message: 'Please add a last name!' }
  # Adding the uniqueness validation to ensure that each email is unique in the database, and the format validation to ensure that the email follows a valid format.
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Method to return full_name
  def full_name
    "#{first_name} #{last_name}"
  end
end

