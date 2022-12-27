class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  #投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)#フォームに入力されたデータを@post_imageに格納
    @post_image.user_id = current_user.id#モデル名+カラム名で保存するカラムの中身を操作できる
    @post_image.save#cureent_user.id=ログイン中のユーザーの情報を取得できるメソッド
    redirect_to post_images_path
  end

  def index
  end

  def show
  end

  #投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
