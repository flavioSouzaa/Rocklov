Dado("que acesso a página de cadastro") do
  @signup.open
end

Quando("submeto o seguinte formulário de cadastro") do |table|
  user = table.hashes.first

  MongoDB.new.remove_user(user[:email])

  @signup.create(user)
end
