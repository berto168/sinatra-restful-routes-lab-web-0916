class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipes/index'
  end

  get '/recipes/new' do
    erb :'/recipes/new'
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :'/recipes/edit'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    Recipe.destroy(params[:id])
    redirect ('/recipes')
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :'/recipes/show'
  end

end
