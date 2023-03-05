from sklearn import neural_network
import numpy as np

name=[]
mcg=[]
gvh=[]
alm=[]
mit=[]
erl=[]
pox=[]
vac=[]
nuc=[]
clas=[]
f=open("yeast.DATA","r")


for rows in f:
    elements=rows.split()
    name.append(elements[0])
    mcg.append(elements[1])
    gvh.append(elements[2])
    alm.append(elements[3])
    mit.append(elements[4])
    erl.append(elements[5])
    pox.append(elements[6])
    vac.append(elements[7])
    nuc.append(elements[8])
    clas.append(elements[9])



arr1=np.array(mcg[:1113]+gvh[:1113]+alm[:1113]+mit[:1113]+erl[:1113]+pox[:1113]+vac[:1113]+nuc[:1113])
mat1= np.reshape(arr1,(8,-1))
mat1=np.transpose(mat1)

date_train = mat1.astype(float)
etichete_train = clas[:1113]


arr2=np.array(mcg[1113:]+gvh[1113:]+alm[1113:]+mit[1113:]+erl[1113:]+pox[1113:]+vac[1113:]+nuc[1113:])
mat2= np.reshape(arr2,(8,-1))
mat2=np.transpose(mat2)

date_test = mat2.astype(float)
etichete_test = clas[1113:]



learn_rate=[0.1,0.01]
rate=[]


for lr in learn_rate:
    nrcorrect=0    
    clf = neural_network.MLPClassifier(hidden_layer_sizes=(8)  ,learning_rate_init=lr, max_iter=1000)
    clf.fit(date_train,etichete_train)
    predictii = clf.predict(date_test)
    for i in range(predictii.size):
        if predictii[i]==etichete_test[i]:
            nrcorrect=nrcorrect+1    
    print("Acuratete= %.2f" % ((nrcorrect/predictii.size)*100)+"%")
    rate.append(nrcorrect/predictii.size)
    
    nrcorrect=0    
    clf = neural_network.MLPClassifier(hidden_layer_sizes=(8,8)  ,learning_rate_init=lr, max_iter=1000)
    clf.fit(date_train,etichete_train)
    predictii = clf.predict(date_test)
    for i in range(predictii.size):
        if predictii[i]==etichete_test[i]:
            nrcorrect=nrcorrect+1    
    print("Acuratete= %.2f" % ((nrcorrect/predictii.size)*100)+"%")
    rate.append(nrcorrect/predictii.size)
    
    nrcorrect=0    
    clf = neural_network.MLPClassifier(hidden_layer_sizes=(8,4)  ,learning_rate_init=lr,max_iter=1000)
    clf.fit(date_train,etichete_train)
    predictii = clf.predict(date_test)
    for i in range(predictii.size):
        if predictii[i]==etichete_test[i]:
            nrcorrect=nrcorrect+1    
    print("Acuratete= %.2f" % ((nrcorrect/predictii.size)*100)+"%")
    rate.append(nrcorrect/predictii.size)


suma=0
for val in rate:
    suma=suma+val
        
print("Acuratete medie= %.2f%%" % ((suma/len(rate))*100) )
