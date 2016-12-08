#!/bin/bash
#Nome: Diego Freitas Justin , Data: 08/12/2016, Disciplina: Desenv. em Redes de Computadores
#O Script tem o objetivo de armazenar as informações adicionadas nas variaveis e por fim montar um comando Rsync iu SCP para enviar o backup para outro servidor
# 


menu() {    # Função principal do programa
clear       # limpa a tela

echo "1 - backup  rsync"      #imprime na tela as opções que serão abordadas no comando case
echo "2 - backup  scp"
echo "3 - Sair"
echo
echo -n "Qual a opcao desejada ? "
read opcao                                   #faz a leitura da variável "opcao" que será utilizada no comando case para indicar qual a opção a ser utilizada
                                             

case $opcao in
        1)
            clear
            oprsync

            ;;                    #Os 2 ";;" (ponto e virgula) significam que chegou ao final esta opção do comando case
        2)
            clear
            opscp ;;
        3)
            clear
            exit ;;
        *)
            opcao_invalida ;;
    esac
}
#Função Rsync
oprsync() {
	echo "1 Backup arquivos"
	echo "2 Backup pastas"
	echo "3 Menu anterior"

	echo -n "Qual a opcao desejada ? "
	read opcao_escolha_rsync               # Armazena variavel "opcao_escolha_rsync" para a opção rsync escolhida



case $opcao_escolha_rsync in
        1)
            clear
            echo -n "Qual o usuário ? "
            read user_acess
            echo -n "Qual o ip de destino ? "
            read ip_destino
            echo -n "Qual a porta destino ?"
            read porta
            echo -n "Qual é o diretório e arquivo para backup ?"
            read dir_file
            echo -n "Qual é o direório em seu computador ?"
            read dir_destino                                                          #Armazena variável "dir_destino" ao diretório escolhido do computador
            rsync -a $dir_file  P$porta $user_acess@$ip_destino:$dir_destino
            ;;
        2)
            clear
            echo -n "Qual o usuário de acesso ? "
            read user_acess
            echo -n "Qual o ip de destino ? "
            read ip_destino
            echo -n "Qual a porta do destino ?"
            read porta
            echo -n "Qual é o diretório e arquivo para o backup ?"
            read dir_file
            echo -n "Qual é o direório em seu computador ?"
            read dir_destino                                                             
            rsync -ar $dir_file -e "ssh -p$porta" $user_acess@$ip_destino:$dir_destino
            ;;
        3)
            clear
            menu
            ;;
        *)
            opcao_invalida ;;
    esac

    read pause

}
#Funcção SCP
opscp() {
    echo "1 Backup de arquivos"
    echo "2 Backup de pastas"
    echo "3 Menu anterior"
    echo "Qual a opcao desejada ? "
    read opcao_escolha_scp                 #Armazena variavel "opcao_escolha_scp" para a opção scp escolhida
    case $opcao_escolha_scp in
  1)
    clear
    echo -n "Qual o usuário de acesso ? "
    read user_acess_scp
    echo -n "Qual o ip de destino ? "
    read ip_destino_scp
    echo -n "Qual a porta do destino ?"
    read porta_scp
    echo -n "Qual o diretório e arquivo para backup ?"
    read dir_file_scp
    echo -n "Qual é o direório em seu computador ?"
    read dir_destino_scp                                                                #Armazena variável "dir_destino_scp" ao diretório escolhido do computador
    scp $dir_file_scp -P$porta_scp $user_acess_scp@$ip_destino_scp:$dir_destino_scp
    ;;
  2)
    clear
    echo -n "Qual o usuário de acesso ? "
    read user_acess_scp
    echo -n "Qual o ip de destino ? "
    read ip_destino_scp
    echo -n "Qual a porta do destino ?"
    read porta_scp
    echo -n "Qual é o diretório e arquivo para backup ?"
    read dir_file_scp
    echo -n "Qual é o direório em seu computador ?"
    read dir_destino_scp
    scp -r $dir_file_scp -P$porta_scp $user_acess_scp@$ip_destino_scp:$dir_destino_scp
    ;;
   3)
    clear
    menu
    ;;
   *) opcao_invalida;;
 esac
}

#Função de opção inválida
opcao_invalida() {
    clear
    echo "Opção Inválida"
    read pause
    menu
}
menu
