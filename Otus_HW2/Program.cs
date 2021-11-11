using Npgsql;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace Otus_HW2
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {

                PrintClients();
                PrintProductTypes();
                PrintClientProducts();

                Console.WriteLine("\r\nДобавить клиенту новый продукт?(Y/N)");
                var conscommand = Console.ReadLine();
                if (conscommand == "y")
                {
                    ClientProductsAdd();
                    Console.ReadKey();
                }
                Console.Clear();
                }
        }
        
        static void PrintClients()
        {
            BaseContext db = new BaseContext();

            var clients = db.Clients.ToList();
            Console.WriteLine("\r\nСписок клиентов:");
            Console.WriteLine("id.ФИО - Почта");
            foreach (Clients u in clients)
            {
                Console.WriteLine($"{u.Id}.{u.LastName} {u.FirstName} {u.SecondName} - {u.Email}");
            }
        }

        static void PrintProductTypes()
        {
            BaseContext db = new BaseContext();

            var producttypes = db.ProductTypes.ToList();
            Console.WriteLine("\r\nТипы банковских продуктов list:");
            Console.WriteLine("id.Продукт");
            foreach (ProductTypes u in producttypes)
            {
                Console.WriteLine($"{u.Id}.{u.Name}");
            }
        }

        static void PrintClientProducts()
        {
            BaseContext db = new BaseContext();

            var clientproducts = db.ClientProducts.ToList();
            Console.WriteLine("\r\nПродукты клиента:");
            Console.WriteLine("id.Id Клиента - Id Продукта");
            foreach (ClientProducts u in clientproducts)
            {
                Console.WriteLine($"{u.Id}.{u.ClientId} - {u.ProductTypeId}");
            }
        }

        static void ClientProductsAdd()
        {
            BaseContext db = new BaseContext();

            Console.WriteLine("\r\nВведите Id Клиента:");
            var client = Console.ReadLine();

            Console.WriteLine("\r\nВведите Id Продукта:");
            var product = Console.ReadLine();

            if (long.TryParse(client,out long clientid) && int.TryParse(product,out int productid))
            {
                ClientProducts clientProducts = new ClientProducts { ClientId = clientid, ProductTypeId = productid };
                db.ClientProducts.Add(clientProducts);
                db.SaveChanges();
                Console.WriteLine("Объекты успешно сохранены");
            }
            else
            {
                Console.WriteLine("Данные введены некорректно, попробуйте еще раз");
            }
        }


    }
}
