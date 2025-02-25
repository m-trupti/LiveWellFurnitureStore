using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace LiveWell
{
    public class ProductRepository
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["FurnitureStoreDB"].ConnectionString;

        public IEnumerable<Product> GetProducts()
        {
            var products = new List<Product>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Products";

                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        products.Add(new Product
                        {
                            ProductId = (int)reader["ProductId"],
                            ProductName = (string)reader["ProductName"],
                            Description = (string)reader["Description"],
                            Price = (decimal)reader["Price"],
                            ImageUrl = (string)reader["ImageUrl"]
                        });
                    }
                }
            }

            return products;
        }

        public Product GetProductByName(string productName)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Products WHERE ProductName = @ProductName";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@ProductName", productName);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return new Product
                        {
                            ProductId = (int)reader["ProductId"],
                            ProductName = (string)reader["ProductName"],
                            Description = (string)reader["Description"],
                            Price = (decimal)reader["Price"],
                            ImageUrl = (string)reader["ImageUrl"]
                        };
                    }
                }
            }

            return null;
        }
        public Product GetProductById(int productId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT ProductId, ProductName, Description, Price, ImageUrl FROM Products WHERE ProductId = @ProductId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        return new Product
                        {
                            ProductId = (int)reader["ProductId"],
                            ProductName = reader["ProductName"].ToString(),
                            Description = reader["Description"].ToString(),
                            Price = (decimal)reader["Price"],
                            ImageUrl = reader["ImageUrl"].ToString()
                        };
                    }
                }
            }
            return null;
        }
    }
}
