class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end


  def edit
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.created_at = Time.now
    if @contact.save
      redirect_to contacts_url, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  def new
    @contact = Contact.new
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :notes)
    end
end
