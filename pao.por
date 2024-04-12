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
	/*MODELO DA MATRIZ ESTOQUE
	 * cod|nome|preco|custo|quantidade
	 * cod|nome|preco|custo|quantidade
	 * cod|nome|preco|custo|quantidade
	 * cod|nome|preco|custo|quantidade
	 */
	cadeia matzEstoque[2][4], nome=" ",textoLinha=" ",auxCad, matzQuantidade[2][2],matzTotal[2][2]
	inteiro opcao,quantidade,cod,auxInt=0,arquivo
	real preco,custo,total,troco=0.0,auxReal=0.0
	const cadeia caminhoNome="C:/Users/Aluno/Desktop/Padaria/nome.txt"
	const cadeia caminhoPreco="C:/Users/Aluno/Desktop/Padaria/preco.txt"
	const cadeia caminhoCusto="C:/Users/Aluno/Desktop/Padaria/custo.txt"
	const cadeia caminhoQuantidade="C:/Users/Aluno/Desktop/Padaria/quantidade.txt"
	const cadeia caminhoReQuantidade="C:/Users/Aluno/Desktop/Padaria/relatorioquantidade.txt"
	const cadeia caminhoReTotal="C:/Users/Aluno/Desktop/Padaria/relatoriototal.txt"

	arquivo=arq.abrir_arquivo(caminhoReQuantidade,arq.MODO_LEITURA)//abre arquivoRelatorio.txt
	para(inteiro l=0;l<2;l++){//laco de repeticao para puxar os dados do arquivo e armazenar nas devidas celulas da matz
		matzQuantidade[l][1]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo aberto

	arquivo=arq.abrir_arquivo(caminhoReTotal,arq.MODO_LEITURA)//abre arquivoRelatorio.txt
	para(inteiro l=0;l<2;l++){//laco de repeticao para puxar os dados do arquivo e armazenar nas devidas celulas da matz
		matzTotal[l][1]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo aberto
	
	arquivo=arq.abrir_arquivo(caminhoNome,arq.MODO_LEITURA)//abre arquivoNome.txt
	para(inteiro l=0;l<2;l++){//laco de repeticao para puxar os dados do arquivo e armazenar nas devidas celulas da matz
		matzTotal[l][0]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo aberto

	arquivo=arq.abrir_arquivo(caminhoNome,arq.MODO_LEITURA)//abre arquivoNome.txt
	para(inteiro l=0;l<2;l++){//laco de repeticao para puxar os dados do arquivo e armazenar nas devidas celulas da matz
		matzQuantidade[l][0]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo aberto
	
	arquivo=arq.abrir_arquivo(caminhoNome,arq.MODO_LEITURA)//abre arquivoNome.txt
	para(inteiro l=0;l<2;l++){//laco de repeticao para puxar os dados do arquivo e armazenar nas devidas celulas da matz
		matzEstoque[l][0]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo aberto

	arquivo=arq.abrir_arquivo(caminhoPreco,arq.MODO_LEITURA)//abre arquivoPreco.txt
	para(inteiro l=0;l<2;l++){//laco de repeticao para puxar os dados do arquivo e armazenar nas devidas celulas da matz
		matzEstoque[l][1]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo aberto

	arquivo=arq.abrir_arquivo(caminhoCusto,arq.MODO_LEITURA)//abre arquivoCusto.txt
	para(inteiro l=0;l<2;l++){//laco de repeticao para puxar os dados do arquivo e armazenar nas devidas celulas da matz
		matzEstoque[l][2]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo aberto

	arquivo=arq.abrir_arquivo(caminhoQuantidade,arq.MODO_LEITURA)//abre arquivoQuantidade.txt
	para(inteiro l=0;l<2;l++){//laco de repeticao para puxar os dados do arquivo e armazenar nas devidas celulas da matz
		matzEstoque[l][3]=arq.ler_linha(arquivo)
	}
	arq.fechar_arquivo(arquivo)//fechando o arquivo aberto
	
	titulo()
	menu()
	leia(opcao)
	limpa()
	escolha(opcao){
		caso 1://										Cadastrar produtos
		para(inteiro l=0;l<2;l++){
			titulo()
			escreva("Informe o nome do novo produto:\n->")
			leia(nome)
			matzEstoque[l][0]=nome
			limpa()

			faca{
			titulo()
			escreva("Informe o quantidade disponivel do prouto (",nome,"):\n->")
			leia(quantidade)
			}enquanto(quantidade<0)
			matzEstoque[l][1]=tp.inteiro_para_cadeia(quantidade,10)
			limpa()

			faca{
			titulo()
			escreva("Informe o preﾃｧo unitﾃ｡rio do produto (",nome,")\n->")
			leia(preco)
			}enquanto(preco<0)
			matzEstoque[l][2]=tp.real_para_cadeia(preco)
			limpa()

			faca{
			titulo()
			escreva("Informe o custo do produto (",nome,")\n->")
			leia(custo)
			}enquanto(custo<0)
			matzEstoque[l][3]=tp.real_para_cadeia(custo)
			limpa()
		}
		arquivo=arq.abrir_arquivo(caminhoNome,arq.MODO_ESCRITA)//abre arquivoNome.txt
		para(inteiro l=0;l<2;l++){//laco de repeticao para armazenar os dados no devido arquivo
			textoLinha=matzEstoque[l][0]
			arq.escrever_linha(textoLinha,arquivo)//escreve os dados na linha do arquivo
		}
		arq.fechar_arquivo(arquivo)
		arquivo=arq.abrir_arquivo(caminhoQuantidade,arq.MODO_ESCRITA)//abre arquivoQuantidade.txt
		para(inteiro l=0;l<2;l++){//laco de repeticao para armazenar os dados no devido arquivo
			textoLinha=matzEstoque[l][1]
			arq.escrever_linha(textoLinha,arquivo)//escreve os dados na linha do arquivo
		}
		arq.fechar_arquivo(arquivo)
		arquivo=arq.abrir_arquivo(caminhoPreco,arq.MODO_ESCRITA)//abre arquivoPreco.txt
		para(inteiro l=0;l<2;l++){//laco de repeticao para armazenar os dados no devido arquivo
			textoLinha=matzEstoque[l][2]
			arq.escrever_linha(textoLinha,arquivo)//escreve os dados na linha do arquivo
		}
		arq.fechar_arquivo(arquivo)
		arquivo=arq.abrir_arquivo(caminhoCusto,arq.MODO_ESCRITA)//abre arquivoCusto.txt
		para(inteiro l=0;l<2;l++){//laco de repeticao para armazenar os dados no devido arquivo
			textoLinha=matzEstoque[l][3]
			arq.escrever_linha(textoLinha,arquivo)//escreve os dados na linha do arquivo
		}
		arq.fechar_arquivo(arquivo)
		escreva("Cadastro de produtos concluido.\n\n")
		inicio()
		pare
		caso 2://										Realizar Vendas
		faca{
		titulo()
		escreva("Informe o cﾃｳdigo do produto:\n->")
		leia(cod)
		limpa()
		}enquanto(cod<0 ou cod>1)

		auxCad=matzEstoque[cod][0]

		titulo()
		escreva("Informe a quantidade vendida do produto ",auxCad,":\n->")
		leia(quantidade)
		limpa()
		enquanto(quantidade<0 ou quantidade>tp.cadeia_para_inteiro(matzEstoque[cod][3],10)){
			titulo()
			escreva("Quantidade informada nﾃ｣o existe no estoque.\n")
			escreva("Informe a quantidade vendida do produto ",auxCad,":\n->")
			leia(quantidade)
			limpa()
		}
		auxReal=tp.cadeia_para_real(matzEstoque[cod][2])//pegando o valor do custo unitario do produto (cadeia) e transformando em real
		total=quantidade*auxReal//calculando o total com base no valor unitario (total=quantidade x valor unitario)
		faca{
			titulo()
			escreva("Informe a forma de pagamento:\n(1)Dinheiro\n(2)Pix\n(3)Cartﾃ｣o\n->")
			leia(opcao)
			limpa()
		}enquanto(opcao<1 ou opcao>3)
		escolha(opcao){
			caso 1://								Pagamento em dinheiro
			titulo()
			escreva("Informe o valor pago pelo cliente:\n->")
			leia(troco)
			limpa()
			enquanto(troco<total){
				titulo()
				escreva("Valor insuficiente para a compra.\n")
				escreva("Informe o valor pago pelo cliente:\n->")
				leia(troco)
				limpa()
			}
			
			
			troco=troco-total
			escreva("Pagamento concluindo.\nDevolva um total de R$",troco," para o cliente.\n\n\n")
			viaDinheiro(quantidade,cod,total,matzEstoque)

			//funcao utilizada para salvar todas as alteracoes feitas no arquivo
			salvarValores(auxReal,matzTotal,cod,total,arquivo,caminhoReTotal,caminhoReQuantidade,textoLinha,auxInt,quantidade,matzQuantidade,matzEstoque,caminhoQuantidade)
			inicio()
			pare
			caso 2://									Pagamento em pix
			viaPix(quantidade,cod,total,matzEstoque)
			//funcao utilizada para salvar todas as alteracoes feitas no arquivo
			salvarValores(auxReal,matzTotal,cod,total,arquivo,caminhoReTotal,caminhoReQuantidade,textoLinha,auxInt,quantidade,matzQuantidade,matzEstoque,caminhoQuantidade)
			inicio()
			pare
			caso 3://									Pagamento em cartao
			faca{
			titulo()
			escreva("Informe o tipo de pagamento:\n")
			escreva("(1)Debito\n(2)Crﾃｩdito\n->")
			leia(opcao)
			limpa()
			}enquanto(opcao<1 ou opcao>2)
			se(opcao==1){
				viaCartaoDebito(quantidade,cod,total,matzEstoque)
			}senao{
				viaCartaoCredito(quantidade,cod,total,matzEstoque)
			}
			//funcao utilizada para salvar todas as alteracoes feitas no arquivo
			salvarValores(auxReal,matzTotal,cod,total,arquivo,caminhoReTotal,caminhoReQuantidade,textoLinha,auxInt,quantidade,matzQuantidade,matzEstoque,caminhoQuantidade)
			inicio()
			pare
		}	
		pare
		caso 3://Relatorio Atual
		relatorio(matzEstoque,matzTotal,matzQuantidade,auxReal)
		inicio()
		pare
		caso 4://Fechar Caixa e Sair

		pare
		caso contrario://Tratamento de erro
		inicio()
	}
	}//<--FIM DA FUNCAO INICIO
	funcao vazio titulo(){
		escreva("---------- PADARIA Pﾃグ QUENTE ----------\n\n")
	}
	funcao vazio menu(){
		escreva("(1)Cadastrar produtos\n(2)Realizar Vendas\n(3)Relatﾃｳrio Atual\n(4)Fechar caixa e sair\n->")
	}
	funcao vazio viaDinheiro(inteiro quantidade,inteiro cod,real total,cadeia matzEstoque[][]){
		escreva("PADARIA Pﾃグ QUENTE\t\t\tFONTCARD\n")
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
		escreva("PADARIA Pﾃグ QUENTE\t\t\tFONTCARD\n")
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
		escreva("PADARIA Pﾃグ QUENTE\t\t\tFONTCARD\n")
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
		escreva("PADARIA Pﾃグ QUENTE\t\t\tFONTCARD\n")
		escreva("CNPJ: 77.161.014/0001-11\n")
		escreva("\t\t\tVIA DO CLIENTE\n")
		escreva("codigo\tnome\tquantidade\tvalor UNI\n")
		escreva("",cod,"\t",matzEstoque[cod][0],"\t   ",quantidade,"\t           ",matzEstoque[cod][2],"\n")
		/*legenda da nota
		 * escreva("",codigo do produto," ",nome do produto," ",quantidade vendida," ",valor unitario,"\n")
		 */
		escreva("TOTAL\t\t\t\t\tR$",total,"\n")
		escreva("CRﾃ吋ITO APROVADO COM SENHA\n")
		escreva("\t\t\tVOLTE SEMPRE!\n")
	}
	funcao vazio salvarValores(real auxReal,cadeia matzTotal[][],inteiro cod,real total,inteiro arquivo,cadeia caminhoReTotal,cadeia caminhoReQuantidade,cadeia textoLinha, inteiro auxInt,inteiro quantidade,cadeia matzQuantidade[][],cadeia matzEstoque[][],cadeia caminhoQuantidade){
		//armazenando o total vendido do produto na matriz e depois no arquivo do relatorio
			auxReal=tp.cadeia_para_real(matzTotal[cod][1])//pegando o valor do total ate o momento na matriz e transformando em valor real
			auxReal=auxReal+total//salvando o novo valor total (novo valor=antigo valor + valor vendido)
			matzTotal[cod][1]=tp.real_para_cadeia(auxReal)//armazenando o valor na devida matriz
			//salvando as alteracoes no arquivo
			arquivo=arq.abrir_arquivo(caminhoReTotal,arq.MODO_ESCRITA)//abrindo o arquivo do relatorio total
			para(inteiro l=0;l<2;l++){//laco de repeticao utilizado para escrever os novos valores alterados
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
			para(inteiro l=0;l<2;l++){//laco de repeticao para armazenar os dados no devido arquivo
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
			para(inteiro l=0;l<2;l++){//laco de repeticao para armazenar os dados no devido arquivo
				textoLinha=matzEstoque[l][3]
				arq.escrever_linha(textoLinha,arquivo)//escreve os dados na linha do arquivo
			}
			arq.fechar_arquivo(arquivo)
			//-----
	}
	funcao vazio relatorio(cadeia matzEstoque[][],cadeia matzTotal[][],cadeia matzQuantidade[][],real auxReal){
		real totalVendas,custoProd,auxReal2=0.0,totalCaixa=0.0,custoTotal=0.0
		inteiro estoque
		escreva("-------------------------------------------------------------------\n")
		escreva("\t\t\t  RELATﾃ迭IO\n\n")
		escreva("|Codigo|     Nome      Qtd/vendida Tot/vendido Estoque Tot/custo \n")
		//								imprimindo o relatorio
		para(inteiro l=0;l<2;l++){
			totalVendas=tp.cadeia_para_real(matzTotal[l][1])//recebendo o valor total de vendas do produto
			estoque=tp.cadeia_para_inteiro(matzEstoque[l][3],10)//recebendo o valor total do estoque
			custoProd=tp.cadeia_para_real(matzEstoque[l][2])//recebendo o valor do custo de cada produto
			escreva("|  ",l,"   |     ",matzEstoque[l][0],"\t    ",matzQuantidade[l][1],"           ",matzTotal[l][1],"      ",matzEstoque[l][3],"      ",totalVendas-(custoProd*estoque),"   \n")
		}
		//									calculando o custo total
		para(inteiro l=0;l<2;l++){
			custoProd=tp.cadeia_para_real(matzEstoque[l][2])//recebendo o valor do custo de cada produto
			custoTotal=custoProd*tp.cadeia_para_inteiro(matzQuantidade[l][1],10)
		}
		//									calculos do saldo do caixa
		para(inteiro l=0;l<2;l++){//loops de utilizados para pegar o valor do total das vendas de cada produto
			para(inteiro i=1;i<2;i++){
				//recebendo o valor total de cada produto
				auxReal=tp.cadeia_para_real(matzTotal[l][1])
				auxReal2=tp.cadeia_para_real(matzTotal[i][1])
				//-----
			}
			totalCaixa=auxReal+auxReal2//calculando o valor total do caixa
		}
		//									calculando o lucro total
		
		escreva("\nTotal em caixa\t\t\t\t\t\t   R$",totalCaixa,"\n")//imprimindo o valor total do caixa
		escreva("Custo total\t\t\t\t\t\t   R$",custoTotal,"\n")
		escreva("Lucro total\t\t\t\t\t\t   R$\n")
		escreva("-------------------------------------------------------------------\n\n")
	}
}