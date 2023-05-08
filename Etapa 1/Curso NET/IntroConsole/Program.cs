using System;

namespace Caja
{
    class Program
    {
        static void Main(string[] args)
        {
            
            int[] b20 = new int[10];
            int[] b50 = new int [10];
            int[] b100 = new int [10];
            int[] b200 = new int [10];
            int[] b500 = new int [10];
            int[] m1 = new int [10];
            int[] m5 = new int [10];
            int[] m10 = new int [10];
            int[] ret = new int [10];
            int[] tb = new int [10];
            int [] tm = new int [10];
            int opcion = 0;
            int r = 0;

        do{
            do
            {
                Console.WriteLine("Banco CDIS\n");
                Console.WriteLine("Elija una de las opciones: \n");
                Console.WriteLine("1.-Ingresar la cantidad de retiros hechos por los usuarios");
                Console.WriteLine("2.-Revisar la cantidad entregada de billetes y monedas\n");
                string opc = Console.ReadLine();
                if (!int.TryParse(opc, out opcion))
                {
                    Console.WriteLine("Ingrese una opción válida");
                    continue;
                }
                if (opcion < 1 || opcion > 2)
                {
                    Console.WriteLine("Ingrese una opción válida");
                }

            } while (opcion < 1 || opcion > 2);

            Console.Clear();
            
            if(opcion == 1)
                {
                    do{
                        Console.WriteLine("¿Cuántos retiros se hicieron (max 10)?");
                        string retiros = Console.ReadLine();
                        r = int.Parse(retiros);

                } while (r < 1 || r > 10);

                for(int i=0; i<=r; i++)
                    {
                        Console.WriteLine("Ingresa la cantidad del retiro #"+(i+1), ":");
                        ret[i] = int.Parse(Console.ReadLine());
                    
                    while(ret[i] >= 500)
                            {
                                ret[i] = ret[i] - 500;
                                b500[i]++;
                                tb[i]++;
                            }
                        while(ret[i] >= 200)
                            {
                                ret[i] = ret[i] - 200;
                                b200[i]++;
                                tb[i]++;
                            }
                        while(ret[i] >= 100)
                            {
                                ret[i] = ret[i] - 100;
                                b100[i]++;
                                tb[i]++;
                            }

                        while(ret[i] >= 50)
                            {
                                ret[i] = ret[i] - 50;
                                b50[i]++;
                                tb[i]++;
                            }
                        
                        while(ret[i] >= 20)
                            {
                                ret[i] = ret[i] - 20;
                                b20[i]++;
                                tb[i]++;
                            }
                        
                        while(ret[i] >= 10)
                            {
                                ret[i] = ret[i] - 10;
                                m10[i]++;
                                tm[i]++;
                            }
                        
                        while(ret[i] >= 5)
                            {
                                ret[i] = ret[i] - 5;
                                m5[i]++;
                                tm[i]++;
                            }

                        while(ret[i] >= 1)
                            {
                                ret[i] = ret[i] - 1;
                                m1[i]++;
                                tm[i]++;
                            }
                        
                    Console.WriteLine("Retiro realizado con éxito");
                    
                    }
            }
            

                if(opcion == 2){
                    
                    for(int i=0; i<=r; i++)
                    {
                        Console.WriteLine("Retiro #"+ (i+1), ": ");
                        Console.WriteLine("Monto: "+ret[i]);
                        
                        Console.WriteLine("Billetes entregados: "+ tb[i]);
                        Console.WriteLine("Monedas entregadas: "+ tm[i], "\n");
                        if(b500[i] !=0)
                        {
                            Console.WriteLine("Cantidad de billetes de 500: "+ b500[i], "\n");
                        }
                            
                        if(b200[i] !=0)
                        {
                            Console.WriteLine("Cantidad de billetes de 200: "+ b200[i], "\n");
                        }

                        if(b100[i] !=0)
                        {
                            Console.WriteLine("Cantidad de billetes de 100: "+ b100[i], "\n");
                        }
                        if(b50[i] !=0)
                        {
                        Console.WriteLine("Cantidad de billetes de 50: "+ b50[i], "\n"); 
                        }

                        if(b20[i] !=0)
                        {
                            Console.WriteLine("Cantidad de billetes de 20: "+ b20[i], "\n");
                        }

                        if(m10[i] !=0)
                        {
                        Console.WriteLine("Cantidad de monedas de 10: "+ m10[i], "\n");  
                        }

                        if(m5[i] !=0)
                        {
                            Console.WriteLine("Cantidad de monedas de 5: "+ m5[i], "\n");
                        }

                        if(m1[i] !=0)
                        {
                            Console.WriteLine("Cantidad de monedas de 1: "+ m1[i], "\n");
                        }
                        
                    }
                    
               
                }
             } while(opcion !=0);
        }
    }
}


