json.extract! company, :id, :name, :representative_title, :representative_name, :post, :address, :house_number, :address2, :tel, :fax, :email, :invoice_number, :created_at, :updated_at
json.url company_url(company, format: :json)
