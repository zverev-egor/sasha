class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]
  before_action :only_for_admin, only: [:edit, :update, :destroy, :create]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/new

  def new
    if Contact.count==0
      @contact = Contact.new
    else
      redirect_to contacts_path
    end
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    if Contact.count==0
      @contact = Contact.new(contact_params)
      if @contact.save
        flash[:success] = 'Контакты созданны.'
        redirect_to contacts_path
      else
        render :new
      end
    else
      redirect_to contacts_path
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.update(contact_params)
      flash[:success] = 'Контакты изменены'
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      flash[:success] = 'Кнтакты удалены.'
      format.html { redirect_to contacts_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:description)
    end
end
