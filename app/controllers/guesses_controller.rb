class GuessesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_guess, only: %i[ show edit update destroy ]

  # GET /guesses or /guesses.json
  def index
    @guesses = Guess.all
  end

  # GET /guesses/1 or /guesses/1.json
  def show
  end

  # GET /guesses/new
  def new
    @guess = Guess.new
  end

  # GET /guesses/1/edit
  def edit
  end

  # POST /guesses or /guesses.json
  def create
    @guess = Guess.new(guess_params)

    respond_to do |format|
      if @guess.save
        format.html { redirect_to @guess, notice: "Guess was successfully created." }
        format.json { render :show, status: :created, location: @guess }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guess.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guesses/1 or /guesses/1.json
  def update
    respond_to do |format|
      if @guess.update(guess_params)
        format.html { redirect_to @guess, notice: "Guess was successfully updated." }
        format.json { render :show, status: :ok, location: @guess }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guesses/1 or /guesses/1.json
  def destroy
    @guess.destroy!

    respond_to do |format|
      format.html { redirect_to guesses_path, status: :see_other, notice: "Guess was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guess
      @guess = Guess.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def guess_params
      params.expect(guess: [ :game_id, :value, :guess_number ])
    end
end
