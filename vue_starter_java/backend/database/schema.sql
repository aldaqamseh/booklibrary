BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS books;

CREATE TABLE users (
  id serial PRIMARY KEY,
  username varchar(255) NOT NULL UNIQUE,     -- Username
  password varchar(32) NOT NULL,      -- Password
  salt varchar(256) NOT NULL,          -- Password Salt
  role varchar(255) NOT NULL default('user')
);

CREATE TABLE books (

  id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  author VARCHAR NOT NULL,
  genre VARCHAR NOT NULL,
  description VARCHAR NOT NULL,
  publishdate DATE NOT NULL

);

INSERT INTO books (title, author, genre, description, publishdate)
VALUES
('Moby Dick', 'Herman Melville', 'Novel', 'A classic piece of American literature, Moby Dick is the 1851 novel by American writer Herman Melville. It''s sailor Ishmael''s narrative of the obsessive quest of Ahab, captain of the whaling ship Pequod, for revenge on Moby Dick, the white whale that bit off Ahab''s leg at the knee.', '1851-10-18'),
('A Study in Scarlet', 'Sir Aurthur Conan Doyle', 'Mystery', 'In A Study in Scarlet, Holmes and Watson''s first mystery, the pair are summoned to a south London house where they find a dead man whose contorted face is a twisted mask of horror. The body is unmarked by violence but on the wall a mysterious word has been written in blood.', '1887-11-01'),
('Harry Potter and the Goblet of Fire', ' J.K. Rowling', 'Fantasy', 'Harry Potter is midway through his training as a wizard and his coming of age. Harry wants to get away from the pernicious Dursleys and go to the International Quidditch Cup. He wants to find out about the mysterious event that''s supposed to take place at Hogwarts this year, an event involving two other rival schools of magic, and a competition that hasn''t happened for a hundred years. He wants to be a normal, fourteen-year-old wizard. But unfortunately for Harry Potter, he''s not normal - even by wizarding standards. And in his case, different can be deadly.', '2000-07-08'),
('The Hobbit', 'J.R.R Tolkien', 'Fantasy', 'In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.', '09/21/1937'),
('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Fantasy', 'The Dursleys were so mean and hideous that summer that all Harry Potter wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he''s packing his bags, Harry receives a warning from a strange, impish creature named Dobby who says that if Harry Potter returns to Hogwarts, disaster will strike.', '1998-07-02'),
('Cross My Heart', 'James Patterson', 'Thriller', 'James Patterson raises the stakes to their highest level, ever-when Alex Cross becomes the obsession of a genius of menace set on proving that he is the greatest mind in the history of crime. Detective Alex Cross is a family man at heart--nothing matters more to him than his children, his grandmother, and his wife Bree. His love of his family is his anchor, and gives him the strength to confront evil in his work. One man knows this deeply, and uses Alex''s strength as a weapon against him in the most unsettling and unexpected novel of James Patterson''s career.', '2013-11-25'),
('Cross the Line', 'James Patterson', 'Thriller', 'Under pressure from the mayor, Alex Cross steps into the leadership vacuum to investigate the case. But before Cross can make any headway, a brutal crime wave sweeps across the region. The deadly scenes share only one common thread – the victims are all criminals. And the only thing more dangerous than a murderer without a conscience, is a killer who thinks he has justice on his side.', '2016-11-03'),
('The Cat in the Hat', 'Dr. Seuss', 'Children', 'Poor Sally and her brother. It''s cold and wet and they''re stuck in the house with nothing to do . . . until a giant cat in a hat shows up, transforming the dull day into a madcap adventure and almost wrecking the place in the process!', '1957-03-12'),
('Steve Jobs', 'Walter Isaacson', 'Biography', 'Based on more than forty interviews with Jobs conducted over two years—as well as interviews with more than a hundred family members, friends, adversaries, competitors, and colleagues—Walter Isaacson has written a riveting story of the roller-coaster life and searingly intense personality of a creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.', '2011-10-24'),
('It', 'Stephen King', 'Horror', 'Welcome to Derry, Maine ...It’s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real … They were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But none of them can withstand the force that has drawn them back to Derry to face the nightmare without an end, and the evil without a name.', '1987-10-01');



COMMIT TRANSACTION;
