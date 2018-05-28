class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
  end

  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_path
  end

  def create
    @note = Note.new(notes_params)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def update
    @note = Note.find(params[:id])
    if @notes.update(notes_params)
      redirect_to notes_path
    else
      render :edit
    end
  end
  
  private

    def notes_params
      params.require(:note).permit(:title, :msg)
    end
end
