#15. Faça um algoritmo que leia dois valores correspondentes a anos e mostre quantos anos bissextos existem entre eles. (A diferença entre os anos não pode ser maior que 1000)
anoinput1 = int(input('Insira o ano da primeira data: '))
anoinput2 = int(input('Insira o ano da segunda data: '))
anosbissextos = 0
if anoinput1 > anoinput2:
  maior = anoinput1
  menor = anoinput2
else:
    maior = anoinput2
    menor = anoinput1
while (maior - menor) >= 1000:
  print('Insira anos com intervalos menores que 1000')
  anoinput1 = int(input('Insira o ano da primeira data: '))
  anoinput2 = int(input('Insira o ano da segunda data: '))
while menor <= maior:
  if 0 == menor % 4:
    anosbissextos = anosbissextos + 1
    menor = menor + 4
  else:
    menor = menor + 1
if anoinput1 > anoinput2:
  print('A quantidade de anos bissextos entre os anos {} e {} é de {} (incluindo os extremos)'.format(anoinput2, anoinput1, anosbissextos))
else:
    print('A quantidade de anos bissextos entre os anos {} e {} é de {} (incluindo os extremos)'.format(anoinput1, anoinput2, anosbissextos))