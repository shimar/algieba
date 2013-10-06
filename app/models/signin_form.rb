class SigninForm
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email,
  presence: true

  validates :password,
  presence: true

  def find_user
    user = User.find_by_email(email)
  end

end
