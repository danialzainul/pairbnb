class User < ActiveRecord::Base
  include Clearance::User

  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy
  has_many :reservations, through: :purchases, :dependent => :destroy
  has_many :purchases

  mount_uploader :avatar, AvatarUploader

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.first_name = auth_hash["info"]["first_name"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.authentications<<(authentication)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

  ## Braintree payment system
  def cart_total_price
    total_price = 0
    get_cart_reservations.each { |reservation| total_price+= reservation.price }
    total_price
  end

  def get_cart_reservations
    cart_ids = $redis.smembers "cart#{id}"
    Reservation.find(cart_ids)
  end

  def purchase_cart_reservations!
    get_cart_reservations.each { |reservation| purchase(reservation) }
    $redis.del "cart#{id}"
  end

  def purchase(reservation)
    reservations << reservation unless purchase?(reservation)
  end

  def purchase?(reservation)
    reservations.include?(reservation)
  end

end
