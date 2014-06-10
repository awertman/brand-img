module FilterHelper

def add_filter
    @filters = session[:filters].push(params[:id])
    @filters = session[:filters] if session[:filters].uniq!
    @brand = Brand.find_by(id: session[:brand])
  end

  def remove_filter
    session[:filters].reject! {|filter| filter == params[:id]}
    @filters = session[:filters]
    @brand = Brand.find_by(id: session[:brand])
  end

end