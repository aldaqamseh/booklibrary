BEGIN TRANSACTION;

DROP TABLE IF EXISTS books_character;
DROP TABLE IF EXISTS user_books;
DROP TABLE IF EXISTS forum_comments;
DROP TABLE IF EXISTS forum_posts;
DROP TABLE IF EXISTS character;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;

CREATE TABLE users
(
  user_id serial PRIMARY KEY,
  username varchar(255) NOT NULL UNIQUE,
  -- Username
  password varchar(32) NOT NULL,
  -- Password
  salt varchar(256) NOT NULL,
  -- Password Salt
  role varchar(255) NOT NULL default('user')
);

CREATE TABLE books
(

  book_id SERIAL PRIMARY KEY,
  title VARCHAR NOT NULL,
  author VARCHAR NOT NULL,
  genre VARCHAR NOT NULL,
  description VARCHAR NOT NULL,
  publish_date DATE NOT NULL,
  date_added DATE NOT NULL DEFAULT CURRENT_DATE,
  img_url VARCHAR,
  isbn VARCHAR UNIQUE NOT NULL

);

CREATE TABLE character
(

  character_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL

);

CREATE TABLE books_character
(
  character_id integer REFERENCES character(character_id) NOT NULL,
  book_id integer REFERENCES books (book_id) NOT NULL,
  PRIMARY KEY (character_id, book_id)
);

CREATE TABLE forum_posts
(

  post_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users (user_id) NOT NULL,
  title VARCHAR NOT NULL,
  body VARCHAR NOT NULL,
  date_posted DATE DEFAULT CURRENT_DATE

);

CREATE TABLE forum_comments
(

  comment_id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES forum_posts (post_id) NOT NULL,
  user_id INTEGER REFERENCES users (user_id) NOT NULL,
  body VARCHAR NOT NULL,
  date_posted DATE DEFAULT CURRENT_DATE
);


CREATE TABLE user_books
(
  user_id integer REFERENCES users (user_id) NOT NULL,
  book_id integer REFERENCES books (book_id) NOT NULL
);


INSERT INTO books
  (title, author, genre, description, publish_date, img_url, isbn)
VALUES
  ('Moby Dick', 'Herman Melville', 'Novel', 'A classic piece of American literature, Moby Dick is the 1851 novel by American writer Herman Melville. It''s sailor Ishmael''s narrative of the obsessive quest of Ahab, captain of the whaling ship Pequod, for revenge on Moby Dick, the white whale that bit off Ahab''s leg at the knee.', '1851-10-18', 'http://d.gr-assets.com/books/1327940656l/153747.jpg', '9781974305032'),
  ('A Study in Scarlet', 'Sir Aurthur Conan Doyle', 'Mystery', 'In A Study in Scarlet, Holmes and Watson''s first mystery, the pair are summoned to a south London house where they find a dead man whose contorted face is a twisted mask of horror. The body is unmarked by violence but on the wall a mysterious word has been written in blood.', '1887-11-01', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1519031842l/102868._SX318_.jpg', '9781514698853'),
  ('Harry Potter and the Goblet of Fire', 'J.K. Rowling', 'Fantasy', 'Harry Potter is midway through his training as a wizard and his coming of age. Harry wants to get away from the pernicious Dursleys and go to the International Quidditch Cup. He wants to find out about the mysterious event that''s supposed to take place at Hogwarts this year, an event involving two other rival schools of magic, and a competition that hasn''t happened for a hundred years. He wants to be a normal, fourteen-year-old wizard. But unfortunately for Harry Potter, he''s not normal - even by wizarding standards. And in his case, different can be deadly.', '2000-07-08', 'https://universe.byu.edu/wp-content/uploads/2015/01/HP4cover.jpg', '9780439139601'),
  ('The Hobbit', 'J.R.R Tolkien', 'Fantasy', 'In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort.', '1937-09-21', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546071216l/5907.jpg', '9780547928227'),
  ('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Fantasy', 'The Dursleys were so mean and hideous that summer that all Harry Potter wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he''s packing his bags, Harry receives a warning from a strange, impish creature named Dobby who says that if Harry Potter returns to Hogwarts, disaster will strike.', '1998-07-02', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474169725l/15881._SY475_.jpg', '9780439064866'),
  ('Cross My Heart', 'James Patterson', 'Thriller', 'James Patterson raises the stakes to their highest level, ever-when Alex Cross becomes the obsession of a genius of menace set on proving that he is the greatest mind in the history of crime. Detective Alex Cross is a family man at heart--nothing matters more to him than his children, his grandmother, and his wife Bree. His love of his family is his anchor, and gives him the strength to confront evil in his work. One man knows this deeply, and uses Alex''s strength as a weapon against him in the most unsettling and unexpected novel of James Patterson''s career.', '2013-11-25', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1410755815l/17333277.jpg', '9781455515813'),
  ('Cross the Line', 'James Patterson', 'Thriller', 'Under pressure from the mayor, Alex Cross steps into the leadership vacuum to investigate the case. But before Cross can make any headway, a brutal crime wave sweeps across the region. The deadly scenes share only one common thread – the victims are all criminals. And the only thing more dangerous than a murderer without a conscience, is a killer who thinks he has justice on his side.', '2016-11-03', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1463969607l/28936152.jpg', '9781455585328'),
  ('The Cat in the Hat', 'Dr. Seuss', 'Children', 'Poor Sally and her brother. It''s cold and wet and they''re stuck in the house with nothing to do . . . until a giant cat in a hat shows up, transforming the dull day into a madcap adventure and almost wrecking the place in the process!', '1957-03-12', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1468890477l/233093._SX318_.jpg', '9780394800011'),
  ('Steve Jobs', 'Walter Isaacson', 'Biography', 'Based on more than forty interviews with Jobs conducted over two years—as well as interviews with more than a hundred family members, friends, adversaries, competitors, and colleagues—Walter Isaacson has written a riveting story of the roller-coaster life and searingly intense personality of a creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.', '2011-10-24', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1511288482l/11084145._SY475_.jpg', '9781451648539'),
  ('It', 'Stephen King', 'Horror', 'Welcome to Derry, Maine ...It’s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real … They were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But none of them can withstand the force that has drawn them back to Derry to face the nightmare without an end, and the evil without a name.', '1987-10-01', 'https://i.kinja-img.com/gawker-media/image/upload/s--xBB6_siF--/c_scale,f_auto,fl_progressive,q_80,w_800/paavpdqsbtggtmn4smxs.png', '9781982127794');

INSERT INTO character
  (name)
VALUES
  ('Captain Ahab'),
  ('Moby Dick'),
  ('Ishmael'),
  ('Sherlock Holmes'),
  ('Inspector Lestrade'),
  ('John H. Watson'),
  ('Harry Potter'),
  ('Hermione Granger'),
  ('Lord Voldemort'),
  ('Bilbo Baggins'),
  ('Gandalf'),
  ('Smaug'),
  ('Alex Cross'),
  ('John Sampson'),
  ('Marcus Sunday'),
  ('The Cat in the Hat'),
  ('Thing One'),
  ('Thing Two'),
  ('Steve Jobs'),
  ('Steve Wozniak'),
  ('Lisa Brennan-Jobs'),
  ('Beverly Marsh'),
  ('Richie Tozier'),
  ('Eddie Kaspbrak');

INSERT INTO books_character
  (character_id, book_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 2),
  (6, 2),
  (7, 3),
  (7, 5),
  (8, 3),
  (8, 5),
  (9, 3),
  (9, 5),
  (10, 4),
  (11, 4),
  (12, 4),
  (13, 6),
  (13, 7),
  (14, 6),
  (14, 7),
  (15, 6),
  (15, 7),
  (16, 8),
  (17, 8),
  (18, 8),
  (19, 9),
  (20, 9),
  (21, 9),
  (22, 10),
  (23, 10),
  (24, 10);

INSERT INTO users
  (username, password, salt, role)
VALUES
  ('joe123', 'kfKzfkfNYLVHGifwiWIxHg==', '2M+EYZILBznO5Z/hydTbYra4huWJ/5jgl3tq+B0td4VthG6K9L11o+a+kVunB9FZt6U6xOGe4OVJw+iU+/pIWBUwJNW94ZgZn8zIgM3zQL8r6PtUFYWW7UGfLbN7HYtfrr26cFECAA8XKzoCJousXyy5j55YdDvXvKUEtqomZ1o=', 'user'),
  ('luke123', '7Fk21PHEBkle2hBXOh5xCw==', 'e0rpDnBUBIwHeLaFhDD83VerZDN15j0UPQ+2d5qzVxVbxXFRc8o+YnuXuFUOUBx6tP4skuK1OZ9Sx67h5VeA57tuFR1lZw/wfG6FvHawev+sGbzZ2682tKTMc1XWgGiDnvhXUB+NAA4EZwgLsxB+e3TWrbOTE5BGQe+W3MBbylM=', 'user'),
  ('moh123', '7Fk21PHEBkle2hBXOh5xCw==', 'e0rpDnBUBIwHeLaFhDD83VerZDN15j0UPQ+2d5qzVxVbxXFRc8o+YnuXuFUOUBx6tP4skuK1OZ9Sx67h5VeA57tuFR1lZw/wfG6FvHawev+sGbzZ2682tKTMc1XWgGiDnvhXUB+NAA4EZwgLsxB+e3TWrbOTE5BGQe+W3MBbylM=', 'user'),
  ('kt123', 'cke7ZHiOikYXrAa/TOz6zg==', 'Y/Vrvivba8tRgnOFxNJs0gpDxdyFENK0aikSdyM3PvETLkFU9Kz2YuBLKHG/65pS2gIB3JU40ftfrXKBELQE99gy4M8O1s4YgvyF8E3ipjixt9GjtaNjjTlPhrs4O6bXchDfd1x0csx1ufSk7ULWYhkhAWppJf2peHpMaCBGdcQ=', 'user'),
  ('admin124', 'sJAZKd0P3Qwdl7gNxIm5pw==', 'dHj2Bp60feGi2YSm2L3kqllVpIRpEQSDqVoJgCr/eSyPW8Q3cJyKNlk8j9kUZbt5EGvBMz8fSSYDcLma3rMovFQVjx5yz1XDkQStYvz5XODDxB4rnhKMjwYmPfbJmSIaxCQOeo50bhDJXD/stM8GNOnVT5V7XnKZB6/gTZiDfDo=', 'admin');

INSERT INTO forum_posts
  (user_id, title, body)
VALUES
  (1, 'Loved "It"', 'The book IT, by Stephen King was a great coming of age tale about a lonely clown searcing for love in all the wrong places. Why were those children constantly running away? All he wanted was a friend. I think we''ve all been in that place friends, let''s not judge.');



COMMIT TRANSACTION;

