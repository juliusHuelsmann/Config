#!/usr/bin/python
import matplotlib.pyplot as plt
import numpy as np
from os.path import expanduser

versionsAlpha = ["alpha 11-19", "alpha 12-19", "alpha 02-02", "alpha 02-02 HEAD"]
versionsVim = ["vim 11-19", "vim 12-19", "vim 02-02 HEAD", "vim 02-02"]

green = [
        (.4,.8,.4,.5),
        (.3,.6,.2,.5),
        (.2,.6,.2,.5),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
        (.2,.6,.2,1),
]

blue=[
        (.4,.4,.8,.5),
        (.35,.35,.8,.5),
        (.3,.3,.85,.5),
        (.25,.25,.9,.5),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
        (.2,.2,.9,1),
]


home = expanduser("~")
path= home + "/.stats/st.csv"

k=np.genfromtxt(path, dtype=str, delimiter=',')

if len(k.shape) == 2:

    arr=k[:,1:-1].astype(float)
    arr[:,0] = arr[:,0]/(60.*60.*24)
    arr[:,0] = arr[:,0] - arr[0,0]
    plt.figure()


    def interpol(ts, valueSet, maxDiff, interpolAmount):
        k = np.linspace(ts[0], ts[-1], interpolAmount)
        val = [np.zeros(k.shape) for i in range(len(valueSet))]

        for idx, t1 in enumerate(k):
            sdiff = 0.
            for idxa, t2 in enumerate(ts):
                diff = abs(t1 - t2)
                if diff < maxDiff:
                    diff = (maxDiff - diff) / maxDiff
                    for i, vs in enumerate(valueSet): val[i][idx] += vs[idxa] * diff
                    sdiff += diff

            if sdiff: 
                for i in range(len((valueSet))): val[i][idx] /= sdiff
            else: print("select sdiff larger!")
        return k, val
        



    def visualizeAll():

        plt.subplot(2, 1, 1)

        iter = 1
        sum = np.zeros(arr[:,1].shape)
        for en, t in enumerate(versionsAlpha): 
            plt.plot(arr[:,0], arr[:,iter], label=t, color=green[en], linewidth=.8)
            sum += arr[:,iter]
            iter += 1
        plt.plot(arr[:,0], sum, label="alpha total", color=green[-1], linewidth=.8)

        sum = np.zeros(arr[:,1].shape)
        for en, t in enumerate(versionsVim): 
            plt.plot(arr[:,0], arr[:,iter], label=t, color=blue[en], linewidth=.8)
            sum += arr[:,iter]
            iter += 1
        plt.plot(arr[:,0], sum, label="vim total", color=blue[-1], linewidth=.8)


        downSum=           np.sum(arr[:,1:], axis=1)
        plt.plot(arr[:,0], downSum, label="sum", color="black", linewidth=.8)
        


        for i in range(15):
            w = .5 / (i+1)
            clrs = blue + green
            k, ves = interpol(arr[:,0], [arr[:,i] for i in range(1,arr.shape[1])] , maxDiff = 5 + (i+1)*.4, interpolAmount=100)

            for j, res in enumerate(ves):
                plt.plot(k, res, color = clrs[j], linewidth=w);
            
            s1 = np.sum(ves[:len(versionsAlpha)], axis=0)
            s2 = np.sum(ves[len(versionsVim):], axis=0)

            plt.plot(k, s1, color=green[-1], linewidth=w*2)
            plt.plot(k, s2, color=blue[-1], linewidth=w*2)

            #plt.plot(k, s1 + s2, color="black", linewidth=w)

        plt.ylim(0 , downSum[-1])
        plt.legend(loc="upper left")
        plt.title("Total downloads: " + str(downSum[-1]))

    def visualizeDiff():
        divisor = np.array([arr[i + 1,0] - arr[i ,0] for i in range(arr.shape[0] - 1)])
        diffsAl = np.array([np.array([arr[i + 1,k] - arr[i ,k] for i in range(arr.shape[0] - 1)]) / 24./ divisor for k in range(len(versionsAlpha))])
        diffsVm = p.array([np.array([arr[i + 1,k] - arr[i ,k] for i in range(arr.shape[0] - 1)]) / 24./ divisor for k in range(len(versionsVim))])

        sp = plt.subplot(2, 1, 2)
        sp.set_title("Download/hour for each datapoint")
        diffsAlp = np.sum(diffsAl, axis=0)
        diffsVim = np.sum(diffsVm, axis=0)
        downSum  = diffsAlp + diffsVim
        plt.scatter(arr[1:,0], diffsAl0, marker="x", label="alpha 2019-11", color=blue0, s=11)
        plt.scatter(arr[1:,0], diffsAl1, marker="x", label="alpha 2019-12", color=blue1, s=11)
        plt.scatter(arr[1:,0], diffsAlpha, marker="x",label="vim", color=bluea, s=11)

        plt.scatter(arr[1:,0], diffsVim0, marker="x",label="vim 2019-11", color=green0, s=11)
        plt.scatter(arr[1:,0], diffsVim1, marker="x",label="vim 2019-12", color=green1, s=11)
        plt.scatter(arr[1:,0], diffsVim, marker="x",label="vim", color=greena, s=11)

        plt.scatter(arr[1:,0], downSum, marker="x",label="sum", color="black", s=11)

        for i in range(15):
            k, [al0, al1, vi0, vi1] = interpol(arr[1:,0], [diffsAl0, diffsAl1, diffsVim0, diffsVim1], maxDiff = 5 + (i+1)*.4, interpolAmount=100)
            w = .5 / (i+1)
            plt.plot(k, al0, color=blue0, linewidth=w)
            plt.plot(k, al1, color=blue1, linewidth=w)
            al = al0+al1
            plt.plot(k, al, color=bluea, linewidth=w)

            plt.plot(k, vi0, color=green0, linewidth=w)
            plt.plot(k, vi1, color=green1, linewidth=w)
            vi = vi0+vi1
            plt.plot(k, vi, color=greena, linewidth=w)
            plt.plot(k, al + vi, color="black", linewidth=w)
        
        plt.ylim(0 , np.max(downSum))


    visualizeAll()
    #visualizeDiff()
    plt.show()
