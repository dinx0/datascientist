from datetime import datetime
from typing import List, Any

nomes=['Ana', 'Joaquim', 'Bruna', 'Sergio']

datas = [datetime(1991, 5, 20), datetime(1992, 12, 5), datetime(1973, 3, 2), datetime(1995, 6, 18)]

codigos = [1000000, 122222, 133333, 144444]

text=''
for nomes, datas, codigos in zip(nomes, datas, codigos):
    text += '\nA data de nascimento de {} é {} e o código é {}'.format(nomes, datas, codigos)
    text += '\n{}, {}, {}'.format(nomes, datas, codigos)

    print(text)
