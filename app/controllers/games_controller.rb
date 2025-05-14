class GamesController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new

    puzzle_id = params[:puzzle_id]
    setup_game_session(puzzle_id) if puzzle_id.present?

    @current_guess = session[:current_game][:current_guess]
    @guesses = session[:current_game][:guesses]
    @game_status = session[:current_game][:status]
    @puzzle = Puzzle.find(session[:current_game][:puzzle_id])
    @word = Word.find(session[:current_game][:word_id])
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy!

    respond_to do |format|
      format.html { redirect_to games_path, status: :see_other, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.expect(game: [ :puzzle_id, :status ])
    end

  def setup_game_session(puzzle_id)
    puzzle = Puzzle.find(puzzle_id)

    session[:current_game] = {
      puzzle_id: puzzle.id,
      current_guess: "",
      guesses: [],
      status: "active",
      word_id: puzzle.word_id
    }
  end
end
