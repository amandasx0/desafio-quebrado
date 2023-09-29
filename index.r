// O PROGRAMA FUNCIONANDO CONSISTE EM UM SIMULADOR DE SISTEMA OPERACIONAL, EM QUE O USUÁRIO PRECISA PRIMEIRO SE CADASTRAR, DEPOIS FAZER O LOGIN. 
// APÓS LOGADO O USUÁRIO PODERÁ ESCOLHER ENTRE 4 APLICATIVOS NATIVOS E FUNCIONAIS ENTRE ELES: UMA CALCULADORA DAS 4 OPERAÇÕES, UM CONVERSOR DE TEMPERATURA °C, °F E °K 
// POSSIBILTANDO A ESCOLHA DA DIREÇÃO DA CONVERSÃO, UM COVERSOR DE MOEDA E UM BLOCO DE NOTAS COM OS PRINCIPAIS COMANDOS DO CMD E GIT. VALE DESTACAR QUE EXISTE BOTÃO DE VOLTAR 
// ENTRE CADA MENU/APLICATIVO/LOGIN E QUE O PROGRAMA CONTINUA RODANDO A TODO INSTANTE AO MENOS QUE SEJA SOLICITADO PARA ENCERRAR NA TELA DE LOGIN. xD
programa {
    inclua biblioteca Util --> u
    cadeia nomeUser, senha, email, emailUser, senhaUser
    inteiro opcao, valor, algarismo, resultado, opcaoMoeda, opcaoCalc, opcaoMenu, opcaoBloco
    real temperatura, valorReal

    funcao inicio() {
        menu()
    }

    funcao menu() {
        faca {
            escreva("SISTEMA OPERACIONAL VnW\n[1]Cadastrar usuário (Limitado a um usuário) \n[2]Login \n[0]Sair \n")
            leia(opcaoMenu)

            se (opcaoMenu == 1) {
                cadastroUser()
            }  senao se (opcaoMenu == 2) {
                login()
            } senao se (opcaoMenu == 0) {
                escreva("Opção inválida!\n")
                limpa()
            } senao {
                escreva("ENCERRANDO...")
            }
        } enquanto (opcaoMenu != 0)
    }

  funcao cadastroUser() {
        escreva("Nome de usuário: ")
        leia(nomeUser)
        escreva("\nDigite seu email: ")
        leia(emailUser)
        escreva("\nDigite sua senha: ")
        leia(senhaUser)
    }

    funcao login() {
        para (inteiro i = 0; i < 2; i++) {
            escreva("Digite seu email: ")
            leia(email)
            escreva("\nDigite sua senha: ")
            leia(senha)

            se (email == "" e senha == "") {
                escreva("Nenhum usuário cadastrado.\n")
                pare
            } senao se (email == emailUser e senha == senhaUser) {
                limpa() 
                escreva("Login bem-sucedido! Bem-vindo, " + nomeUser + "\n")
                menuOs()
                pare
            } senao se (email != emailUser ou senha != senhaUser) {
                escreva("\nSenha ou email inválidos!\n")   
            }
        } se (i == 2) {
                escreva("Usuário Bloqueado!\n")
            }
    } 

   funcao menuOs() {
        faca {
            escreva("APLICATIVOS\n[1]Calculadora \n[2]Conversor de Temperatura \n[3]Conversor de Moedas \n[4]Bloco de Notas \n[5]Sair/Menu\n")
            leia(opcao) 
            escolha (opcao) {
                caso 1:
                    limpa()
                    escreva("CALCULADORA\n")
                    calculadora()
                    pare
                caso 2:
                    limpa()
                    escreva("CONVERSOR DE TEMPERATURA\n")
                    conversor()
                    pare
                caso 3:
                    limpa()
                    escreva("CONVERSOR DE MOEDA\n")
                    conversorMoeda()
                    pare
                caso 4:
                    limpa()
                    escreva("BLOCO DE NOTAS\n")
                    menuBloco()
                    pare
                caso 5:
                    escreva("VOLTAR \n[1] Menu [2] Sair\n")
                    inteiro opcaoCaso5
                    leia(opcaoCaso5)
                    se (opcaoCaso5 == 1) {
                        limpa()
                        menuOs()
                    } senao {
                        limpa()
                        menu()
                    }
                    limpa()
                    pare
            }
        } enquanto (opcaoMenu != 5)
    } 

    funcao alternativa() {
        escreva("Escolha uma das 4 Operações Matemáticas Básicas\n [1] Soma\n [2] Subtração\n [3] Multiplicação\n [4] Divisão\n [5] Sair\n Opcão:")
    } 

    funcao calculadora() {
        faca {
            alternativa()
            leia(opcaoCalc)
            escolha (opcaoCalc) {
                caso 1:
                    limpa()
                    escreva("Você escolheu SOMA\n")
                    globo()
                    pare
                caso 2:
                    limpa()
                    escreva("Você escolheu SUBTRAÇÃO\n")
                    globo() 
                    pare
                caso 3:
                    limpa()
                    escreva("Você escolheu MULTIPLICAÇÃO\n")
                    globo() 
                    pare
                caso 4:
                    limpa()
                    escreva("Você escolheu DIVISÃO\n")
                    globo()
                    pare
                caso 5:
                    limpa()
                    menuOs()
                    pare
            }
        } enquanto (opcaoCalc != 5)
    } 

    funcao globo() {
        valor = 0
        resultado = 0
        faca {
            valor = valor + 1
            escreva("[0] para Imprimir o Resultado\n", "Digite o ", valor, "° Valor: ")
            leia(algarismo)
            se (algarismo == 0) {
                pare
            } senao {
                se (valor == 1) {
                    resultado = algarismo
                } senao {
                    escolha (opcaoCalc) {
                        caso 1:
                            resultado = resultado + algarismo
                            pare
                        caso 2:
                            resultado = resultado - algarismo
                            pare
                        caso 3:
                            resultado = resultado * algarismo
                            pare
                        caso 4:
                            resultado = resultado / algarismo
                            pare
                    }
                }
            }
        } enquanto (valor < 99 )
        limpa()
        escreva("O resultado é: ", resultado, "\n")
    }

    funcao conversor() {
        inteiro opcaoConvTemp

        faca {
            escreva("[1] Celsius para Kelvin\n[2] Celsius para Fahrenheit\n[3] Kelvin para Celsius\n[4] Kelvin para Fahrenheit\n[5] Fahrenheit para Celsius\n[6] Fahrenheit para Kelvin\n[7] Sair\n")
            leia(opcaoConvTemp)

            escolha (opcaoConvTemp) {
                caso 1:
                    escreva("Digite a temperatura em Celsius: ")
                    leia(temperatura)
                    resultado = temperatura + 273.15
                    escreva("\n", temperatura, " Celsius é igual a ", resultado, " Kelvin.\n")
                    u.aguarde(2000) // Espera por 2 segundos antes de voltar ao menu
                    limpa()
                    pare   
                caso 2:
                    escreva("Digite a temperatura em Celsius: ")
                    leia(temperatura)
                    resultado = (temperatura * 9/5) + 32
                    escreva("\n", temperatura, " Celsius é igual a ", resultado, " Fahrenheit.\n")
                    u.aguarde(2000) // Espera por 2 segundos antes de voltar ao menu
                    limpa()
                    pare
                caso 3:
                    escreva("Digite a temperatura em Kelvin: ")
                    leia(temperatura)
                    resultado = temperatura - 273.15
                    escreva("\n", temperatura, " Kelvin é igual a ", resultado, " Celsius.\n")
                    u.aguarde(2000) // Espera por 2 segundos antes de voltar ao menu
                    limpa()
                    pare
                caso 4:
                    escreva("Digite a temperatura em Kelvin: ")
                    leia(temperatura)
                    resultado = (temperatura - 273.15) * 9/5 + 32
                    escreva("\n", temperatura, " Kelvin é igual a ", resultado, " Fahrenheit.\n")
                    u.aguarde(2000) // Espera por 2 segundos antes de voltar ao menu
                    limpa()
                    pare
                caso 5:
                    escreva("Digite a temperatura em Fahrenheit: ")
                    leia(temperatura)
                    resultado = (temperatura - 32) * 5/9
                    escreva("\n", temperatura, " Fahrenheit é igual a ", resultado, " Celsius.\n")
                    u.aguarde(2000) // Espera por 2 segundos antes de voltar ao menu
                    limpa()
                    pare
                caso 6:
                    escreva("Digite a temperatura em Fahrenheit: ")
                    leia(temperatura)
                    resultado = (temperatura - 32) * 5/9 + 273.15
                    escreva("\n", temperatura, " Fahrenheit é igual a ", resultado, " Kelvin.\n")
                    u.aguarde(2000) // Espera por 2 segundos antes de voltar ao menu
                    pare
                caso 7:
                    limpa()
                    escreva("Saindo do programa. Até logo!\n")
                    menuOs()
                    pare
            }
        } enquanto (opcaoConvTemp != 7)
    } 

    funcao conversorMoeda() {
        escreva("Digite o valor em Reais que deseja converter: \nR$ ")
        leia(valorReal)
        escreva("Opções para conversão:\n[1] Dólar\n[2] Euro\n[3] Yuan chinês\n[4] Libra Inglesa\n[0] SAIR\n")
        leia(opcaoMoeda)
        se (opcaoMoeda == 1) {
            limpa()
            escreva("O valor em Dólar é: " + valorReal * 0.21, "\n")
            conversorMoeda()
        } senao se (opcaoMoeda == 2) {
            limpa()
            escreva("O valor em Euro é: " + valorReal * 0.19, "\n")
            conversorMoeda()
        } senao se (opcaoMoeda == 3) {
            limpa() 
            escreva("O valor em Yuan Chinês é: " + valorReal * 1.49, "\n")   
            conversorMoeda()
        } senao se (opcaoMoeda == 4) {
            limpa()
            escreva("O valor em Libras Inglesas é: " + valorReal * 0.17, "\n")
            conversorMoeda()
        } senao {
            limpa()
            menuOs()
        }
    }

   funcao menuBloco() {
        faca {
            escreva("Selecione uma opção:\n[1] CMD \n[2] Git\n[3] VOLTAR\n")
            leia(opcaoBloco)
            escolha (opcaoBloco) {
                caso 1:
                    opcaoEscolhaCmd()
                    pare
                caso 2:
                    opcaoEscolhaGit()
                    pare
                caso 3:
                    limpa()
                    menuOs()
                    pare
            }
        } enquanto (opcaoBloco != 3)
    }

    funcao opcaoEscolhaGit() {
        limpa()
        escreva("1) Git init -> Iniciar o git no local \n2) Git add (nome do arquivo ou .) -> enviar o arquivo para git local \n3) Git commit -m (nome do commit) -> Criar uma versão com um comentário \n4) Git remote add origin (endereço) -> Adicionar o destino remoto do git \n5) Git push -u origin (branch) -> Enviar a versão para o git remote\n6) Git checkout -b -> criar uma branch \n7) git branch -> Ver as branch's disponíveis\n8) git pull -> Puxar atualizações local remote\n")
        menuBloco()
    }

    funcao opcaoEscolhaCmd() {
        limpa()
        escreva("1) whoami → levar até pasta usuário \n2) ls/dir → mostra todos os arquivos presentes naquela pasta\n3) cls → Limpar\n4) cd (nome arquivo)→ entrar no arquivo\n5) cd .. → Voltar\n6) cd → Voltar para raiz\n7) mkdir/md → Criar pasta\n8) RD → Excluir pasta\n9) s/q → deletar\n10) del → deletar arquivo\n11) type nul > (nome).(tipo) / touch → Criar arquivo\n12) start → abrir arquivo\n13) type con > (nome arquivo) → escrever no arquivo\n14) f6 → sair\n")
        menuBloco()
    } 
}