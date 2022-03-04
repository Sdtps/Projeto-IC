#!/bin/bash
# Limpa a tela para melhorar a visualização das opções;
clear
        echo
        echo " Script de Gestão das Aplicações"
# Mostrando as opções para o user;
        echo -e "\n > Digite 1 para Start;"
        echo -e "\n > Digite 2 para Stop;"
        echo -e "\n > Digite 3 para Status;"
	echo
# Recebendo input do user;
        echo -n "   Digite um numero; "
# Lendo input do user;
        read nun
# Confirmação do inpute do user;
        echo -n "   Numero digitado;" $nun
        echo
# Condições;
 case $nun in
1) 
        docker-compose up -d # Inicia a stack do docker-compose;
 ;;

2) 
        docker-compose down # Encerra a stack;
 ;;

3) 
        docker-compose ps && docker-compose logs # Verifica o status da steck;
 ;;

 esac

 if [ $nun -eq 1 -o $nun -eq 2 -o $nun -eq 3 ] # Se o caracter informado não for 1 2 ou 3 será informado uma mesagem de erro ao user;
 then
        echo ""
 else
        echo -e "\n   Opção Invalida"
 fi
