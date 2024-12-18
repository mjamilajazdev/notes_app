# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :find_note, only: [:edit, :update, :show, :destroy]

  def index
    @notes = Note.all
  end
  
  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    if @note
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @note.save(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render :unprocessable_entity
    end
  end

  def destroy
    if @note
      @note.destroy
    end
  end

  def note_params
    params.require.permit(:id, :name, :description)
  end

  def find_note
    @note = Note.find(note_params[:id])
  end
end