class GoodsController < ApplicationController
  def index
  end

  def search
  end

  def show
  end

  def admin_index
    @goods = Good.all
  end

  def admin_show
    @good = Good.find(params[:id])
    @music_titles = MusicTitle.where(good_id: @good.id)
  end

  def admin_new
    @goods = Good.new
    @goods.music_titles.build
  end

  def admin_create
    @good = Good.new(good_params)
    @good.save
    # 商品一覧ページにて戻す
    redirect_to admin_goods_path
  end

  def admin_destroy
    @good = Good.find(params[:id])
    @good.destroy
    redirect_to admin_goods_path
  end

  def admin_edit
    @good = Good.find(params[:id])
    @music_titles = MusicTitle.where(good_id: @good.id)

  end

  def admin_update
    @good = Good.find(params[:id])
    if @good.update(good_params)
      redirect_to admin_good_path
    else
      render "admin/edit"
    end
  end

  # ストロングパラメーター
  private
  def good_params
    # モデルの複数形_attributes
    params.require(:good).permit(:id, :artist, :goods_title , :jacket_image, :price, :rabel, :stock, music_titles_attributes:[:id, :song])
    #params.require(:music_title).permit(:song)
  end


end
