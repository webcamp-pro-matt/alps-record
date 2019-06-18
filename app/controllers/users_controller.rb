class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def destroy
  end

  def update
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
    if @user.update(user_params)
      #redirect_to admin_path
    else
      render "admin/edit"
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :phone_number, user_children_attributes:[:name_kanji_mei, :name_kanji_sei, :name_kana_mei, :name_kana_sei, :post_code, :address] )
  end


end
