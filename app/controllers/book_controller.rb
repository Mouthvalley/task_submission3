class BookController < ApplicationController
  def new
    # Book.allはテーブルに保存されたデータを全取得する
    @book = Book.new
    @books = Book.all
  end

 # 投稿データの保存
  def create
    @book = Book.new(book_params)
# current_user.name : 今ログインしているユーザーのIDを表示
# current_user.name : 今ログインしているユーザーの名前を表示
# current_user.email : 今ログインしているユーザーのメールアドレスを表示
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def index
  end

  def show
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end
end
