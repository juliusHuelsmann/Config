#!/usr/bin/python
import matplotlib.pyplot as plt
import numpy as np
from os.path import expanduser

green0=(.4,.8,.4,.5)
green1=(.2,.6,.2,.5)
greena=(.2,.6,.2,1)

blue0=(.4,.4,.8,.5)
blue1=(.2,.2,.6,.5)
bluea=(.2,.2,.6,1)

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
        downSum=           np.sum(arr[:,1:], axis=1)
        plt.plot(arr[:,0], arr[:,1], label="alpha 11-2019", color=blue0, linewidth=.8)
        plt.plot(arr[:,0], arr[:,2], label="alpha 12-2019", color=blue1, linewidth=.8)
        plt.plot(arr[:,0], arr[:,1] + arr[:,2], label="alpha total", color=bluea, linewidth=.8)
        plt.plot(arr[:,0], arr[:,3], label="vim 11-2019", color=green0, linewidth=.8)
        plt.plot(arr[:,0], arr[:,4], label="vim 12-2019", color=green1, linewidth=.8)
        plt.plot(arr[:,0], arr[:,3] + arr[:,4], label="vim total", color=greena, linewidth=.8)
        plt.plot(arr[:,0], downSum, label="sum", color="black", linewidth=.8)
        


        for i in range(15):
            w = .5 / (i+1)
            k, [al0, al1, vi0, vi1] = interpol(arr[:,0], [arr[:,1], arr[:,2], arr[:,3], arr[:,4]], maxDiff = 1 + (i+1)*.4, interpolAmount=100)

            plt.plot(k, al0, color=blue0, linewidth=w)
            plt.plot(k, al1, color=blue1, linewidth=w)
            al = al0+al1
            plt.plot(k, al, color=bluea, linewidth=w)


            plt.plot(k, vi0, color=green0, linewidth=w)
            plt.plot(k, vi1, color=green1, linewidth=w)
            vi = vi0+vi1
            plt.plot(k, vi, color=greena, linewidth=w)

            plt.plot(k, al + vi, color="black", linewidth=w)

        plt.ylim(0 , downSum[-1])
        plt.legend(loc="upper left")
        plt.title("Total downloads: " + str(downSum[-1]))

    def visualizeDiff():
        divisor = np.array([arr[i + 1,0] - arr[i ,0] for i in range(arr.shape[0] - 1)])
        diffsAl0 = np.array([arr[i + 1,1] - arr[i ,1] for i in range(arr.shape[0] - 1)]) / 24./ divisor
        diffsAl1 = np.array([arr[i + 1,2] - arr[i ,2] for i in range(arr.shape[0] - 1)]) / 24./ divisor
        diffsVim0 = np.array([arr[i + 1,3] - arr[i ,3] for i in range(arr.shape[0] - 1)]) / 24./ divisor
        diffsVim1 = np.array([arr[i + 1,4] - arr[i ,4] for i in range(arr.shape[0] - 1)]) / 24./ divisor
        

        sp = plt.subplot(2, 1, 2)
        sp.set_title("Download/hour for each datapoint")
        diffsVim = diffsVim0 + diffsVim1
        diffsAlpha = diffsAl0 + diffsAl1
        downSum=           diffsAlpha + diffsVim
        plt.scatter(arr[1:,0], diffsAl0, marker="x", label="alpha 2019-11", color=blue0, s=11)
        plt.scatter(arr[1:,0], diffsAl1, marker="x", label="alpha 2019-12", color=blue1, s=11)
        plt.scatter(arr[1:,0], diffsAlpha, marker="x",label="vim", color=bluea, s=11)

        plt.scatter(arr[1:,0], diffsVim0, marker="x",label="vim 2019-11", color=green0, s=11)
        plt.scatter(arr[1:,0], diffsVim1, marker="x",label="vim 2019-12", color=green1, s=11)
        plt.scatter(arr[1:,0], diffsVim, marker="x",label="vim", color=greena, s=11)

        plt.scatter(arr[1:,0], downSum, marker="x",label="sum", color="black", s=11)

        for i in range(15):
            k, [al0, al1, vi0, vi1] = interpol(arr[1:,0], [diffsAl0, diffsAl1, diffsVim0, diffsVim1], maxDiff = 1 + (i+1)*.4, interpolAmount=100)
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
    visualizeDiff()
    plt.show()
