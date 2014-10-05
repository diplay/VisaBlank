#coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DocumentTemplate.create(name: "Загранпаспорт", template_path: "#{Rails.root}/public/pdf_templates/foreign.pdf",
                document_type: "foreign_passport")
DocumentTemplate.create(name: "Виза Австрия", template_path: "#{Rails.root}/public/pdf_templates/austria.pdf",
                document_type: "visa",
		description:"info_austria.txt")
DocumentTemplate.create(name: "Виза Дания", template_path: "#{Rails.root}/public/pdf_templates/dania.pdf",
               		document_type: "visa",
			description: "бельinfo_dania.html")
DocumentTemplate.create(name: "Виза Латвия", template_path: "#{Rails.root}/public/pdf_templates/latvia.pdf",
                       document_type: "visa",
			description: "info_latvia.html")
DocumentTemplate.create(name: "Виза Литва", template_path: "#{Rails.root}/public/pdf_templates/litva.pdf",
                       document_type: "visa",
			description: "info_litva.html")
DocumentTemplate.create(name: "Виза Швеция", template_path: "#{Rails.root}/public/pdf_templates/shvecia.pdf",
                       document_type: "visa",
			description: "info_shvecia.html")
DocumentTemplate.create(name: "Виза Мальта", template_path: "#{Rails.root}/public/pdf_templates/malta.pdf",
                       document_type: "visa",
			description: "info_malta.html")
DocumentTemplate.create(name: "Виза Исландия", template_path: "#{Rails.root}/public/pdf_templates/iseland.pdf",
               	document_type: "visa",
	      	description: "info_iseland.html")
DocumentTemplate.create(name: "Виза Италия", template_path: "#{Rails.root}/public/pdf_templates/italy.pdftodo",
               	document_type: "visa",
	      	description: "info_italy.html")
DocumentTemplate.create(name: "Виза Люксимбург", template_path: "#{Rails.root}/public/pdf_templates/luxemburg.pdf",
               	document_type: "visa",
	      	description: "info_luxemburg.html")
DocumentTemplate.create(name: "Виза Нидерланды", template_path: "#{Rails.root}/public/pdf_templates/niderland.pdf",
               	document_type: "visa",
	      	description: "info_niderland.html")
DocumentTemplate.create(name: "Виза Испания", template_path: "#{Rails.root}/public/pdf_templates/spain.pdftodo",
               	document_type: "visa",
	      	description: "info_spain.html")
DocumentTemplate.create(name: "Виза Бельгия", template_path: "#{Rails.root}/public/pdf_templates/belgia.pdf",
               	document_type: "visa",
	      	description: "info_belgia.html")
DocumentTemplate.create(name: "Виза Франция", template_path: "#{Rails.root}/public/pdf_templates/france.pdf",
               	document_type: "visa",
	      	description: "info_france.htmltodo")
DocumentTemplate.create(name: "Виза Германия", template_path: "#{Rails.root}/public/pdf_templates/germany.pdf",
               	document_type: "visa",
	      	description: "info_germany.html")
DocumentTemplate.create(name: "Виза Карибские Нидерланды", template_path: "#{Rails.root}/public/pdf_templates/niderland_karibian.pdf",
               	document_type: "visa",
	      	description: "info_niderland_karibian.html")
DocumentTemplate.create(name: "Виза Греция", template_path: "#{Rails.root}/public/pdf_templates/greece.pdf",
               	document_type: "visa",
	      	description: "info_greece.html")
DocumentTemplate.create(name: "Виза Норвегия", template_path: "#{Rails.root}/public/pdf_templates/norvegia.pdf",
               	document_type: "visa",
	      	description: "info_norvegia.html")
DocumentTemplate.create(name: "Виза Португалия", template_path: "#{Rails.root}/public/pdf_templates/portugaly.pdf",
               	document_type: "visa",
	      	description: "info_portugaly.html")
DocumentTemplate.create(name: "Виза Венгрия", template_path: "#{Rails.root}/public/pdf_templates/vengria.pdf",
               	document_type: "visa",
	      	description: "info_vengria.html")
DocumentTemplate.create(name: "Виза Польша", template_path: "#{Rails.root}/public/pdf_templates/poland.pdftodo",
               	document_type: "visa",
	      	description: "info_poland.html")
DocumentTemplate.create(name: "Виза Словения", template_path: "#{Rails.root}/public/pdf_templates/slovenia.pdftodo",
               	document_type: "visa",
	      	description: "info_slovenia.html")


company = Company.create(name: "ООО \"Рога и Копыта\"",
                        paid_before: Date.today << 1,
                        tin: "432134322",
                        address: "ул. Пушкина, д.23",
                        bank_details: "Номер счета: 12345",
                        phone: "788-08-78",
                        email: "lol@lol.lol",
                        repr_i: "Иван И.И.",
                        repr_r: "Ивана И.И.")
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
                        email: "lolka@lolka.lol",
                        repr_i: "Иван И.И.",
                        repr_r: "Ивана И.И.")
manager = company.managers.create(name: "Петров Петр")
manager.clients.create(fio: "Супер Клиент")
User.create(email: 'lolka_man', password: 'lolka', password_confirmation: 'lolka',
           role: 'manager', owner: manager, active: true)
User.create(email: 'lolka', password: 'lolka', password_confirmation: 'lolka',
           role: 'company', owner: company, active: true)

User.create(email: 'admin', password: 'admin', password_confirmation: 'admin',
            role: 'admin', active: true)
