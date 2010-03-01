class DirectoryServersController < ApplicationController

  def authenticate
    if request.post?
      begin
        d = DirectoryServer.new(params)
        if d.authenticate
          session[:bind_attrs] = ""
          session[:bind_attrs] = params
          redirect_to '/show'
        else
          flash[:notice] = "Authentication unsuccessful"
          redirect_to '/'
        end
      rescue
        flash[:notice] = "Something is particularly wrong"
        redirect_to '/'
      end
    end
  end

  def show
    begin 
      d = DirectoryServer.new(session[:bind_attrs])
      if d.authenticate
        @tldit = d.get_tree
      else
        flash[:notice] = "Authentication unsuccessful"
        redirect_to '/'
      end
    rescue
      flash[:notice] = "Something is particularly wrong"
      redirect_to '/'
    end
  end

  def get_sub_entries
    begin
      d = DirectoryServer.new(session[:bind_attrs])
      if d.authenticate
        @sub_entries = d.get_sub_entries params[:base_dn]
      end
    rescue
      flash[:notice] = "Something is particularly wrong"
      redirect_to '/show'
    end
  end
end
