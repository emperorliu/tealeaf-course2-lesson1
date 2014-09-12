1. It is called a relational database because we are linking tables together through primary and foreign keys.

2. SQL is a special-purpose programming language designed for managing data held in a relational database management system.

3. There is the data view which is like a spreadsheet. This is where you can view all your data in separate rows. The schema view lists two columns: the name of the column and the type of column it is. 

4. the primary_key

5. The ActiveRecord pattern talks about how to abstract data from a database into a code. It is an object relational mapper. It helps translate OO code into SQL. An object correlates to one row of data, whereas the columns are the getter and setter methods 

6. A foreign_key is used on the 'many' side of a 1:M relationship and is used to make sure the data in one table relates to the table in the other. 

7. crazy_monkeys (use tableize)

8. 1 project will have many issues, so the model associations would be:
  Project model:
      has_many :issues
      foreign_key: :project_id
  Issue model:
      belongs_to :project
      foreign_key: :project_id
  The foreign_key would be project_id

9. class Animal < ActiveRecord::Base
      belongs_to :zoo
  end

  schema would be zoos table with primary key of id
                  animals table with primary key of id, and foreign_key of zoo_id

  Methods available: 
      zoo.animals (lists all the animals)
      zoo.animals.first (returns first row of data in animals table)

  zoo = Zoo.create(name: 'San Diego Zoo')
  animal = Animal.create(name: 'Jumpster')
  zoo.animals << animal 

  or animal = Animal.create(name: 'jumpster', zoo_id: 1)


10. Mass assignment allows us to assign multiple values to attributes with only a single assignment operator.

11. It returns the first object of the animals tables.

12. animal = Animal.create(name: 'Joe')
    or 
    animal = Animal.new(name: 'Joe')
    animal.save

13. It works by using a joined table.

14. We can support it through a has_many :through or a has_and_belongs_to_many approach. The latter has no join model, the problem is that you cannot put additional attributes (columns) on associations. The has_many :through has a join model.

15. We set it up with a joined table called UserGroup, so we would do something like:

    User
      has_many :user_groups, foreign_key: :user_id
      has_many :groups, through: :user_groups

    Group
      has_many :user_groups, foreign_key: :group_id
      has_many :users, through: :user_groups

    UserGroup
      belongs_to :user, foreign_key: :user_id
      belongs_to :group, foreign_key: :group_id

