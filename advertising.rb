require 'decisiontree'
#Suppose that you want to gain some insights about customer data from your Rails Database
#If you have larger datasets, you wouldn't store it in a relational db, and you'd parse with Hadoop

# You want to determine who's your ideal customer.

# Assume the following data set about your customers and leads:


# Continuous vs. Discrete
  # Here the data is discrete vs. the sick.rb data that was continuous.

attributes = ['Age', 'Education', 'Income', 'Marital Status']

# Note that the 0 or 1 at the end of the records correspond to
# whether or not they bought that particular item (assuming this is for just one product)

training = [
  ['36-55', 'Masters', 'High', 'Single', 1],
  ['18-35', 'High School', 'Low', 'Single', 0],
  ['36-55', 'Masters', 'High', 'Single', 1],
  ['18-35', 'PhD', 'Low', 'Married', 1],
  ['< 18', 'High School', 'Low', 'Single', 1],
  ['55+', 'High School', 'High', 'Married', 0],
  ['55+', 'High School', 'High', 'Married', 1],
  ['55+', 'High School', 'High', 'Married', 1],
  ['55+', 'High School', 'High', 'Married', 1],
  ['< 18', 'Masters', 'Low', 'Single', 0],
]

#create the decision tree
#ID3 Tree pseudocode:
  #Examples (training)
  #Target_Attribute(1)
  #Attributes(attributes)
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :discrete)

#train the decision tree
dec_tree.train

#add some test data
data1 = ['18-35', 'Masters', 'High', 'Single']
data2 = ['18-35', 'PhD', 'High', 'Married']

#The results below will predict if a user will buy the product or not
p dec_tree.predict(data1)
p dec_tree.predict(data2)
