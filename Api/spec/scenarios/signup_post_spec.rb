describe "POST /signup" do

    context "novo usuario" do
        before(:all) do
            payload = {name: "patty", email: "patyy@hotmail.com", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])

            @result = Signup.new.create(payload)
        end

        it "valida status code" do 
            expect(@result.code).to eql 200
        end

        it "valida id do usuario" do 
            expect(@result.parsed_response["_id"].length).to eql 24  
        end
    end

    examples = [
        {
            title:   "usuario obrigatorio",
            payload: {name: "", email: "pedro@ig.com.br", password: "pwd123"},
            code: 412 ,
            error: "required name" 
        },
        {
            title:   "usuario obrigatorio",
            payload: {name: "pedro", email: "", password: "pwd123"},
            code: 412 ,
            error: "required email"            
        },
        {
            title:   "senha e obrigatorio",
            payload: {name: "pedro", email: "pedro@ig.com.br", password: ""},
            code: 412 ,
            error: "required password"          
        },
    ]

    examples.each do |e|
        context e[:title] do 
            before(:all) do 
                @result = Signup.new.create(e[:payload])               
            end
            it "valida status code #{e[:code]}" do 
                expect(@result.code).to eql e[:code]
            end

            it "valida mensagem de retorno #{e[:error]}" do 
                expect(@result.parsed_response["error"]).to eql e[:error]
            end
        end
    end

    context "usuario ja existe " do 
        before(:all) do 
            payload = {name: "jaao", email: "joao@ig.com.br", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])

            Signup.new.create(payload)
            @result = Signup.new.create(payload)
        end

        it "deve retornar 409" do 
            expect(@result.code).to eql 409
        end

        it "deve retornar mensagem" do 
            #parsed_response -> serve para realizar a busca dentro de rash
            expect(@result.parsed_response["error"]).to eql "Email already exists :("
        end
    end
end

