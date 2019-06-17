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
  end

  def admin_destroy
  end

  def admin_edit
  end

  def admin_update
  end
end
