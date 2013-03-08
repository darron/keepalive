Admin.controllers :sites do

  get :index do
    @sites = Sites.all
    render 'sites/index'
  end

  get :new do
    @sites = Sites.new
    render 'sites/new'
  end

  post :create do
    @sites = Sites.new(params[:sites])
    if @sites.save
      flash[:notice] = 'Sites was successfully created.'
      redirect url(:sites, :edit, :id => @sites.id)
    else
      render 'sites/new'
    end
  end

  get :edit, :with => :id do
    @sites = Sites.get(params[:id])
    render 'sites/edit'
  end

  put :update, :with => :id do
    @sites = Sites.get(params[:id])
    if @sites.update(params[:sites])
      flash[:notice] = 'Sites was successfully updated.'
      redirect url(:sites, :edit, :id => @sites.id)
    else
      render 'sites/edit'
    end
  end

  delete :destroy, :with => :id do
    sites = Sites.get(params[:id])
    if sites.destroy
      flash[:notice] = 'Sites was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Sites!'
    end
    redirect url(:sites, :index)
  end
end
