import tkinter as tk
from tkinter import messagebox

def is_leap_year(year):
    """Fungsi untuk mengecek apakah tahun merupakan tahun kabisat."""
    if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
        return True
    return False

def calculate_leap_years():
    """Fungsi untuk menghitung tahun kabisat antara tahun awal dan tahun akhir."""
    try:
        start_year = int(entry_start_year.get())
        end_year = int(entry_end_year.get())
        
        if start_year > end_year:
            messagebox.showerror("Error", "Tahun awal harus lebih kecil atau sama dengan tahun akhir.")
            return
        
        leap_years = [year for year in range(start_year, end_year + 1) if is_leap_year(year)]
        
        result_text.set("Tahun kabisat antara {} dan {}:\n{}".format(start_year, end_year, ", ".join(map(str, leap_years))))
    except ValueError:
        messagebox.showerror("Error", "Masukkan tahun dalam format angka.")

# Membuat GUI menggunakan tkinter
root = tk.Tk()
root.title("Penghitung Tahun Kabisat")

tk.Label(root, text="Tahun Awal:").grid(row=0, column=0, padx=10, pady=10)
entry_start_year = tk.Entry(root)
entry_start_year.grid(row=0, column=1, padx=10, pady=10)

tk.Label(root, text="Tahun Akhir:").grid(row=1, column=0, padx=10, pady=10)
entry_end_year = tk.Entry(root)
entry_end_year.grid(row=1, column=1, padx=10, pady=10)

tk.Button(root, text="Submit", command=calculate_leap_years).grid(row=2, column=0, columnspan=2, padx=10, pady=10)

result_text = tk.StringVar()
result_label = tk.Label(root, textvariable=result_text)
result_label.grid(row=3, column=0, columnspan=2, padx=10, pady=10)

root.mainloop()