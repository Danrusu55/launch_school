contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

[:email, :address, :phone].each do |k|
  contact_data.push(k)
end

p contact_data
p contacts
