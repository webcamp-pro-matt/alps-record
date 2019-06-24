class GoodsController < ApplicationController

  before_action :admin_flag_check?, only: [:admin_index, :admin_show, :admin_new, :admin_create, :admin_destroy, :admin_update, :admin_edit]

  def index
    @goods = Good.all
    @good = Good.new

  end

  def search
    @search = Good.new(search_params)
    @goods = Good.where(goods_title: @search.goods_title)
    @good = Good.new
    render "index"
  end

  def show
    @good = Good.find(params[:id])
    @music_titles = MusicTitle.where(good_id: @good.id)
    @cart = Cart.new
  end

  def admin_index
    @goods = Good.all
  end

  def admin_show
    @good = Good.find(params[:id])
    @music_titles = MusicTitle.where(good_id: @good.id)

    if @good.goods_status == 0
      @status = "販売中"
    else
      @status = "販売停止中"
    end
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
      redirect_to admin_goods_path
    else
      render "admin/edit"
      #aaa
    end
  end

  # ストロングパラメーター
  private
  def good_params
    # モデルの複数形_attributes
    params.require(:good).permit(:id, :artist, :goods_title , :jacket_image, :price, :rabel, :stock, music_titles_attributes:[:id, :song])
    #params.require(:music_title).permit(:song)
  end

  def search_params
    params.require(:good).permit(:goods_title)
  end


end
