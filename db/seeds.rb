#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

company = Company.create(name: "ООО \"Рога и Копыта\"",
                        paid_before: Date.today.next_month,
                        tin: "432134322",
                        address: "ул. Пушкина, д.23",
                        bank_details: "Номер счета: 12345",
                        phone: "788-08-78",
                        email: "lol@lol.lol")
manager = company.managers.create(name: "Иванов Иван")
manager.clients.create(fio: "Лолка Ваня")
User.create(login: 'roga_man', password: 'lolka', password_confirmation: 'lolka',
           role: 'manager', owner: manager)
User.create(login: 'roga', password: 'lolka', password_confirmation: 'lolka',
           role: 'company', owner: company)

company = Company.create(name: "ОАО \"Лолки\"",
                        paid_before: Date.today.next_month,
                        tin: "542334543",
                        address: "ул. Пушкина, д.24",
                        bank_details: "Номер счета: 32145",
                        phone: "728-02-74",
                        email: "lolka@lolka.lol")
manager = company.managers.create(name: "Петров Петр")
manager.clients.create(fio: "Супер Клиент")
User.create(login: 'lolka_man', password: 'lolka', password_confirmation: 'lolka',
           role: 'manager', owner: manager)
User.create(login: 'lolka', password: 'lolka', password_confirmation: 'lolka',
           role: 'company', owner: company)

User.create(login: 'admin', password: 'admin', password_confirmation: 'admin',
            role: 'admin')
