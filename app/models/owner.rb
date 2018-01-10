class Owner < ActiveRecord::Base
  # TODO: add association ot pets
  has_many :pets

  
  # TODO: add association to appointments (through pets)
  
  # TODO: add validations
  validates :first_name, presence: true, length: {maximum: 255}
  validates :last_name, presence: true, length: {maximum: 255}
  validates :email, presence: true, inclusion: {in: %w(@)}, uniqueness: true, length: {maximum: 255}

  before_save :normalize_phone_number

  # removes leading 1 and the characters (, ), -, .
  def normalize_phone_number
    # validates :phone, exclusion: {in: %w(, - ( ) . )}
  end

end
