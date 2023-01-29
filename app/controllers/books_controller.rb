class BooksController < ApplicationController
  # before_action :is_matching_login_user, only: [:edit, :update]

  def index
    # Book.allはテーブルに保存されたデータを全取得する
    @book = Book.new
    @books = Book.all
    @user = current_user

  end

  def create
# 投稿データの保存
    @book = Book.new(book_params)
# current_user.id : 今ログインしているユーザーのIDを表示
# current_user.name : 今ログインしているユーザーの名前を表示
# current_user.email : 今ログインしているユーザーのメールアドレスを表示
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    # @book.user：本の持ち主
    @user = @book.user
    # ユーザーが持っている本すべて
    @books = @user.books
    # @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  # 投稿データのストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  # def is_matching_login_user
  #   user_id = params[:id].to_i
  #   unless user_id == current_user.id
  #     redirect_to book_path(book.id)
  #   end
  # end
end