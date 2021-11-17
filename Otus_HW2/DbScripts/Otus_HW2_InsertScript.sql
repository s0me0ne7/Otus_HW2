Insert into public.clients(email, first_name, last_name, second_name )
Values ( 'e.vasilenko@mail.ru', 'Евгений', 'Василенко', 'Александрович'),
('a.petrov@mail.ru', 'Александр', 'Петров', 'Николаевич'),
('s.trunov@mail.ru', 'Сергей', 'Трунов', 'Васильевич'),
('e.chamova@mail.ru', 'Елена', 'Чамова', 'Кирилловна'),
('t.marinova@mail.ru', 'Татьяна', 'Маринова', null);

Insert into public.product_type(name )
Values ('Счет в Рублях'), ('Накопительный счет в Рублях'),('Счет в Долларах'), ('Счет в Евро'), ('Накопительный счет в Долларах');

Insert into public.clientproducts(client_id, product_type_id)
Select (Select id from public.clients where email = 'e.vasilenko@mail.ru'), (Select id from public.product_type where name = 'Счет в Рублях')
Union
Select (Select id from public.clients where email = 'e.vasilenko@mail.ru'), (Select id from public.product_type where name = 'Счет в Долларах')
Union
Select (Select id from public.clients where email = 'e.chamova@mail.ru'), (Select id from public.product_type where name = 'Накопительный счет в Долларах')
Union
Select (Select id from public.clients where email = 's.trunov@mail.ru'), (Select id from public.product_type where name = 'Счет в Евро')
Union
Select (Select id from public.clients where email = 's.trunov@mail.ru'), (Select id from public.product_type where name = 'Накопительный счет в Рублях');

Insert into public.clientproduct_transactions(clientproduct_id, amount)
Select cp.id, 100
From public.clientproducts cp
	Join public.clients c on cp.client_id = c.id
	Join public.product_type pt on pt.id = cp.product_type_id
Where c.email = 'e.vasilenko@mail.ru' and pt.name = 'Счет в Рублях'
Union All
Select cp.id, 400.23
From public.clientproducts cp
	Join public.clients c on cp.client_id = c.id
	Join public.product_type pt on pt.id = cp.product_type_id
Where c.email = 'e.vasilenko@mail.ru' and pt.name = 'Счет в Долларах'
Union All
Select cp.id, 1000.8121
From public.clientproducts cp
	Join public.clients c on cp.client_id = c.id
	Join public.product_type pt on pt.id = cp.product_type_id
Where c.email = 'e.chamova@mail.ru' and pt.name = 'Накопительный счет в Долларах'
Union All
Select cp.id, -1000
From public.clientproducts cp
	Join public.clients c on cp.client_id = c.id
	Join public.product_type pt on pt.id = cp.product_type_id
Where c.email = 'e.chamova@mail.ru' and pt.name = 'Накопительный счет в Долларах'
Union All
Select cp.id, 200
From public.clientproducts cp
	Join public.clients c on cp.client_id = c.id
	Join public.product_type pt on pt.id = cp.product_type_id
Where c.email = 's.trunov@mail.ru' and pt.name = 'Счет в Евро';


