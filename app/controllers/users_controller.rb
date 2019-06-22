class UsersController < ApplicationController

  before_action :admin_flag_check?, only: [:admin, :admin_index, :admin_show, :admin_destroy, :admin_update, :admin_edit]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def destroy
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
  end

  def admin_index
    @users = User.all
    # 仮で書いてます
    @children = UsersChild.all
    # テストです
    @temp_array = Array.new
  end

  def admin_show
    @child = UsersChild.find_by(user_id: params[:id])
  end

  def admin_destroy
  end

  def admin_edit
    @user = User.find(params[:id])
    @users_children = UsersChild.find_by(user_id: @user.id)
  end

  def admin_update
    @user = User.find(params[:id])
    #@user = User.find(params[:id])
    #@users_children = UsersChild.find_by(user_id: @user.id)
    if @user.update(user_params)
      redirect_to admin_path
    else
      render "admin/edit"
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :phone_number, users_children_attributes:[:id, :name_kanji_mei, :name_kanji_sei, :name_kana_mei, :name_kana_sei, :post_code, :address] )
  end


end
