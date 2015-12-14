file = File.new("97.csv", "r+")
file_processado = File.new("97_processado.csv", "a")
while (line = file.gets)
  colunas = line[-18..-2] # pega os últimos 18 caracteres (N&N&Y&N&N & N&Y&N&N)
  trata_de = ''
  para = ''
  cinco = colunas[0..8] # os 8 primeiros para tratar coluna trata_de
  cinco_split = cinco.split('&')
  idx = cinco_split.index('Y')
  if idx == 0
    trata_de = 'Conceito'
  elsif idx == 1
    trata_de = 'Processo'
  elsif idx == 2
    trata_de = 'Ferramenta'
  elsif idx == 3
    trata_de = 'Sincronismo'
  elsif idx == 4
    trata_de = 'Estudo de Caso'
  end
  cinco_split = trata_de

  quatro = colunas[-7..-1] # pega os 9 últimos para tratar coluna para
  quatro_split = quatro.split('&')
  idx = quatro_split.index('Y')
  if idx == 0
    para = 'Planejar'
  elsif idx == 1
    para = 'Implementar'
  elsif idx == 2
    para = 'Analisar'
  elsif idx == 3
    para = 'Adaptar'
  end
  quatro_split = para

  colunas = cinco_split + ' & ' + quatro_split
  line[-18..-1] = colunas
  file_processado.write(line+"\n"+'\hline'+"\n")
end
file_processado.close
file.close
