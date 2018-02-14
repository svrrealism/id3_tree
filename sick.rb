require 'decisiontree'

attribute = ['Temp']

#training data set
training = [
  [98.7, 'healthy'],
  [99.1, 'healthy'],
  [99.5, 'sick'],
  [100.5, 'sick'],
  [102.5, 'very sick'],
  [107.5, 'dead'],
]

#create a var for a decision tree
dec_tree = DecisionTree::ID3Tree.new(attribute, training, 'sick', :continuous)

#train the decision tree
dec_tree.train

#supply some inputs to test the decision tree
data1 = [98.5, 'healthy']
data2 = [106.5, 'healthy']

#returns a value of healthy as expected
puts dec_tree.predict(data1)

#notice how it returns a value of dead even though we specified healthy, above.
puts dec_tree.predict(data2)
