class ContactsController < ApplicationController
  def new
    @contact = current_csp.nursery.contacts.build
    @contact.email = current_csp.nursery.email
  end

  def create
    @contact = current_csp.nursery.contacts.build(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: t("notice.created") }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :title, :content)
    end
end
