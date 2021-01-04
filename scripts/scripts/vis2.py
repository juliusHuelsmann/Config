#!/usr/bin/python
import matplotlib.pyplot as plt
import numpy as np
from os.path import expanduser
import matplotlib.dates as md
import datetime as dt


time_window_normal = 24 * 1 # 1 day
time_window_diff = 24 * 7 * 1 # 1 week

home = expanduser("~")
path= home + "/.stats/st.csv"
k=np.genfromtxt(path, dtype=str, delimiter=',')

vimIdxs = 2+np.array([4, 5, 6, 10, 15, 16, 20, 29, 30, 31, 32])
alpIdxs = 2+np.array([21, 22, 23, 24, 25, 26, 27, 28])

times = k[:,1].astype("int")
vim = k[:, vimIdxs].astype("int")
alp = k[:, alpIdxs].astype("int")

times = times / 60 / 60
vim = np.sum(vim, axis=1)
alp = np.sum(alp, axis=1)
dtimes = times[1:] - times[:-1]
dvim = (vim[1:] - vim[:-1]) / dtimes
dalp = (alp[1:] - alp[:-1]) / dtimes

idxs = [np.abs(times - t) < time_window_normal for t in times]
vimt = np.array([np.mean(vim[idx]) for idx in idxs])
alpt = np.array([np.mean(alp[idx]) for idx in idxs])

idxs2 = [np.abs(times[:-1] - t) < time_window_diff for t in times[:-1]]
dvimt = np.array([np.mean(dvim[idx]) for idx in idxs2]) * 24
dalpt = np.array([np.mean(dalp[idx]) for idx in idxs2]) * 24

plt.figure(figsize=(10, 10))
xfmt = md.DateFormatter('%Y-%m-%d')
dates=[dt.datetime.fromtimestamp(ts) for ts in times * 60 * 60]

sp = plt.subplot(2,1,1)
sp.set_title("cumulative downloads")
sp.xaxis.set_major_formatter(xfmt)
plt.plot(dates, vimt, label="vim")
plt.plot(dates, alpt, label="alpha")
plt.legend()

sp = plt.subplot(2,1,2)
sp.set_title("downloads")
sp.set_ylabel("Downloads per day")

sp.xaxis.set_major_formatter(xfmt)
plt.plot(dates[:-1], dvimt, label="vim")
plt.plot(dates[:-1], dalpt, label="alpha")
plt.plot(dates[:-1], dvimt + dalpt, label="total", color="black")



plt.show()








