#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo usário cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizar para locação

    Contexto: Login
        * Login com "betao@hotmail.com" e "pwd123"

    Cenario: Novo equipo

        Dado que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard

    @tentativa_cadastro_anuncio
    Esquema do Cenario: Tentativa de cadastro de anúncios

        Dado que acesso o formulario de cadastro de anúncios
            E que eu tenho o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"

        Exemplos:
            | foto          | nome            | categoria | preco | saida                                |
            |               | violao de Nylon | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                 | Outros    | 250   | Informe a descrição do anúncio!      |
            | clarinete.jpg | Microfone       |           | 250   | Informe a categoria                  |
            | clarinete.jpg | Microfone       | Outros    |       | Informe o valor da diária            |
            | violino.jpg   | violino         | Outros    | ABC   | O valor da diária deve ser numérico! |
            | violino.jpg   | violino         | Outros    | 100a  | O valor da diária deve ser numérico! |
