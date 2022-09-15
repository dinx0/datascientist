{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "9e9f31ce",
   "metadata": {},
   "outputs": [],
   "source": [
    "!pip install pyshorteners -q\n",
    "from bs4 import BeautifulSoup\n",
    "import requests\n",
    "import pyshorteners\n",
    "from selenium import webdriver"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "017246a8",
   "metadata": {},
   "outputs": [],
   "source": [
    "l = pyshorteners.Shortener()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "d28f2b9c",
   "metadata": {},
   "outputs": [],
   "source": [
    "navegador = webdriver.Chrome()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "d14a0999",
   "metadata": {},
   "outputs": [],
   "source": [
    "def linkedin():\n",
    "  link = 'https://www.linkedin.com/jobs/cientista-de-dados-vagas/?originalSubdomain=br'\n",
    "  req = requests.get(link)\n",
    "  soup = BeautifulSoup(req.content, 'html.parser')\n",
    "\n",
    "  vaga = soup.find_all('div')\n",
    "\n",
    "  print('--------------------LINKEDIN--------------------\\n\\n\\n')\n",
    "  for i in range(10):\n",
    "    if i%2 == 0:\n",
    "      nome = str(vaga[44+i]).split('title\">')[1].split('</h3>')[0]\n",
    "      link = l.tinyurl.short(str(vaga[44+i]).split('href=')[1].split('\">')[0].split('?trk')[0]+'/jobs/')\n",
    "      local = str(vaga[44+i]).split('location\">')[1].split('</span>')[0]\n",
    "      data = str(vaga[44+i]).split('datetime=\"')[1].split('</time>')[0].split('\">')[0]\n",
    "      hora = str(vaga[44+i]).split('datetime=\"')[1].split('</time>')[0].split('\">')[1]\n",
    "      \n",
    "      print(f'{nome}\\nlink da empresa:{link}\\n{local}\\n{data}  {hora}\\n')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "78f87b8f",
   "metadata": {},
   "outputs": [],
   "source": [
    "def procurar():\n",
    "    linkedin()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "1adde1ea",
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
