class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #モデル指定
  has_many :users_children
  has_many :carts
  #親から子のモデルをいじるとき作成する
  accepts_nested_attributes_for :users_children, :carts



end
