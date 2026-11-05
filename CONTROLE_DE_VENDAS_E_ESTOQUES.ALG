Algoritmo "Controle_De_Vendas_e_Estoques"

Var

   codigo: vetor[1..5] de inteiro
   nome: vetor[1..5] de caractere
   preco: vetor[1..5] de real
   estoque: vetor[1..5] de inteiro

   vendasDia: vetor[1..5,1..3] de inteiro


   quantidadeVenda: vetor[1..500] de inteiro
   valorVenda: vetor[1..500] de real
   codigoVenda: vetor[1..500] de inteiro

   i, j: inteiro
   opcao: inteiro
   codigoInformado: inteiro
   quantidade: inteiro
   dia: inteiro
   indice: inteiro
   totalVendas: inteiro
   totalUnidades: inteiro
   totalGeral: inteiro
   vendasPorProduto: inteiro

   valorTotal: real
   valorFinal: real
   mediaVendas: real

   cadastrado: logico

Inicio

   cadastrado <- falso
   totalVendas <- 0
   totalUnidades <- 0
   valorTotal <- 0


   para i de 1 ate 5 faca
      para j de 1 ate 3 faca
         vendasDia[i,j] <- 0
      fimpara
   fimpara


   enquanto opcao <> 6 faca

      escreval("")
      escreval("================================")
      escreval("       SISTEMA DA LOJA")
      escreval("================================")
      escreval("1 - Cadastrar produtos")
      escreval("2 - Registrar vendas")
      escreval("3 - Consultar estoque")
      escreval("4 - Relatorio de vendas")
      escreval("5 - Relatorio geral")
      escreval("6 - Sair")
      escreval("================================")
      escreva("Escolha uma opcao: ")
      leia(opcao)

      escolha opcao


         caso 1

           se cadastrado = falso entao

               para i de 1 ate 5 faca

                  escreval("")
                  escreval("CADASTRO DO PRODUTO ", i)

                  codigo[i] <- i

                  escreva("Nome do produto: ")
                  leia(nome[i])

                  escreva("Preco unitario: ")
                  leia(preco[i])

                  escreva("Quantidade em estoque: ")
                  leia(estoque[i])

               fimpara

               cadastrado <- verdadeiro

               escreval("")
               escreval("Produtos cadastrados com sucesso!")

            senao

               escreval("Os produtos ja foram cadastrados!")

            fimse


         caso 2

            se cadastrado = verdadeiro entao

               escreval("")
               escreva("Informe o codigo do produto: ")
               leia(codigoInformado)

               indice <- 0

               para i de 1 ate 5 faca

                  se codigo[i] = codigoInformado entao
                     indice <- i
                  fimse

               fimpara

               se indice <> 0 entao

                  escreval("Produto: ", nome[indice])
                  escreval("Estoque disponivel: ", estoque[indice])

                  escreva("Quantidade desejada: ")
                  leia(quantidade)

                  se quantidade > 0 entao

                     se quantidade <= estoque[indice] entao

                        escreval("Informe o dia (1 a 3): ")
                        leia(dia)

                        se dia >= 1 e dia <= 3 entao

                           se totalVendas < 500 entao

                              valorFinal <- preco[indice] * quantidade

                              estoque[indice] <- estoque[indice] - quantidade

                              vendasDia[indice,dia] <- vendasDia[indice,dia] + quantidade

                              totalVendas <- totalVendas + 1

                              totalUnidades <- totalUnidades + quantidade

                              valorTotal <- valorTotal + valorFinal


                              quantidadeVenda[totalVendas] <- quantidade
                              valorVenda[totalVendas] <- valorFinal
                              codigoVenda[totalVendas] <- codigoInformado

                              escreval("")
                              escreval("VENDA REALIZADA!")
                              escreval("Produto: ", nome[indice])
                              escreval("Quantidade: ", quantidade)
                              escreval("Valor total: R$ ", valorFinal)
                              escreval("Estoque restante: ", estoque[indice])

                           senao

                              escreval("Limite de registros atingido!")

                           fimse

                        senao

                           escreval("Dia invalido!")

                        fimse

                     senao

                        escreval("Estoque insuficiente!")

                     fimse

                  senao

                     escreval("Quantidade invalida!")

                  fimse

               senao

                  escreval("Produto nao encontrado!")

               fimse

            senao

               escreval("Cadastre os produtos primeiro!")

            fimse


         caso 3

            se cadastrado = verdadeiro entao

               escreval("")
               escreval("========== ESTOQUE ==========")

               para i de 1 ate 5 faca

                  escreval("")
                  escreval("Codigo: ", codigo[i])
                  escreval("Produto: ", nome[i])
                  escreval("Preco: R$ ", preco[i])
                  escreval("Quantidade: ", estoque[i])

                  se estoque[i] = 0 entao

                     escreval("Produto não encontrado")

                  senao

                     se estoque[i] <= 5 entao

                        escreval("Poucas unidades")

                     senao

                        escreval("Bastante unidades")

                     fimse

                  fimse

               fimpara

            senao

               escreval("Cadastre os produtos primeiro!")

            fimse

         caso 4

            escreval("")
            escreval("======= RELATORIO DE VENDAS =======")

            escreval("Total de vendas: ", totalVendas)
            escreval("Produtos vendidos: ", totalUnidades)
            escreval("Valor arrecadado: R$ ", valorTotal)

            se totalVendas > 0 entao

               mediaVendas <- valorTotal / totalVendas

               escreval("Media das vendas: R$ ", mediaVendas)

            senao

               escreval("Media das vendas: R$ 0")

            fimse


         caso 5

            se cadastrado = verdadeiro entao

               escreval("")
               escreval("========== RELATORIO GERAL ==========")

               escreval("Produto     Dia 1     Dia 2     Dia 3")

               totalGeral <- 0

               para i de 1 ate 5 faca

                  escreva(nome[i], "     ")

                  vendasPorProduto <- 0

                  para j de 1 ate 3 faca

                     escreva(vendasDia[i,j], "          ")

                     vendasPorProduto <- vendasPorProduto + vendasDia[i,j]

                  fimpara

                  escreval("")
                  escreval("Total do produto: ", vendasPorProduto)

                  totalGeral <- totalGeral + vendasPorProduto

               fimpara

               escreval("")
               escreval("Total geral de unidades: ", totalGeral)

            senao

               escreval("Cadastre os produtos primeiro!")

            fimse


         caso 6

            escreval("")
            escreval("Encerrando o sistema...")

         outrocaso

            escreval("Opcao invalida! Tente novamente.")

      fimescolha

   fimenquanto

Fimalgoritmo