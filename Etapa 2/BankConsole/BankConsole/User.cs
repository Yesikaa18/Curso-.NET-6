using Newtonsoft.Json;

namespace BankConsole;

public class User : IPerson
{
    [JsonProperty]
    protected int ID { get; set;}
    [JsonProperty]
    protected string Name { get; set; }
    [JsonProperty]
    protected string Email {get; set; }
    [JsonProperty]
    public decimal Balance {get; set; }
    [JsonProperty]
    protected DateTime RegisterDate {get; set; }
    public User(int ID, string Name, string Email, decimal Balance)
    {
        this.ID = ID;
        this.Name = Name;
        this.Email = Email;
        this.Balance = Balance;
        this.RegisterDate = DateTime.Now;
    }

    public int GetID()
    {
        return ID;
    }

    public DateTime GetRegisterDate()
    {
        return RegisterDate;
    }
    public User()
    {

    }

  

    public virtual void SetBalance(decimal amount)
    {
        decimal quantity = 0;
        if (amount < 0)
            quantity = 0;
        else
        quantity = amount;

        this.Balance += quantity;
    }
    public virtual string ShowData()
    {
        return $"ID: {this.ID}, Nombre: {this.Name}, Correo: {this.Email}, Saldo: {this.Balance}, Fecha de registro: {this.RegisterDate}";

    }

    public string ShowData(string initialMessage)
    {
        return $"{initialMessage} -> Nombre: {this.Name}, Correo: {this.Email}, Saldo: {this.Balance}, Fecha de registro: {this.RegisterDate}";
    }

    public string GetName()
    {
        return Name;
    }

    public string GetCountry()
    {
        return "México";
    }

     public static bool IsIDValid(int ID)
        {
            return ID > 0;
        }

        public static bool IsIDUnique(int ID)
        {
            return users.Find(u => u.GetID() == ID) == null;
        }

        public static bool IsEmailValid(string email)
        {
            
            string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, pattern);
        }

        public static bool IsBalanceValid(decimal balance)
        {
            return balance >= 0;
        }
    }
}