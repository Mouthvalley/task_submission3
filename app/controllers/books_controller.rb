class BooksController < ApplicationController
  def index
    # Book.allはテーブルに保存されたデータを全取得する
    @book = Book.new
    @books = Book.all
  end

  def create
# 投稿データの保存
    @book = Book.new(book_params)
# current_user.name : 今ログインしているユーザーのIDを表示
# current_user.name : 今ログインしているユーザーの名前を表示
# current_user.email : 今ログインしているユーザーのメールアドレスを表示
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  # 投稿データのストロングパラメータ
  private

  def book_params
                                    # ↓？？？↓
    params.require(:book).permit(:title, :body)
  end
end