#!/bin/bash

clear

echo "--------------------------------------------------"
echo "| Olá! Seja bem vindo ao organizador de músicas! |"
echo "--------------------------------------------------"

echo "--------------------Iniciando---------------------"

datainicial=`date +%s`

if [ -e Organizadas/ ]
then
	rm -rf Organizadas/*
else
	mkdir Organizadas
fi

#Percorre todos os arquivos da pasta
for arq in $( ls music/ ); do

	#Cria uma pasta com o nome do artista
	if [ ! -d Organizadas/$(echo "$arq" | cut -d '-' -f 3) ] ; then
		mkdir Organizadas/$(echo "$arq" | cut -d '-' -f 3)
	fi
	
	#Busca todos os arquivos do mesmo artista
	ARQ_ARTISTAS=`find music/ -name *$(echo "$arq" | cut -d '-' -f 3)*`

	#Percorre todos os artistas
	for art in $ARQ_ARTISTAS; do

		if [ ! -d "Organizadas/$(echo "$arq" | cut -d '-' -f 3)/$(echo "$arq" | cut -d '-' -f 2)" ] ; then

			#Cria pasta com nome do album se ela não existir
			mkdir Organizadas/$(echo "$arq" | cut -d '-' -f 3)/$(echo "$arq" | cut -d '-' -f 2)
		
			#Busca as musicas que estão no mesmo album
			ARQ_MUSICAS=`find music/ -name *$(echo "$arq" | cut -d '-' -f 2)-$(echo "$arq" | cut -d '-' -f 3)*`

			for mus in $ARQ_MUSICAS; do
				mv $mus Organizadas/$(echo "$arq" | cut -d '-' -f 3)/$(echo "$arq" | cut -d '-' -f 2)/
				echo $mus
				QTD=$(($QTD + 1))
			done
		fi
	done
done
rm music/*

datafinal=`date +%s`
soma=`expr $datafinal - $datainicial`
resultado=`expr 10800 + $soma`
tempo=`date -d @$resultado +%H:%M:%S`
echo ""
echo ""
echo ""
echo ""
echo "-------------------Finalizando--------------------"
echo ""
echo ""
echo ""
echo ""
echo "-------------------Finalizado---------------------"
echo "--------------------------------------------------"
echo "|     Pronto! $QTD músicas foram organizadas     |"
echo "|             Tempo gasto: $tempo              |"
echo "--------------------------------------------------"


