Rails.application.routes.draw do

  devise_for :users
  root :to =>"homes#top"

# resources メソッドは、ルーティングを一括して自動生成してくれる機能
# onlyオプションを使用することで、生成するルーティングを限定することができます。この場合、only の後に配列で記述されている"new","index","show"のアクション以外は、ルーティングが行われません。
# 今回、画像投稿には、「新規投稿」「一覧」「詳細機能」「削除」しか使わないため不要なルーティングが実行されないようにonlyを設定します。
  get '/home/about', to: 'homes#about', as: 'about'

  resources :books
  resources :users, only: [:index, :show, :edit, :update, :create]
end