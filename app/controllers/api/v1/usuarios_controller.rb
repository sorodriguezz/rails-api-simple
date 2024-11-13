module Api
  module V1
    class UsuariosController < ApplicationController
      def index
        usuarios = Usuario.all
        render json: usuarios
      end

      def show
        usuario = Usuario.find(params[:id])
        render json: usuario
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Usuario no encontrado" }, status: :not_found
      end

      def create
        usuario = Usuario.new(usuario_params)
        if usuario.save
          render json: usuario, status: :created
        else
          render json: usuario.errors, status: :unprocessable_entity
        end
      end

      def update
        usuario = Usuario.find(params[:id])
        if usuario.update(usuario_params)
          render json: usuario
        else
          render json: usuario.errors, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Usuario no encontrado" }, status: :not_found
      end

      def destroy
        usuario = Usuario.find(params[:id])
        usuario.destroy
        render json: { message: "Usuario eliminado" }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Usuario no encontrado" }, status: :not_found
      end

      private

      def usuario_params
        params.require(:usuario).permit(:nombre, :email)
      end
    end
  end
end
