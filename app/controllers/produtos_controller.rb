class ProdutosController < ApplicationController

    def index
        @produtos = Produto.order(preco: :desc)
        @produtos_desconto = Produto.order(:preco).limit(1)
    end

    def new
        @produto = Produto.new
    end

    def create
        dados = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
        @produto = Produto.new dados
        
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to root_path
        else 
            render :new
        end
    end

    def destroy
        id = params[:id]
        Produto.destroy id
        redirect_to root_path
    end

    def search
        @nome = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{@nome}%"
    end
end

