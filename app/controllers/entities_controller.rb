class EntitiesController < ApplicationController

	def create
		entity = Entity.where(entity_type: entity_params[:entity_type], identifier: entity_params[:identifier])
		               .first_or_initialize

		entity.tags = entity_params[:tags]

		if entity.save
			render json: { message: :ok }
		else
			render json: { errors: entity.errors }
		end		               
	end

	def show
		entity = Entity.find_by(entity_type: params[:entity_type], identifier: params[:entity_id])

		render json: { entity: entity }
	end

	def destroy
		entity = Entity.find_by(entity_type: params[:entity_type], identifier: params[:entity_id])

		entity.delete
		render json: { message: 'ok' }
	end

	def stats
		tags = Entity.all.flat_map(&:tags).group_by { |tag| tag }
										 .map { |key, val| { tag: key, count: val.length } }

		render json: { tags: tags }
	end

	def entity_stats
		entity = Entity.find_by(entity_type: params[:entity_type], identifier: params[:entity_id])

		if entity.present?
			tags = Entity.all.flat_map(&:tags).select {|tag| entity.tags.include?(tag) }
											 .group_by { |tag| tag }
											 .map { |key, val| { tag: key, count: val.length } }

			render json: { tags: tags }
		else
			render json: { message: 'not found' }
		end

	end

	private

	def entity_params
		params.require(:entity).permit(:entity_type,
																	 :identifier,
																	 tags: [])
	end
end