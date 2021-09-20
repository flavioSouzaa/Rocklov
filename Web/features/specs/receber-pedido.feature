#language: pt

Funcionalidade: Receber pedido de locação
    Sendo um anúnciante que possui equipamentos cadastrados
    Desenjo receber pedidos de locação
    Para que eu possa decidir se quero aprova-los ou rejeita-los

    @receber_predido
    Cenario: Receber pedido

        Dado que meu perfil de anunciante é "joao@anunciante.com" e "pwd123"
            E que eu tenho o seguinte equipamento cadastrado:
            | thumb     | trompete.jpg |
            | nome      | trompete     |
            | categoria | Outros       |
            | preco     | 100          |
            E acesso meu Dashboard
        Quando "maria@locataria.com" e "pwd123" solicita a locação desse equipo
        Então devo ver a seguinte mensagem: 
        """
        maria@locataria.com deseja alugar o equipamento: trompete em: DATA_ATUAL
        """
        E deve ver os links: "ACEITAR" e "REJEITAR" no pedido 