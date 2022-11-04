require 'dry/schema'
class Api::V1::MaterialsController < ApplicationController
  before_action :set_material, only: %i[ show update destroy book ]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all.map{|m| {
      "id": m.id,
      "name": m.name,
      "quantity": m.quantity
    }}
    render json: @materials
  end

  def findByIds
    validation = FindMaterialsSchema.call(params.as_json)
    if (validation.success?)
      materials = params.as_json["materials"]
      materialsIds = materials.collect { |m| m['id'] }
      @materials = Material.find(materialsIds)
                         .map{|m| {
                           id: m.id,
                           providers: [
                             {provider_id: rand(1..10), "delivery_date":  Date.parse(rand(Time.now .. 1.year.from_now).to_s) },
                             {provider_id: rand(1..10), "delivery_date":  Date.parse(rand(Time.now .. 1.year.from_now).to_s)}
                           ]
                         }}
      render json: @materials
    else
      render json: validation.errors.to_h.inspect, status: 400
    end
  #
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
    if (!book_validations)
      return
    end

    if @material.update(quantity: @material.quantity.to_i - book_materials_param['quantity'])
      render json: {result: 'ok'}, status: :ok
    else
      render json: @material.errors, status: :unprocessable_entity
    end
  end

  private

  def book_validations

    if (!book_materials_param["delivery_limit_date"].present?)
      render json: {error: 'delivery_limit_date is required'}, status: 400
      return false
    end

    if (!book_materials_param["id"].present?)
      render json: {error: 'Material id is required'}, status: 400
      return false
    end

    if (!book_materials_param["quantity"].present?)
      render json: {error: 'quantity is required'}, status: 400
      return false
    end

    true

  end
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def material_params
      params.require(:material).permit(:name, :quantity)
    end

  def book_materials_param
    params.permit(:id, :quantity, :delivery_limit_date)
  end

  def material_find_params
    params.require(:ids)
  end

  FindMaterialsSchema = Dry::Schema.JSON do
    required(:materials).array(:hash) do
      required(:id).value(:integer)
      required(:quantity).value(:integer)
    end
  end
end
