import t as tk
import t.ttk as ttk

win = tk.Tk()

win.title("Calculator")

# win.geometry('350x350+500+200')

# win.configure(width=350, height=350, background='#d5dee0')
# win.configure(background='#d5dee0')

expr = ''

text = tk.StringVar()


def press(num):
    global expr
    expr += str(num)
    text.set(expr)


def press_equal():
    global expr
    total = str(eval(expr))
    text.set(total)


def press_clr():
    global expr
    expr = ''
    text.set(expr)


entry = ttk.Entry(win, justify='right', textvariable=text)
entry.grid(row=0, columnspan=4, sticky="nsew")

button_1 = ttk.Button(win, text='1', command=lambda: press(1))
button_1.grid(row=1, column=0)
button_2 = ttk.Button(win, text='2', command=lambda: press(2))
button_2.grid(row=1, column=1)
button_3 = ttk.Button(win, text='3', command=lambda: press(3))
button_3.grid(row=1, column=2)
button_division = ttk.Button(win, text="/", command=lambda: press('/'))
button_division.grid(row=1, column=3)
button_4 = ttk.Button(win, text='4', command=lambda: press(4))
button_4.grid(row=2, column=0)
button_5 = ttk.Button(win, text='5', command=lambda: press(5))
button_5.grid(row=2, column=1)
button_6 = ttk.Button(win, text='6', command=lambda: press(6))
button_6.grid(row=2, column=2)
button_7 = ttk.Button(win, text='7', command=lambda: press(7))
button_multiply = ttk.Button(win, text="*", command=lambda: press('*'))
button_multiply.grid(row=2, column=3)
button_7.grid(row=3, column=0)
button_8 = ttk.Button(win, text='8', command=lambda: press(8))
button_8.grid(row=3, column=1)
button_9 = ttk.Button(win, text='9', command=lambda: press(9))
button_9.grid(row=3, column=2)
button_subtract = ttk.Button(win, text='-', command=lambda: press('-'))
button_subtract.grid(row=3, column=3)
button_0 = ttk.Button(win, text='0', command=lambda: press(0))
button_0.grid(row=4, column=0)
button_dot = ttk.Button(win, text='.', command=lambda: press('.'))
button_dot.grid(row=4, column=1)
button_clear = ttk.Button(win, text="C", command=press_clr)
button_clear.grid(row=4, column=2)
button_addition = ttk.Button(win, text='+', command=lambda: press('+'))
button_addition.grid(row=4, column=3)
button_equal = ttk.Button(win, text="=", command=press_equal)
button_equal.grid(row=5, columnspan=4, sticky='nsew')

win.mainloop()
