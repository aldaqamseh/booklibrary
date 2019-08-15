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
  user_username VARCHAR REFERENCES users (username) NOT NULL,
  title VARCHAR NOT NULL,
  body VARCHAR NOT NULL,
  date_posted DATE DEFAULT CURRENT_DATE

);

CREATE TABLE forum_comments
(

  comment_id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES forum_posts (post_id) NOT NULL,
  user_username VARCHAR REFERENCES users (username) NOT NULL,
  body VARCHAR NOT NULL,
  date_posted DATE DEFAULT CURRENT_DATE
);
/*CREATE TABLE forum_posts
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
);*/


CREATE TABLE user_books
(
  user_id integer REFERENCES users (user_id) NOT NULL,
  book_id integer REFERENCES books (book_id) NOT NULL,
  completed BOOLEAN DEFAULT false
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
  ('It', 'Stephen King', 'Horror', 'Welcome to Derry, Maine ...It’s a small city, a place as hauntingly familiar as your own hometown. Only in Derry the haunting is real … They were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But none of them can withstand the force that has drawn them back to Derry to face the nightmare without an end, and the evil without a name.', '1987-10-01', 'https://i.kinja-img.com/gawker-media/image/upload/s--xBB6_siF--/c_scale,f_auto,fl_progressive,q_80,w_800/paavpdqsbtggtmn4smxs.png', '9781982127794'),
  ('Player Piano', 'Kurt Vonnegut', 'Fiction', 'Kurt Vonnegut’s first novel spins the chilling tale of engineer Paul Proteus, who must find a way to live in a world dominated by a supercomputer and run completely by machines. Paul’s rebellion is vintage Vonnegut—wildly funny, deadly serious, and terrifyingly close to reality.', '2006-09-13', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1506301341l/9597._SY475_.jpg', '903489823'),
  ('The Alchemist', 'Paulo Coelho', 'Fiction', 'Paulo Coelho''s enchanting novel has inspired a devoted following around the world. This story, dazzling in its powerful simplicity and soul-stirring wisdom, is about an Andalusian shepherd boy named Santiago who travels from his homeland in Spain to the Egyptian desert in search of a treasure buried near the Pyramids. Along the way he meets a Gypsy woman, a man who calls himself king, and an alchemist, all of whom point Santiago in the direction of his quest. No one knows what the treasure is, or if Santiago will be able to surmount the obstacles in his path. But what starts out as a journey to find worldly goods turns into a discovery of the treasure found within. Lush, evocative, and deeply humane, the story of Santiago is an eternal testament to the transforming power of our dreams and the importance of listening to our hearts.', '2014-04-15', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1466865542l/18144590._SY475_.jpg', '9788576653721'),
  ('The Left Hand of Darkness', 'Ursula Le Guin', 'Science Fiction', 'A groundbreaking work of science fiction, The Left Hand of Darkness tells the story of a lone human emissary to Winter, an alien world whose inhabitants can choose—and change—their gender. His goal is to facilitate Winter''s inclusion in a growing intergalactic civilization. But to do so he must bridge the gulf between his own views and those of the completely dissimilar culture that he encounters.', '2000-07-01', 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1488213612l/18423._SY475_.jpg', '980124702');

INSERT INTO character (name)
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
  (user_username, title, body)
VALUES
  ('luke123', 'Do you think Tolkien knew how popular the word ''Hobbit'' would become?', 'I mean think about it, the man wrote these books before the cell phone was even an idea in someones head, and now the word Hobbit is almost recognized everywhere.. I feel like that''s pretty incredible, what about you guys?'),
  ('kt123', 'I don''t like Harry Potter (Unpopular opinion by a landslide)', 'I think J.K Rowling was always a better storyteller than a writer. I read the Harry Potter series recently and I kept seeing so many plotholes. So, so many plotholes. Why would they guard the philosopher''s stone with riddles, not locks? Why didn''t Fred and George ever say something about Ron being with a man named Peter throughout book 1 and 2? The final book also wasn''t as good of a payoff either. The hallows just came out of nowhere, instead of focusing on the horcruxes like it should''ve (in my opinion). I still enjoyed reading it when I first read it as a non-enthusiast, but as the years went on I began to not like it as much. I think the way characters interact is really great, until the 5th book where Harry becomes an edgy angst lord. There are just so many things I realize isn''t all that great about this series. Please tell me what you think.'),
  ('moh123', 'East of Eden has broken my heart, put it back together, and it will still never be whole again', 'I finished ‘East of Eden’ about 4 months ago during a warm sunset in Miami, in a brick courtyard with a soft fountain burbling away and students bustling around. The breeze blew softly while I did everything I could not to tear up in public. This book has stuck with me and I still sit up at night thinking about it. I’ve read ‘The Awakening’, ‘Huckleberry Finn’, ‘Wuthering Heights’, ‘The Grapes of Wrath’, ‘The Great Gatsby’, and so many more well-written, poignant novels. But East of Eden won’t leave me. No book has come closer to expressing my outlook on life in general. How life is filled with boundless tragedy, how some of us can handle it and some cannot, how we all so desperately want to be good yet still do evil, and how the story of life is written in generations.'),
  ('luke123', 'I just read ''Player Piano'' and now I hate my job.', 'A week or so ago I finished read Kurt Vonnegut''s Player Piano. It was a fantastic read but has left me hating my job. I work at a factory and can''t help but be reminded of the way they held up engineers and management on a pedistal everytime I come into work. Has anyone else had similar experiences with fiction, or non-fiction books, changing their perspectives?'),
  ('kt123', 'Just completed reading my first book', 'I''ve been thinking to get into reading since a very long time but for some reason I couldn''t. I either didn''t have enough motivation or I wasn''t consistent enough. I''d start reading a book and forget about it the next day. But a friend suggested "the alchemist" and I was totally immersed in it. I completed it in 3 days (around 5 hours of reading) and I''m very proud of myself. I hope this doesn''t end here and I keep on exploring books.'),
  ('joe123', '“The Left Hand of Darkness” by Ursula K. Le Guin should be the gold standard of science fiction', 'I see a lot of posts on this sub related to science fiction, and I don’t think this book gets enough credit. The intricacy of the plot, the depth of the characters, and the all-encompassing portrait of the foreign planet “Gethen”, complete with its own societal constructs, religion, and different nations, make this work a true MASTERPIECE of science fiction. I don’t want to take anything away from other great science fiction works like Dune or Ender’s Game or The Lord of the Rings, etc, etc, but TLHOD is not has a great plot, but it has great allegory; it really makes you think about how your life is shaped by things like societal norms, weather, “truth”, relationships, religion, and most importantly gender. The writing is so intentional with every sentence, and it only gets more complex with every re-read. Le Guin deserves every word of the praise that she gets, but the praise that she gets isn’t even half of what she deserves.'),
  ('joe123', 'Loved "It"', 'The book IT, by Stephen King was a great coming of age tale about a lonely clown searcing for love in all the wrong places. Why were those children constantly running away? All he wanted was a friend. I think we''ve all been in that place, let''s not judge.');

INSERT INTO forum_comments
(post_id, user_username, body)
VALUES
(7, 'luke123', 'I totally agree, friendship isn''t easy to come by, especially in your 20''s, also the ''Loser Club'' is very derogatory.'),
(7, 'kt123', 'Are you serious? Clowns are terrifying. I would run as fast as I could'),
(7, 'moh123', 'THIS. Clown culture needs to end. Seriously.'),
(7, 'joe123', 'I think you both are being very close minded and missing the point of my post.'),
(7, 'kt123', 'And YOU are crazy if you think Clowns + Kids = Friendship.'),

(1, 'luke123', 'Let me know what you think :)'),
(1, 'kt123', 'Haha great point! I never thought about that.'),
(1, 'moh123', 'He would be so proud. Hobbit should be added to the Dictionary!'),
(1, 'joe123', 'I''ve never read the Hobbit but I agree'),
(1, 'kt123', 'Honestly, not missing much. Downvote me all you want.'),

(2, 'luke123', 'The series is fun and I loved it. But it is full of moments as a reader where you realize, “Hang on, if X exists in the magical world then why didn’t they use it back in book Y to solve problem Z?”'),
(2, 'kt123', 'Yeah, it''s full to the brim with literal magic macguffins. You can''t expect a seamless plot when the basis of the story teaching children to use catastrophically powerful weapons that double as plot hole filler sticks as needed'),
(2, 'moh123', 'It''s fine to not like things.'),
(2, 'joe123', 'The realization that a fun children''s series, or series you can enjoy like a child, is not great literature can be traumatizing. Roll with it. Life will be full of experiences like this and would be a lot less interesting without them.'),
(2, 'kt123', 'A part of my soul shattered when I tried to reread David Eddings in my thirties.'),

(3, 'luke123', 'East of Eden is my favorite book, too. I’d like to read it again, and you just convinced me. Steinbeck is so brilliant with words. Cannery Row is another of his great classics. EoE stuck with me too, for a long, long time.'),
(3, 'kt123', 'I''ve commented this before, but East of Eden was so good that when I first started it, I put it back down because I just wasn''t ready to have it end. I picked it up years later and finished it, then named one of my twins Cal. I love it so so much.'),
(3, 'moh123', 'I’ve found that readers that focus mostly on the story and plot don’t enjoy EoE as much as people who are more imaginative and visual....the world building is beautiful...I could almost feel the dust in the Salinas valley and imagine myself there. For me it evoked intense feelings of melancholy and wanderlust'),
(3, 'joe123', 'I didn''t like this book either. I actually thought the start was the best part, but got really tedious as it went on.'),
(3, 'kt123', 'That''s funny, I always tell people you have to get through the first 150-200 pages of the novel. I disagree with the others, I think it does pick up a lot'),

(4, 'kt123', 'Welcome to Vonnegut'),
(4, 'luke123', 'Oh no what have I done.'),
(4, 'moh123', 'Was about to say. That''s not a side effect, it''s a feature.'),
(4, 'joe123', 'This ''Looking for Alaska'' passage still haunts me: "You spend your whole life stuck in the labyrinth, thinking about how you''ll escape one day, and how awesome it will be, and imagining that future keeps you going, but you never do it. You just use the future to escape the present."'),
(4, 'kt123', 'Probably in my top 3 Vonnegut books. My father has worked in a factory for 15 years and said the exact same things!'),

(5, 'luke123', 'Good for you! Taking that initial jump of getting into a book is the hardest part! It only gets better from here!'),
(5, 'kt123', 'I hope it does...'),
(5, 'moh123', 'Congrats mate! Reading is so rewarding and I am happy to hear you picked up the hobby. You''ve got so much content to discover!'),
(5, 'joe123', 'Congrats, man! I am 23 and read my first book last year. I am on my 18th book now. I feel bad that I didn''t start reading earlier. But, better late than never I guess.'),
(5, 'kt123', 'That was my first book too, an amazing book to into reading.'),

(6, 'luke123', 'I''ve added the book to my ever growing list of things to read. Have to say though, you placing LotR in the Science Fiction category is bothering me more than it should.'),
(6, 'kt123', 'Their flippant use of the Science Fiction label aside, I can definitely recommend the book too. It''s the first book I have read every day until finished in 3 or 4 years.'),
(6, 'moh123', 'Everything by LeGuin is a treasure. I also especially enjoyed The Dispossessed, and The Lathe of Heaven. If you haven''t read those yet, you are missing out.'),
(6, 'joe123', 'I totally agree. Love Le Guin. One of the greatest writers of fiction ever to live.'),
(6, 'kt123', 'I always start to read and stop in the first chapter. One day I''ll be able to read it all.');

COMMIT TRANSACTION;
