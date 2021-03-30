import pandas as pd


# import data
data = pd.read_csv('cmc.data', header=None)
data.columns = ['wife_age', 
                'wife_education',
                'husband_education',
                'number_of_children',
                'wife_religion',
                'wife_not_working',
                'husband_occupation',
                'standard_of_living',
                'media_exposure',
                'contraceptive_method']

# create target column
data['target'] = [1 if x == 1 else 0 for x in data['contraceptive_method'] ]

data[['target']].groupby('target').size()

# split in train test
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X.drop('target', index=1), data['target'], test_size=0.33, random_state=42)

#=========================
# modelling
#=========================

from sklearn.model_selection import cross_validate
from sklearn.metrics import roc_auc_score, accuracy_score

scoring = {'roc_auc_score': roc_auc_score, 'accuracy_score': accuracy_score}
tree =  tree.DecisionTreeClassifier()
scores = cross_validate(tree, X.drop('target', index=1), data['target'], scoring=scoring)

scores['accuracy_score']
scores['roc_auc_score']

# arvore de decisao

from sklearn import tree




# random forest

# knn