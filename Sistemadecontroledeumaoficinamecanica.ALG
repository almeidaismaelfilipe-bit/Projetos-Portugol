
Algoritmo "SISTEMA_DE_CONTROLE_DE_UMA_OFICINA_MECANICA"

Var
   // CADASTROS
   nomeServicos: vetor[1..5] de caractere
   precoServicos: vetor[1..5] de real
   nomePecas: vetor[1..5] de caractere
   precoPecas: vetor[1..5] de real
   estoque: vetor[1..5] de inteiro

   // ORDENS DE SERVICO
   numeroOS: vetor[1..50] de inteiro
   cliente: vetor[1..50] de caractere
   veiculo: vetor[1..50] de caractere
   placa: vetor[1..50] de caractere
   finalizada: vetor[1..50] de logico
   totalOS: vetor[1..50] de real

   // MATRIZES DE ITENS POR ORDEM
   qtdServicosOS: vetor[1..50,1..5] de inteiro
   qtdPecasOS: vetor[1..50,1..5] de inteiro

   // MATRIZ DE TRES PERIODOS
   servicosPeriodo: vetor[1..5,1..3] de inteiro

   // VARIAVEIS AUXILIARES
   opcao: inteiro
   i, j, k: inteiro
   opcaoServico: inteiro
   quantidade: inteiro
   idOS: inteiro
   periodo: inteiro
   proximaOS: inteiro
   abertas: inteiro
   atendimentos: inteiro
   reservado: inteiro
   maisRealizado: inteiro
   maiorQuantidade: inteiro
   totalGeral: real
   valor: real

Inicio

   // INICIALIZACAO DOS SERVICOS

   nomeServicos[1] <- "Troca de Oleo"
   nomeServicos[2] <- "Pastilhas de Freio"
   nomeServicos[3] <- "Revisao Geral"
   nomeServicos[4] <- "Alinhamento"
   nomeServicos[5] <- "Balanceamento"

   precoServicos[1] <- 120
   precoServicos[2] <- 180
   precoServicos[3] <- 250
   precoServicos[4] <- 100
   precoServicos[5] <- 80

   // INICIALIZACAO DAS PECAS

   nomePecas[1] <- "Filtro de Oleo"
   nomePecas[2] <- "Pastilha de Freio"
   nomePecas[3] <- "Filtro de Ar"
   nomePecas[4] <- "Vela de Ignicao"
   nomePecas[5] <- "Oleo de Motor"

   precoPecas[1] <- 35
   precoPecas[2] <- 90
   precoPecas[3] <- 45
   precoPecas[4] <- 25
   precoPecas[5] <- 40

   estoque[1] <- 20
   estoque[2] <- 15
   estoque[3] <- 12
   estoque[4] <- 30
   estoque[5] <- 25

   // INICIALIZACAO DO SISTEMA

   proximaOS <- 0
   totalGeral <- 0
   atendimentos <- 0

   para i de 1 ate 5 faca
      para j de 1 ate 3 faca
         servicosPeriodo[i,j] <- 0
      fimpara
   fimpara

   repita

      escreval("")
      escreval("======================================")
      escreval("       OFICINA IDEAL - SISTEMA")
      escreval("======================================")
      escreval("1 - Cadastrar servicos e precos")
      escreval("2 - Cadastrar pecas e estoque")
      escreval("3 - Abrir ordem de servico")
      escreval("4 - Adicionar servicos e pecas")
      escreval("5 - Finalizar ordem de servico")
      escreval("6 - Relatorio de atendimentos")
      escreval("7 - Sair")
      escreval("======================================")

      escreva("Escolha uma opcao: ")
      leia(opcao)

      // 1 - CADASTRAR SERVICOS

      se opcao = 1 entao

         para i de 1 ate 5 faca
            escreval("")
            escreval("Servico: ", nomeServicos[i])
            escreva("Digite o novo preco: R$ ")
            leia(precoServicos[i])
         fimpara

         escreval("Servicos atualizados!")

      fimse

      // 2 - CADASTRAR PECAS

      se opcao = 2 entao

         para i de 1 ate 5 faca
            escreval("")
            escreval("Peca: ", nomePecas[i])

            escreva("Novo preco: R$ ")
            leia(precoPecas[i])

            escreva("Quantidade em estoque: ")
            leia(estoque[i])
         fimpara

         escreval("Cadastro de pecas atualizado!")

      fimse

      // 3 - ABRIR ORDEM DE SERVICO

      se opcao = 3 entao

         se proximaOS < 50 entao

            proximaOS <- proximaOS + 1

            numeroOS[proximaOS] <- proximaOS
            finalizada[proximaOS] <- falso
            totalOS[proximaOS] <- 0

            para i de 1 ate 5 faca
               qtdServicosOS[proximaOS,i] <- 0
               qtdPecasOS[proximaOS,i] <- 0
            fimpara

            escreval("")
            escreval("ABERTURA DE ORDEM DE SERVICO")
            escreval("Numero da OS: ", numeroOS[proximaOS])

            escreva("Nome do cliente: ")
            leia(cliente[proximaOS])

            escreva("Modelo do veiculo: ")
            leia(veiculo[proximaOS])

            escreva("Placa do veiculo: ")
            leia(placa[proximaOS])

            escreval("Ordem de servico aberta!")

         senao
            escreval("Limite de ordens atingido!")
         fimse

      fimse

      // 4 - ADICIONAR SERVICOS E PECAS

      se opcao = 4 entao

         escreval("")
         escreva("Digite o numero da OS: ")
         leia(idOS)

         se (idOS >= 1) e (idOS <= proximaOS) entao

            se finalizada[idOS] = falso entao

               escreval("1 - Adicionar servico")
               escreval("2 - Adicionar peca")
               escreva("Escolha: ")
               leia(escolha)

               // ADICIONAR SERVICO

               se escolha = 1 entao

                  para i de 1 ate 5 faca
                     escreval(i, " - ", nomeServicos[i],
                     " | R$ ", precoServicos[i])
                  fimpara

                  escreva("Escolha o servico: ")
                  leia(i)

                  se (i >= 1) e (i <= 5) entao

                     escreva("Quantidade: ")
                     leia(quantidade)

                     se quantidade > 0 entao
                        qtdServicosOS[idOS,i] <-
                        qtdServicosOS[idOS,i] + quantidade

                        escreval("Servico adicionado!")
                     senao
                        escreval("Quantidade invalida!")
                     fimse

                  senao
                     escreval("Servico inexistente!")
                  fimse

               fimse

               // ADICIONAR PECA

               se escolha = 2 entao

                  para i de 1 ate 5 faca
                     escreval(i, " - ", nomePecas[i],
                     " | R$ ", precoPecas[i],
                     " | Estoque: ", estoque[i])
                  fimpara

                  escreva("Escolha a peca: ")
                  leia(i)

                  se (i >= 1) e (i <= 5) entao

                     escreva("Quantidade: ")
                     leia(quantidade)

                     se quantidade > 0 entao

                        reservado <- 0

                        para j de 1 ate proximaOS faca
                           se finalizada[j] = falso entao
                              reservado <- reservado +
                              qtdPecasOS[j,i]
                           fimse
                        fimpara

                        se quantidade <= estoque[i] - reservado entao

                           qtdPecasOS[idOS,i] <-
                           qtdPecasOS[idOS,i] + quantidade

                           escreval("Peca adicionada!")

                        senao
                           escreval("Estoque insuficiente!")
                        fimse

                     senao
                        escreval("Quantidade invalida!")
                     fimse

                  senao
                     escreval("Peca inexistente!")
                  fimse

               fimse

               se (escolha <> 1) e (escolha <> 2) entao
                  escreval("Opcao invalida!")
               fimse

            senao
               escreval("Esta ordem ja foi finalizada!")
            fimse

         senao
            escreval("Ordem de servico inexistente!")
         fimse

      fimse

      // 5 - FINALIZAR ORDEM DE SERVICO

      se opcao = 5 entao

         escreva("Numero da OS: ")
         leia(idOS)

         se (idOS >= 1) e (idOS <= proximaOS) entao

            se finalizada[idOS] = falso entao

               valor <- 0

               // CALCULAR SERVICOS

               para i de 1 ate 5 faca
                  valor <- valor +
                  qtdServicosOS[idOS,i] * precoServicos[i]
               fimpara

               // CALCULAR PECAS

               para i de 1 ate 5 faca
                  valor <- valor +
                  qtdPecasOS[idOS,i] * precoPecas[i]
               fimpara

               // ESCOLHER PERIODO

               escreval("Escolha o periodo:")
               escreval("1 - Primeiro periodo")
               escreval("2 - Segundo periodo")
               escreval("3 - Terceiro periodo")
               escreva("Periodo: ")
               leia(periodo)

               se (periodo >= 1) e (periodo <= 3) entao

                  // ATUALIZAR ESTOQUE

                  para i de 1 ate 5 faca
                     estoque[i] <- estoque[i] -
                     qtdPecasOS[idOS,i]
                  fimpara

                  // ATUALIZAR MATRIZ

                  para i de 1 ate 5 faca
                     servicosPeriodo[i,periodo] <-
                     servicosPeriodo[i,periodo] +
                     qtdServicosOS[idOS,i]
                  fimpara

                  totalOS[idOS] <- valor
                  totalGeral <- totalGeral + valor

                  finalizada[idOS] <- verdadeiro
                  atendimentos <- atendimentos + 1

                  escreval("")
                  escreval("ORDEM FINALIZADA!")
                  escreval("Cliente: ", cliente[idOS])
                  escreval("Veiculo: ", veiculo[idOS])
                  escreval("Placa: ", placa[idOS])
                  escreval("Valor total: R$ ", valor)

               senao
                  escreval("Periodo invalido!")
               fimse

            senao
               escreval("Esta ordem ja foi finalizada!")
            fimse

         senao
            escreval("Ordem de servico inexistente!")
         fimse

      fimse

      // 6 - RELATORIO

      se opcao = 6 entao

         escreval("")
         escreval("======================================")
         escreval("       RELATORIO DA OFICINA")
         escreval("======================================")

         escreval("Atendimentos finalizados: ", atendimentos)
         escreval("Faturamento total: R$ ", totalGeral)

         escreval("")
         escreval("ORDENS FINALIZADAS:")

         para i de 1 ate proximaOS faca

            se finalizada[i] = verdadeiro entao

               escreval("")
               escreval("OS: ", numeroOS[i])
               escreval("Cliente: ", cliente[i])
               escreval("Veiculo: ", veiculo[i])
               escreval("Placa: ", placa[i])
               escreval("Total: R$ ", totalOS[i])

            fimse

         fimpara

         escreval("")
         escreval("SERVICOS REALIZADOS POR PERIODO")

         para i de 1 ate 5 faca

            escreval("")
            escreval(nomeServicos[i])
            escreval("Periodo 1: ", servicosPeriodo[i,1])
            escreval("Periodo 2: ", servicosPeriodo[i,2])
            escreval("Periodo 3: ", servicosPeriodo[i,3])

         fimpara

         // IDENTIFICAR SERVICO MAIS REALIZADO

         maiorQuantidade <- 0
         maisRealizado <- 1

         para i de 1 ate 5 faca

            quantidade <- 0

            para j de 1 ate 3 faca
               quantidade <- quantidade +
               servicosPeriodo[i,j]
            fimpara

            se quantidade > maiorQuantidade entao
               maiorQuantidade <- quantidade
               maisRealizado <- i
            fimse

         fimpara

         escreval("")
         escreval("SERVICO MAIS REALIZADO:")
         escreval(nomeServicos[maisRealizado])
         escreval("Quantidade: ", maiorQuantidade)

         // ESTOQUE ATUAL

         escreval("")
         escreval("ESTOQUE ATUAL")

         para i de 1 ate 5 faca
            escreval(nomePecas[i], ": ", estoque[i],
            " unidades")
         fimpara

         escreval("======================================")

      fimse

      // 7 - SAIR

      se opcao = 7 entao
         escreval("Encerrando o sistema...")
      fimse

      se (opcao < 1) ou (opcao > 7) entao
         escreval("Opcao invalida!")
      fimse

   ate opcao = 7

Fimalgoritmo
