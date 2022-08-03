namespace :import do
    desc "import invoice, invoice items, items, merchants, and transactions data from CSV to database"
    task all:[:merchants, :items, :customers, :invoices, :invoice_items, :transactions, :reset] do 
       
    end
end