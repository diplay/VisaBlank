#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DocumentTemplate.create(name: "Загранпаспорт", template_path: "pdf_templates/foreign.pdf",
                       document_type: "foreign_passport")
DocumentTemplate.create(name: "Виза Австрия", template_path: "pdf_templates/austria.pdf",
                       document_type: "visa")
                          
company = Company.create(name: "ООО \"Рога и Копыта\"",
                        paid_before: Date.today << 1,
                        tin: "432134322",
                        address: "ул. Пушкина, д.23",
                        bank_details: "Номер счета: 12345",
                        phone: "788-08-78",
                        email: "lol@lol.lol")
manager = company.managers.create(name: "Иванов Иван")
manager.clients.create(fio: "Лолка Ваня")
User.create(email: 'roga_man', password: 'lolka', password_confirmation: 'lolka',
           role: 'manager', owner: manager, active: true)
User.create(email: 'roga', password: 'lolka', password_confirmation: 'lolka',
           role: 'company', owner: company, active: true)

company = Company.create(name: "ОАО \"Лолки\"",
                        paid_before: Date.today.next_month,
                        tin: "542334543",
                        address: "ул. Пушкина, д.24",
                        bank_details: "Номер счета: 32145",
                        phone: "728-02-74",
                        email: "lolka@lolka.lol")
manager = company.managers.create(name: "Петров Петр")
client = manager.clients.create(fio: "Супер Клиент")
client.create_visa_data(surname: "Syper",
                        surname_at_birth: "Syp",
                        name: "Client",
                        marital_status: 0)
User.create(email: 'lolka_man', password: 'lolka', password_confirmation: 'lolka',
           role: 'manager', owner: manager, active: true)
User.create(email: 'lolka', password: 'lolka', password_confirmation: 'lolka',
           role: 'company', owner: company, active: true)

User.create(email: 'admin', password: 'admin', password_confirmation: 'admin',
            role: 'admin', active: true)
