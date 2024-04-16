programa
{
	inclua biblioteca Arquivos-->arq
	inclua biblioteca Matematica-->mat
	inclua biblioteca Tipos-->tp
	inclua biblioteca Texto-->tx
	
	funcao inicio()
	{
	//CNPJ: 77.161.014/0001-11
	//MAQUINA DE CARTAO USADA: FONTCARD
	//NOME DA EMPRESA: PADARIA PAO QUENTE
	/*LEGENDA DAS VARIAVEIS
	 * (cadeia matzEstoque) - matriz utilizada para armazenar as informações dos produto (nome - preco - valor vendido - quantidade no estoque) nessa ordem
	 * (cadeia nome) - utilizada para armazenar temporiamente a informacao do nome do produto
	 * (cadeia textoLinha) - utilizada para armazenar temporariamente oque sera escrito na linha do arquivo
	 * (cadeia auxCad) - utilizada como uma variavel auxiliar, podendo fazer qualquer funcao sendo do tipo cadeia
	 * (cadeia matzQuantidade) - matriz utilizada para armazenar a quantidade vendida de cada produto (nome - quantidade vendida) nessa ordem
	 * (cadeia matzTotal) - matriz utilizada para armazenar o valor (R$) total vendido de cada produto (nome - valor (R$) total vendido) nessa ordem
	 * (inteiro opcao) - utilizada para armazenar temporariamente o valor da opcao escolhida do usuario
	 * (inteiro quantidade) - utilizada pra armazenar temporariamente o valor da quantidade de produtos
	 * (inteiro cod) - utilizada para armazenar temporariamente o codigo do produto
	 * (inteiro auxInt) - utilizada como uma variavel auxiliar, podendo fazer qualquer funcao sendo do tipo inteiro
	 * (inteiro arquivo) - utilizada para armazenar o caminho do arquivo quer sera utilizado
	 * (real preco) - utilizada para armazenar temporariamente o valor (R$) do produto
	 * (real custo) - utilizada para armazenar temporariamente o valor (R$) custo do produto
	 * (real total) - utilizada para armazenar o valor (R$) total da compra
	 * (real treco) - utilizada para armazenar temporariamente o valor (R$) do trouco do cliente caso ele deseja pagar em dinheiro 
	 * (real auxReal) - utilizada como uma variavel auxiliar, podendo fazer qualquer funcao sendo do tipo real
	 */
	cadeia matzEstoque[5][4], nome=" ",textoLinha=" ",auxCad, matzQuantidade[5][2],matzTotal[5][2]
	inteiro opcao,quantidade=0,cod=0,auxInt=0,arquivo
	real preco,custo,total=0.0,troco=0.0,auxReal=0.0
	logico teste
	const cadeia caminhoNome="C:/Users/Aluno/Desktop/padaria/nome.txt"//armazenando o caminho do arquivo na variavel
	const cadeia caminhoPreco="C:/Users/Aluno/Desktop/padaria/preco.txt"//armazenando o caminho do arquivo na variavel
	const cadeia caminhoCusto="C:/Users/Aluno/Desktop/padaria/custo.txt"//armazenando o caminho do arquivo na variavel
	const cadeia caminhoQuantidade="C:/Users/Aluno/Desktop/padaria/quantidade.txt"//armazenando o caminho do arquivo na variavel
	const cadeia caminhoReQuantidade="C:/Users/Aluno/Desktop/padaria/relatorioquantidade.txt"//armazenando o caminho do arquivo na variavel
	const cadeia caminhoReTotal="C:/Users/Aluno/Desktop/padaria/relatoriototal.txt"//armazenando o caminho do arquivo na variavel

	arquivo=arq.abrir_arquivo(caminhoReQuantidade,arq.MODO_LEITURA)//abrindo o arquivoRelatorio.txt
	para(inteiro l=0;l<5;l++){//laco de repeticao para ler e puxar os dados do arquivo e armazenar nas devidas linha e colunas da matriz
		matzQuantidade[l][1]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo

	arquivo=arq.abrir_arquivo(caminhoReTotal,arq.MODO_LEITURA)//abrindo o arquivoRelatorio.txt
	para(inteiro l=0;l<5;l++){//laco de repeticao para ler e puxar os dados do arquivo e armazenar nas devidas linha e colunas da matriz
		matzTotal[l][1]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo
	
	arquivo=arq.abrir_arquivo(caminhoNome,arq.MODO_LEITURA)//abrindo o arquivoRelatorio.txt
	para(inteiro l=0;l<5;l++){//laco de repeticao para ler e puxar os dados do arquivo e armazenar nas devidas linha e colunas da matriz
		matzTotal[l][0]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo

	arquivo=arq.abrir_arquivo(caminhoNome,arq.MODO_LEITURA)//abrindo o arquivoRelatorio.txt
	para(inteiro l=0;l<5;l++){//laco de repeticao para ler e puxar os dados do arquivo e armazenar nas devidas linha e colunas da matriz
		matzQuantidade[l][0]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo
	
	arquivo=arq.abrir_arquivo(caminhoNome,arq.MODO_LEITURA)//abrindo o arquivoRelatorio.txt
	para(inteiro l=0;l<5;l++){//laco de repeticao para ler e puxar os dados do arquivo e armazenar nas devidas linha e colunas da matriz
		matzEstoque[l][0]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo

	arquivo=arq.abrir_arquivo(caminhoPreco,arq.MODO_LEITURA)//abrindo o arquivoRelatorio.txt
	para(inteiro l=0;l<5;l++){//laco de repeticao para ler e puxar os dados do arquivo e armazenar nas devidas linha e colunas da matriz
		matzEstoque[l][1]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo

	arquivo=arq.abrir_arquivo(caminhoCusto,arq.MODO_LEITURA)//abrindo o arquivoRelatorio.txt
	para(inteiro l=0;l<5;l++){//laco de repeticao para ler e puxar os dados do arquivo e armazenar nas devidas linha e colunas da matriz
		matzEstoque[l][2]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo

	arquivo=arq.abrir_arquivo(caminhoQuantidade,arq.MODO_LEITURA)//abrindo o arquivoRelatorio.txt//abre arquivoQuantidade.txt
	para(inteiro l=0;l<5;l++){//laco de repeticao para ler e puxar os dados do arquivo e armazenar nas devidas linha e colunas da matriz
		matzEstoque[l][3]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo
	//											Imprimindo o menu de opcao
	menu()
	leia(opcao)
	limpa()
	escolha(opcao){
		caso 1://									Opcao de Cadastrar Produtos
		para(inteiro l=0;l<5;l++){
			titulo()
			escreva("Informe o nome do novo produto:\n->")
			leia(nome)
			limpa()
			matzEstoque[l][0]=nome//armazenando a informacao do nome na matriz
			
			faca{
			titulo()
			escreva("Informe o quantidade disponivel do prouto (",nome,"):\n->")
			leia(quantidade)
			}enquanto(quantidade<0)//loop de repeticao utilizado para que o usuario coloque um numero inteiro maior que 0
			matzEstoque[l][1]=tp.inteiro_para_cadeia(quantidade,10)//armazenando o valor da quantidade na matriz
			limpa()
			
			faca{
			titulo()
			escreva("Informe o valor unitário do produto (",nome,")\n->R$")
			leia(preco)
			}enquanto(preco<0)//loop de repeticao utilizado para que o usuario informe um valor (R$) maior que 0
			matzEstoque[l][2]=tp.real_para_cadeia(preco)//armazenando o valor (R$) do prosuto na matriz
			limpa()
			
			faca{
			titulo()
			escreva("Informe o custo do produto (",nome,")\n->")
			leia(custo)
			}enquanto(custo<0)//loop de repeticao utilizado para que o usuario informe um valor (R$) do custo do produto que seja maior que 0
			matzEstoque[l][3]=tp.real_para_cadeia(custo)//armazenando o valor (R$) do custo na matriz
			limpa()
		}
		arquivo=arq.abrir_arquivo(caminhoNome,arq.MODO_ESCRITA)//abrindo o arquivoNome.txt
		para(inteiro l=0;l<5;l++){//laco de repeticao para armazenar os dados no arquivo
			textoLinha=matzEstoque[l][0]//informando oque sera escrito no arquivo
			arq.escrever_linha(textoLinha,arquivo)//escrevendo os dados na linha do arquivo
		}
		arq.fechar_arquivo(arquivo)//fechando o arquivo
		
		arquivo=arq.abrir_arquivo(caminhoQuantidade,arq.MODO_ESCRITA)//abrindo arquivoQuantidade.txt
		para(inteiro l=0;l<5;l++){//laco de repeticao para armazenar os dados no arquivo
			textoLinha=matzEstoque[l][1]//informando oque sera escrito no arquivo
			arq.escrever_linha(textoLinha,arquivo)//escrevendo os dados na linha do arquivo
		}
		arq.fechar_arquivo(arquivo)//fechando o arquivo
		
		arquivo=arq.abrir_arquivo(caminhoPreco,arq.MODO_ESCRITA)//abre arquivoPreco.txt
		para(inteiro l=0;l<5;l++){//laco de repeticao para armazenar os dados no arquivo
			textoLinha=matzEstoque[l][2]//informando oque sera escrito no arquivo
			arq.escrever_linha(textoLinha,arquivo)//escrevendo os dados na linha do arquivo
		}
		arq.fechar_arquivo(arquivo)//fechando o arquivo
		
		arquivo=arq.abrir_arquivo(caminhoCusto,arq.MODO_ESCRITA)//abre arquivoCusto.txt
		para(inteiro l=0;l<5;l++){//laco de repeticao para armazenar os dados no arquivo
			textoLinha=matzEstoque[l][3]//informando oque sera escrito no arquivo
			arq.escrever_linha(textoLinha,arquivo)//escrevendo os dados na linha do arquivo
		}
		arq.fechar_arquivo(arquivo)//fechando o arquivo
		escreva("Cadastro de produtos concluido.\n\n")
		inicio()
		pare
		caso 2://										Opcao de Realizar Vendas
		faca{
		titulo()
		menuProdutos(matzEstoque)
		escreva("Informe o código do produto:\n->")
		leia(cod)
		limpa()
		}enquanto(cod<0 ou cod>4)//loop de repeticao utilizado para caso o usuario informe um codigo de produto que nao exista ele pedira o codigo novamente
		
		se(tp.cadeia_para_inteiro(matzEstoque[cod][3],10)==0){//condicao utilizada para caso o produto desejado nao tenha mais no estoque
			escreva("Produto não tem mais no estoque.\n\n")
			inicio()
		}
		auxCad=matzEstoque[cod][0]//auxCad recebendo temporariamente a informacao do nome do produto
		titulo()
		escreva("Informe a quantidade vendida do produto ",auxCad,":\n->")
		leia(quantidade)
		limpa()
		enquanto(quantidade<0 ou quantidade>tp.cadeia_para_inteiro(matzEstoque[cod][3],10)){//caso o usuario informe a quantidade a - ou a + do que tem no estoque
			titulo()
			escreva("Quantidade informada não existe no estoque.\n")//ira imprimir uma mensagem de erro
			escreva("Informe a quantidade vendida do produto ",auxCad,":\n->")//logo depois pedindo novamente um novo valor
			leia(quantidade)
			limpa()
		}
		auxReal=tp.cadeia_para_real(matzEstoque[cod][2])//pegando o valor do custo unitario do produto (cadeia) e transformando em real
		total=quantidade*auxReal//calculando o total com base no valor unitario (total = quantidade x valor unitario)
		faca{
			titulo()
			escreva("                            ___   __________\n")
		     escreva("                           | 1 | | Dinheiro |\n")
               escreva("                            ¨¨¨   ¨¨¨¨¨¨¨¨¨¨\n")
               escreva(" ____________________       ___   _____\n")
		     escreva("| FORMA DE PAGAMENTO |     | 2 | | Pix |\n")
		     escreva(" ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨       ¨¨¨   ¨¨¨¨¨\n")
		     escreva("                            ___   ________\n")
		     escreva("                           | 3 | | Cartão |\n")
		     escreva("                            ¨¨¨   ¨¨¨¨¨¨¨¨            -+->\n")
			leia(opcao)
			limpa()
		}enquanto(opcao<1 ou opcao>3)//loop "anti otario" caso o usuario nao informe uma escolha valida
		escolha(opcao){
			caso 1://								Pagamento em dinheiro
			titulo()
			escreva("Informe o valor pago pelo cliente:\n->")
			leia(troco)
			limpa()
			enquanto(troco<total){//loop utilizado para testar se o valor pago pelo cliente e menor que o valor (R$) total da compra
				titulo()
				escreva("Valor insuficiente para a compra.\n")//caso seja menor sera exibido uma mensagem de erro
				escreva("Informe o valor pago pelo cliente:\n->")//e pedira novamente o valor (R$)
				leia(troco)
				limpa()
			}
			troco=troco-total//calculando o trouco do cliente (touco = valor pago - total da compra)
			escreva("Pagamento concluindo.\nDevolva um total de R$",troco," para o cliente.\n\n\n")
			viaDinheiro(quantidade,cod,total,matzEstoque)//chamando a funcao para imprimir a via do cliente

			//funcao utilizada para salvar todas as alteracoes feitas no arquivo
			salvarValores(auxReal,matzTotal,cod,total,arquivo,caminhoReTotal,caminhoReQuantidade,textoLinha,auxInt,quantidade,matzQuantidade,matzEstoque,caminhoQuantidade)
			inicio()
			pare
			caso 2://									Pagamento em pix
			viaPix(quantidade,cod,total,matzEstoque)//chamando funcao para imprimir via do cliente
			//funcao utilizada para salvar todas as alteracoes feitas no arquivo
			salvarValores(auxReal,matzTotal,cod,total,arquivo,caminhoReTotal,caminhoReQuantidade,textoLinha,auxInt,quantidade,matzQuantidade,matzEstoque,caminhoQuantidade)
			inicio()
			pare
			caso 3://									Pagamento em cartao
			faca{
			titulo()
			escreva("       ___________________________\n")
               escreva("      |                           |\n")
               escreva("      |           CIELO           |\n")
		     escreva("      |   _____________________   |\n")
		     escreva("      |  |                     |  |\n")
		     escreva("      |  |¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨|  |\n")
		     escreva("      |  |   ___   ________    |  |\n")
		     escreva("      |  |  | 1 | | Debito |   |  |\n")
		     escreva("      |  |   ¨¨¨   ¨¨¨¨¨¨¨¨    |  |\n")
		     escreva("      |  |   ___   _________   |  |\n")
		     escreva("      |  |  | 2 | | Crédito |  |  |\n")
		     escreva("      |  |   ¨¨¨   ¨¨¨¨¨¨¨¨¨   |  |\n")
               escreva("      |  +---------------------+  |\n")
               escreva("      |                           |\n")
               escreva("      |                           |\n")
               escreva("      |___________________________|\n\n")
               escreva("-+->\n")
			leia(opcao)
			limpa()
			}enquanto(opcao<1 ou opcao>2)
			se(opcao==1){
				viaCartaoDebito(quantidade,cod,total,matzEstoque)//chamando a funcao para imprimir a via do cliente
			}senao{
				viaCartaoCredito(quantidade,cod,total,matzEstoque)//chamando a funcao para imprimir a via do cliente
			}
			//funcao utilizada para salvar todas as alteracoes feitas no arquivo
			salvarValores(auxReal,matzTotal,cod,total,arquivo,caminhoReTotal,caminhoReQuantidade,textoLinha,auxInt,quantidade,matzQuantidade,matzEstoque,caminhoQuantidade)
			inicio()
			pare
		}	
		pare
		caso 3://									Relatorio Atual
		relatorioTemporario(matzEstoque,matzTotal,matzQuantidade)//chamando a funcao que imprime o relatorio
		inicio()
		pare
		caso 4://									Fechar Caixa e Sair
		escreva("Caixa Fechado\n")
		relatorioFinal(matzEstoque,matzTotal,matzQuantidade)
		para(inteiro l=0;l<5;l++){
			matzQuantidade[l][1]=tp.inteiro_para_cadeia(0,10)
			matzTotal[l][1]=tp.real_para_cadeia(0.0)
		}
		salvarValores(auxReal,matzTotal,cod,total,arquivo,caminhoReTotal,caminhoReQuantidade,textoLinha,auxInt,quantidade,matzQuantidade,matzEstoque,caminhoQuantidade)
		pare
		caso 61514205:
		escreva("Para de curiar o código safado!\n\n")
		troll()
		pare
		caso contrario://							Tratamento de erro
		inicio()
	}
	}//<--FIM DA FUNCAO INICIO
	funcao vazio titulo(){
		escreva("+---------- PADARIA PÃO QUENTE ----------+\n")
	}
	funcao vazio menu(){
		escreva(" ________________________________________________________________________________\n")
    		escreva("|                                                                                |\n")
		escreva("+---------------------------- PADARIA PÃO QUENTE --------------------------------+\n")
    		escreva("|________________________________________________________________________________|\n")
    		escreva("|                                                                                |\n")
    		escreva("|                                                                                |\n")
    		escreva("|   ___    _____________________ \t       ___     ___________________       |\n")
    		escreva("|  | 1 |  | Cadastrar Produtos. |\t      | 2 |   | Realizar Vendas.  |      |\n")
    		escreva("|   ¨¨¨    ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ \t       ¨¨¨     ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨       |\n")
    		escreva("|   ___    ___________________ \t\t       ___     _______________________   |\n")
    		escreva("|  | 3 |  | Relatório Atual.  |\t\t      | 4 |   | Fechar Caixa e Sair.  |  |\n")
    		escreva("|   ¨¨     ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨ \t\t       ¨¨¨     ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨   |\n")
    		escreva("+--------------------------------------------------------------------------------+")
    		escreva("\n\n->")
	}
	funcao vazio menuProdutos(cadeia matzEstoque[][]){
		escreva(" ¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬¬\n")
		escreva("|                                 |\n")
		escreva("|        TABELA DE CÓDIGOS        |\n")
		escreva("|                                 |\n")
		escreva("|¨¨¨¨¨¨¨¨¨¨¨¨¨|¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨|\n")
		escreva("|  ________   |   _________       |\n")
		escreva("| | Código |  |  | Produto |      |\n")
		escreva("|  --------   |   ---------       |\n")
		escreva("|_____________|___________________|\n")
		escreva("|    ____     |   _____________   | \n")
		escreva("|   | 00 |    |  | ", matzEstoque[0][0],"\n")
		escreva("|    ====     |   =============   |\n")
		escreva("|    ____     |   _____________   | \n")
		escreva("|   | 01 |    |  | ", matzEstoque[1][0],"\n")
          escreva("|    ====     |   =============   |\n")
          escreva("|    ____     |   ____________    |\n")
		escreva("|   | 02 |    |  | ", matzEstoque[2][0],"\n")
		escreva("|    ====     |   =============   |\n")
          escreva("|    ____     |   ____________    | \n")
		escreva("|   | 03 |    |  | ", matzEstoque[3][0],"\n")
          escreva("|    ====     |   ============    |\n")
          escreva("|    ____     |   ____________    | \n")
		escreva("|   | 04 |    |  | ", matzEstoque[4][0],"\n")
          escreva("|    ====     |   ============    | \n")
          escreva("|_____________|___________________|\n")
	}
	funcao vazio viaDinheiro(inteiro quantidade,inteiro cod,real total,cadeia matzEstoque[][]){
		escreva("PADARIA PÃO QUENTE\t\t\tFONTCARD\n")
		escreva("CNPJ: 77.161.014/0001-11\n")
		escreva("\t\t\tVIA DO CLIENTE\n")
		escreva("codigo\tnome\tquantidade\tvalor UNI\n")
		escreva("",cod,"\t",matzEstoque[cod][0],"\t   ",quantidade,"\t           ",matzEstoque[cod][2],"\n")
		/*legenda da nota
		 * escreva("",codigo do produto," ",nome do produto," ",quantidade vendida," ",valor unitario,"\n")
		 */
		escreva("TOTAL\t\t\t\t\tR$",total,"\n")
		escreva("DINHEIRO\n")
		escreva("\t\t\tVOLTE SEMPRE!\n")
	}
	funcao vazio viaPix(inteiro quantidade,inteiro cod,real total,cadeia matzEstoque[][]){
		escreva("PADARIA PÃO QUENTE\t\t\tFONTCARD\n")
		escreva("CNPJ: 77.161.014/0001-11\n")
		escreva("\t\t\tVIA DO CLIENTE\n")
		escreva("codigo\tnome\tquantidade\tvalor UNI\n")
		escreva("",cod,"\t",matzEstoque[cod][0],"\t   ",quantidade,"\t           ",matzEstoque[cod][2],"\n")
		/*legenda da nota
		 * escreva("",codigo do produto," ",nome do produto," ",quantidade vendida," ",valor unitario,"\n")
		 */
		escreva("TOTAL\t\t\t\t\tR$",total,"\n")
		escreva("PIX APROVADO\n")
		escreva("\t\tVOLTE SEMPRE!\n\n")
	}
	funcao vazio viaCartaoDebito(inteiro quantidade,inteiro cod,real total,cadeia matzEstoque[][]){
		escreva("PADARIA PÃO QUENTE\t\t\tFONTCARD\n")
		escreva("CNPJ: 77.161.014/0001-11\n")
		escreva("\t\t\tVIA DO CLIENTE\n")
		escreva("codigo\tnome\tquantidade\tvalor UNI\n")
		escreva("",cod,"\t",matzEstoque[cod][0],"\t   ",quantidade,"\t           ",matzEstoque[cod][2],"\n")
		/*legenda da nota
		 * escreva("",codigo do produto," ",nome do produto," ",quantidade vendida," ",valor unitario,"\n")
		 */
		escreva("TOTAL\t\t\t\t\tR$",total,"\n")
		escreva("DEBITO APROVADO COM SENHA\n")
		escreva("\t\t\tVOLTE SEMPRE!\n")
	}
	funcao vazio viaCartaoCredito(inteiro quantidade,inteiro cod,real total,cadeia matzEstoque[][]){
		escreva("PADARIA PÃO QUENTE\t\t\tFONTCARD\n")
		escreva("CNPJ: 77.161.014/0001-11\n")
		escreva("\t\t\tVIA DO CLIENTE\n")
		escreva("codigo\tnome\tquantidade\tvalor UNI\n")
		escreva("",cod,"\t",matzEstoque[cod][0],"\t   ",quantidade,"\t           ",matzEstoque[cod][2],"\n")
		/*legenda da nota
		 * escreva("",codigo do produto," ",nome do produto," ",quantidade vendida," ",valor unitario,"\n")
		 */
		escreva("TOTAL\t\t\t\t\tR$",total,"\n")
		escreva("CRÉDITO APROVADO COM SENHA\n")
		escreva("\t\t\tVOLTE SEMPRE!\n")
	}
	funcao vazio salvarValores(real auxReal,cadeia matzTotal[][],inteiro cod,real total,inteiro arquivo,cadeia caminhoReTotal,cadeia caminhoReQuantidade,cadeia textoLinha, inteiro auxInt,inteiro quantidade,cadeia matzQuantidade[][],cadeia matzEstoque[][],cadeia caminhoQuantidade){
			//armazenando o total vendido do produto na matriz e depois no arquivo do relatorio
			auxReal=tp.cadeia_para_real(matzTotal[cod][1])//pegando o valor do total ate o momento na matriz e transformando em valor real
			auxReal=auxReal+total//salvando o novo valor total (novo valor=antigo valor + valor vendido)
			matzTotal[cod][1]=tp.real_para_cadeia(auxReal)//armazenando o valor na devida matriz
			
			//salvando as alteracoes no arquivo
			arquivo=arq.abrir_arquivo(caminhoReTotal,arq.MODO_ESCRITA)//abrindo o arquivo do relatorio total
			para(inteiro l=0;l<5;l++){//laco de repeticao utilizado para escrever os novos valores alterados
				textoLinha=matzTotal[l][1]
				arq.escrever_linha(textoLinha,arquivo)
			}
			arq.fechar_arquivo(arquivo)//fechando o arquivo salvo
			//-----
		
			//armazenando a quantidade vendida na matriz e no arquivo do relatorio
			auxInt=tp.cadeia_para_inteiro(matzQuantidade[cod][1],10)//pegando o valor da quantidade ja vendida do determinado produto
			auxInt=quantidade+auxInt//somando com q quantidade vendida atual
			matzQuantidade[cod][1]=tp.inteiro_para_cadeia(auxInt,10)//armazenando na matrizQuantidade
			
			//salvando a alteracao no arquivo
			arquivo=arq.abrir_arquivo(caminhoReQuantidade,arq.MODO_ESCRITA)//abrindo o arquivo do relatorio quantidade
			para(inteiro l=0;l<5;l++){//laco de repeticao para armazenar os dados no devido arquivo
				textoLinha=matzQuantidade[l][1]
				arq.escrever_linha(textoLinha,arquivo)//escreve os dados na linha do arquivo
			}
			arq.fechar_arquivo(arquivo)
			//-----
			//amazenando o novo valor da quantidade de produtos na matrizEstoque e depois no arquivo
			auxInt=tp.cadeia_para_inteiro(matzEstoque[cod][3],10)//pegando o valor da quantidade ja amazenada na matriz e transformando em inteiro
			auxInt=auxInt-quantidade//fazendo o reajusto do valor atual da quantidade (quantidade atual=quantidade antiga - quantidade vendida)
			matzEstoque[cod][3]=tp.inteiro_para_cadeia(auxInt,10)//amazenando o valor atualizado na matriz
			
			//salvando a alteracao no arquivo
			arquivo=arq.abrir_arquivo(caminhoQuantidade,arq.MODO_ESCRITA)//abrindo o arquivo da quantidade
			para(inteiro l=0;l<5;l++){//laco de repeticao para armazenar os dados no devido arquivo
				textoLinha=matzEstoque[l][3]
				arq.escrever_linha(textoLinha,arquivo)//escreve os dados na linha do arquivo
			}
			arq.fechar_arquivo(arquivo)
			//-----
	}
	funcao vazio relatorioTemporario(cadeia matzEstoque[][],cadeia matzTotal[][],cadeia matzQuantidade[][]){
		real totalVendas,custoProd,valor1=0.0,valor2=0.0,totalCaixa=0.0,custoTotal=0.0
		inteiro estoque
		escreva("-------------------------------------------------------------------\n")
		escreva("\t\t\t  RELATÓRIO\n\n")
		escreva("|Codigo|     Nome      Qtd/vendida Tot/vendido Em Estoque\n")
		//								imprimindo o relatorio
		para(inteiro l=0;l<5;l++){
			totalVendas=tp.cadeia_para_real(matzTotal[l][1])//recebendo o valor total de vendas do produto
			estoque=tp.cadeia_para_inteiro(matzEstoque[l][3],10)//recebendo o valor total do estoque
			custoProd=tp.cadeia_para_real(matzEstoque[l][2])//recebendo o valor do custo de cada produto
			escreva("|  ",l,"   |     ",matzEstoque[l][0],"\t    ",matzQuantidade[l][1],"           ",matzTotal[l][1],"        ",matzEstoque[l][3],"\n")
		}
		//									calculos do saldo do caixa
		para(inteiro l=0;l<5;l++){//loops de utilizados para pegar o valor do total das vendas de cada produto
			valor1=tp.cadeia_para_real(matzTotal[l][1])
			totalCaixa=valor1+totalCaixa//calculando o valor total do caixa
		}
		//									calculando o lucro total
		escreva("===================================================================\n")
		escreva("Total em caixa\t\t\t\t\t\t   R$",totalCaixa,"\n")//imprimindo o valor total do caixa
		escreva("===================================================================\n\n")
	}
	funcao vazio relatorioFinal(cadeia matzEstoque[][],cadeia matzTotal[][],cadeia matzQuantidade[][]){
		real totalVendas,custoProd,valor1=0.0,valor2=0.0,totalCaixa=0.0,custoTotal=0.0
		inteiro estoque
		escreva("-------------------------------------------------------------------\n")
		escreva("\t\t\t  RELATÓRIO\n\n")
		escreva("|Codigo|     Nome      Qtd/vendida Tot/vendido Em Estoque Tot/custo \n")
		//								imprimindo o relatorio
		para(inteiro l=0;l<5;l++){
			totalVendas=tp.cadeia_para_real(matzTotal[l][1])//recebendo o valor total de vendas do produto
			estoque=tp.cadeia_para_inteiro(matzEstoque[l][3],10)//recebendo o valor total do estoque
			custoProd=tp.cadeia_para_real(matzEstoque[l][2])//recebendo o valor do custo de cada produto
			escreva("|  ",l,"   |     ",matzEstoque[l][0],"\t    ",matzQuantidade[l][1],"           ",matzTotal[l][1],"        ",matzEstoque[l][3],"      ",totalVendas-(custoProd*estoque),"   \n")
		}
		//									calculando o custo total
		para(inteiro l=0;l<5;l++){
			custoProd=tp.cadeia_para_real(matzEstoque[l][2])//recebendo o valor do custo de cada produto
			custoTotal=custoProd*tp.cadeia_para_inteiro(matzQuantidade[l][1],10)
		}
		//									calculos do saldo do caixa
		para(inteiro l=0;l<5;l++){//loops de utilizados para pegar o valor do total das vendas de cada produto
			valor1=tp.cadeia_para_real(matzTotal[l][1])
			totalCaixa=valor1+totalCaixa//calculando o valor total do caixa
		}
		//	 								calculando o lucro total

		escreva("===================================================================\n")
		escreva("Total em caixa\t\t\t\t\t\t     R$",totalCaixa,"\n")//imprimindo o valor total do caixa
		escreva("Custo total\t\t\t\t\t\t     R$",custoTotal,"\n")
		escreva("Lucro total\t\t\t\t\t\t     R$",totalCaixa-custoTotal,"\n")
		escreva("===================================================================\n\n")
	}
	funcao vazio troll(){
		escreva("░░░░░▄▄▄▄▀▀▀▀▀▀▀▀▄▄▄▄▄▄░░░░░░░\n░░░░░█░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░▀▀▄░░░░\n░░░░█░░░▒▒▒▒▒▒░░░░░░░░▒▒▒░░█░░░\n░░░█░░░░░░▄██▀▄▄░░░░░▄▄▄░░░░█░░\n░▄▀▒▄▄▄▒░█▀▀▀▀▄▄█░░░██▄▄█░░░░█░\n█░▒█▒▄░▀▄▄▄▀░░░░░░░░█░░░▒▒▒▒▒░█\n█░▒█░█▀▄▄░░░░░█▀░░░░▀▄░░▄▀▀▀▄▒█\n░█░▀▄░█▄░█▀▄▄░▀░▀▀░▄▄▀░░░░█░░█░\n░░█░░░▀▄▀█▄▄░█▀▀▀▄▄▄▄▀▀█▀██░█░░\n░░░█░░░░██░░▀█▄▄▄█▄▄█▄████░█░░░\n░░░░█░░░░▀▀▄░█░░░█░█▀██████░█░░\n░░░░░▀▄░░░░░▀▀▄▄▄█▄█▄█▄█▄▀░░█░░\n░░░░░░░▀▄▄░▒▒▒▒░░░░░░░░░░▒░░░█░\n░░░░░░░░░░▀▀▄▄░▒▒▒▒▒▒▒▒▒▒░░░░█░\n░░░░░░░░░░░░░░▀▄▄▄▄▄░░░░░░░░█░░")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 19973; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {matzEstoque, 31, 8, 11}-{matzQuantidade, 31, 59, 14}-{matzTotal, 31, 80, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5610; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {matzEstoque, 31, 8, 11}-{matzQuantidade, 31, 59, 14}-{matzTotal, 31, 80, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */