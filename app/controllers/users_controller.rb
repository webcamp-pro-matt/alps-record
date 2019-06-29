class UsersController < ApplicationController

  before_action :admin_flag_check?, only: [:admin, :admin_index, :admin_show, :admin_destroy, :admin_update, :admin_edit]
  before_action :resignation_flag_check?, only: [:show, :edit, :destroy, :update, :admin, :admin_index, :admin_show, :admin_destroy, :admin_edit, :admin_update]

  def show
    @user = current_user
    @orders = Order.where(user_id: @user.id)
    orders = Order.find_by(user_id: @user.id)

    # ユーザーの購入履歴があるとき
    if orders != nil

      # viewで使う、購入履歴を表示するか判断するフラグを作成
      @buy_view_flg = 1

    # ユーザーの購入履歴がないとき(nil)
    else

      # viewで使う、購入履歴を表示するか判断するフラグを作成
      @buy_view_flg = 0
      
    end

    

  end

  def edit
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @user.resignation_flag = 1
    @user.save
    redirect_to "/"
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      #パスワード変更するとログアウトしてしまうので、もう一度強制的にサインインさせてる。
      sign_in(@user, bypass: true)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  def admin
    @order = Order.where(buy_flag: 1)
    
  end

  def admin_index
    @users = User.all
    @children = UsersChild.all
    @temp_array = Array.new
  end

  def admin_show
    @user = User.find(params[:id])
    @child = UsersChild.find_by(user_id: params[:id])
    @orders = Order.where(user_id: @user.id)
  end

  def admin_destroy
     @user = User.find(params[:id])
     @user.resignation_flag = 1
     @user.save
     redirect_to admin_path
  end

  def admin_edit
    @user = User.find(params[:id])
    @users_children = UsersChild.find_by(user_id: @user.id)
  end

  def admin_update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to admin_path
    else
      render "admin_edit"
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :phone_number, users_children_attributes:[:id, :name_kanji_mei, :name_kanji_sei, :name_kana_mei, :name_kana_sei, :post_code, :address] )
  end


end
