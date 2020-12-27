from tkinter import *
import pandas as pd
import html5lib
import matplotlib.pyplot as plt
import seaborn as sns
import os
import urllib.request
import zipfile
import io
import datetime
import time
import codecs


def carrega_ipca():
    for widget in root.winfo_children():
        print(widget)
        if('menu' not in str(widget)):
            widget.forget()

    mensagem = 'Esta opção do menu será utilizada para carregar o IPCA.'
    show_text = Label(root, text=mensagem).pack()
    print(mensagem)
    print()


root = Tk()

root.geometry('650x550+500+300')
root.title('Big Data Econômico')

menubar = Menu(root)

carrega_dados = Menu(menubar, tearoff=0)
carrega_dados.add_command(label="IPCA", command=carrega_ipca)
menubar.add_cascade(label="Coletar dados", menu=carrega_dados)

root.config(menu=menubar)
root.mainloop()
