class Api::V1::MaterialsController < ApplicationController
  before_action :set_material, only: %i[ show update destroy book ]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all
    render json: @materials
  end

  def findByIds
    #@materials = Material.where(id: material_find_params)
    @materials = Material.find(material_find_params)
    render json: @materials
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)

    if @material.save
      render json: @material, status: :created, location: api_v1_material_url(@material)
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    if @material.update(material_params)
      render :show, status: :ok, location: @material
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
  end

  def book
    if @material.update(quantity: @material.quantity.to_i - material_params['quantity'])
      render json: {result: 'ok'}, status: :ok
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_params
      params.require(:material).permit(:name, :quantity)
    end

  def material_find_params
    params.require(:ids)
  end
end
