class FruitsController < ApplicationController
  before_action  only: [:show, :edit, :update, :destroy]

  # GET /fruits
  # GET /fruits.json
  def index
    @fruits = Fruit.all
    @vegetable = Vegetable.new
  end

  # GET /fruits/1
  # GET /fruits/1.json
  def show
  end

  # GET /fruits/new
  def new
    @fruit = Fruit.new
  end

  # GET /fruits/1/edit
  def edit
  end

  # POST /fruits
  # POST /fruits.json
  def create
    @fruit = Fruit.new(fruit_params)

    respond_to do |format|
      if @fruit.save
        format.html { redirect_to @fruit, notice: 'Fruit was successfully created.' }
        format.json { render :show, status: :created, location: @fruit }
      else
        format.html { render :new }
        format.json { render json: @fruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fruits/1
  # PATCH/PUT /fruits/1.json
  def update
    respond_to do |format|
      if @fruit.update(fruit_params)
        format.html { redirect_to @fruit, notice: 'Fruit was successfully updated.' }
        format.json { render :show, status: :ok, location: @fruit }
      else
        format.html { render :edit }
        format.json { render json: @fruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fruits/1
  # DELETE /fruits/1.json
  def destroy
    @fruit.destroy
    respond_to do |format|
      format.html { redirect_to fruits_url, notice: 'Fruit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def content #ここでフロントから送られてきたデータを処理して戻しているデバックで何か確認したかったらpry-rails入れてあるのでこの下にbingind.pryはさんでparamsとか打てば何が送られているかわかる
    @content = Fruit.find(fruit_params[:id]).content
    render json: {:content => @content}#あと気を付けるのはデータを返す時にハッシュの形にしといたほうが扱いやすいかなってくらいjsonって形式じゃないとJSがデータを認識しないのでrender json:っていうのはお作法だと思ってください
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def fruit_params
      params.require(:fruit).permit(:content)
    end

    def fruit_params
      params.require(:fruit).permit(:id)
    end
end
