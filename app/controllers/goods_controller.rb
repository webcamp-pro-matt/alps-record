class GoodsController < ApplicationController

  before_action :admin_flag_check?, only: [:admin_index, :admin_show, :admin_new, :admin_create, :admin_destroy, :admin_update, :admin_edit]
  before_action :resignation_flag_check?, only:[:admin_index, :admin_show, :admin_new, :admin_create, :admin_destroy, :admin_edit, :admin_update]

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

    if @good.goods_status == "1"
      @status = "販売停止中"
    else
      @status = "販売中"
    end
  end

  def admin_new
    @goods = Good.new
    @goods.music_titles.build
  end

  def admin_create
    good = Good.new(good_params)

    # 曲順をセット
    song_number_set(good)

    if good.save
    # 商品一覧ページにて戻す
      redirect_to admin_goods_path
    else
      redirect_to admin_goods_path
    end
  end

  def admin_destroy
    @good = Good.find(params[:id])
    # グッズを単純に消すと、注文履歴との不整合が発生するので、
    # グッズ削除フラグを立てて、各ビューで表示しないように制御する。
    @good.good_delete_flag = 1
    @good.save
    redirect_to admin_goods_path
  end

  def admin_edit
    @good = Good.find(params[:id])
    @music_titles = MusicTitle.where(good_id: @good.id)

  end

  def admin_update
    good = Good.find(params[:id])
    if good.update(good_params)

      # グッズの中身を入れ替える
      # 曲順を入れる処理をする関数に@goodを渡す
      song_number_set(good)

      # saveに成功した場合は、商品一覧ページに遷移させる
      if good.save
        redirect_to admin_goods_path

      # saveに失敗した場合は、編集画面に戻す
      else
        @good = good
        render "admin_edit"
      end
    
    # updateに失敗した場合は、編集画面に戻す
    else
      @good = good
      render "admin_edit"
    end
  end

  # 曲順を入れる関数 引数:Good（単数）を入れると、曲順を1から設定します。
  def song_number_set(good)
    song_number = 1
    good.music_titles.each do |music|
      music.song_number = song_number
      song_number = song_number + 1
    end
  end

  # ストロングパラメーター
  private
  def good_params
    # モデルの複数形_attributes
    params.require(:good).permit(:id, :artist, :goods_status, :goods_title, :jacket_image, :price, :rabel, :stock, music_titles_attributes:[:id, :song, :_destroy])
  end

  def search_params
    params.require(:good).permit(:goods_title)
  end


end
