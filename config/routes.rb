Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  root to: "prototypes#index"

  def index
    # すべてのプロトタイプを取得
    @prototypes = Prototype.all.includes(:user, image_attachment: :blob)
  end

  resources :prototypes, only: [:new, :create, :show, :edit , :update , :destroy]
  
  resources :prototypes do
    resources :comments, only: :create
  end
end
