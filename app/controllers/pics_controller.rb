class PicsController < ApplicationController
  def index
    @pics = Pic.all

    render("pics/index.html.erb")
  end

  def show
    @pic = Pic.find(params[:id])

    render("pics/show.html.erb")
  end

  def new
    @pic = Pic.new

    render("pics/new.html.erb")
  end

  def create
    @pic = Pic.new

    @pic.review_id = params[:review_id]
    @pic.image_url = params[:image_url]

    save_status = @pic.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pics/new", "/create_pic"
        redirect_to("/pics")
      else
        redirect_back(:fallback_location => "/", :notice => "Pic created successfully.")
      end
    else
      render("pics/new.html.erb")
    end
  end

  def edit
    @pic = Pic.find(params[:id])

    render("pics/edit.html.erb")
  end

  def update
    @pic = Pic.find(params[:id])

    @pic.review_id = params[:review_id]
    @pic.image_url = params[:image_url]

    save_status = @pic.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pics/#{@pic.id}/edit", "/update_pic"
        redirect_to("/pics/#{@pic.id}", :notice => "Pic updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Pic updated successfully.")
      end
    else
      render("pics/edit.html.erb")
    end
  end

  def destroy
    @pic = Pic.find(params[:id])

    @pic.destroy

    if URI(request.referer).path == "/pics/#{@pic.id}"
      redirect_to("/", :notice => "Pic deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Pic deleted.")
    end
  end
end
