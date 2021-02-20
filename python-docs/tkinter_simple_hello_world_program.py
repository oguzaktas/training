import tkinter as tk


class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.hi_there = tk.Button(self, fg="#456369")
        self.quit = tk.Button(self, text="QUIT", fg="red",
                              command=self.master.destroy)
        self.master = master
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        self.hi_there["text"] = "Hello World\n(click me)"
        self.hi_there["command"] = self.say_hi
        self.hi_there.pack(side="top")
        self.quit.pack(side="bottom")

    @staticmethod
    def say_hi():
        print("hi there, everyone!")


root = tk.Tk()
app = Application(master=root)
# app.configure(width=350, height=350, background='#d5dee0')
app.mainloop()
