class Produto < ApplicationRecord
    validates :nome, presence: true,  length: { in: 3..200 }
    validates :descricao, presence: true, length: { in: 5..200 } 
    validates :preco, presence: true
    validates :quantidade, presence: true, numericality: { only_integer: true }
end
