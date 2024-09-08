### **Library Management System**
SQL implementation to design a database system for an e-library application. The application oversees multiple libraries, each hosting a diverse collection of books with varying quantities available for borrowing. Users can borrow or place holds on books (when the book is not immediately available for borrowing). 

[Complete Report](https://medium.com/@zahirilham99/implementing-sql-for-designing-e-library-rdbms-8c7130323600)

[Books Dataset](https://www.kaggle.com/datasets/jealousleopard/goodreadsbooks?resource=download)

### **Database design structure**
* Mission Statement
* Creating Table Structures
* Determine Table Relationships and Business Rules
* ERD Diagram

### **Mission Statement**
1. Providing information about libraries managed by PacLibrary
PAC-LIB will serve as a central platform that offers detailed information about libraries under its management. This could include essential details such as library locations, and collections. By integrating this information, users will have a comprehensive view of each library and its resources.

2. Offering a wide variety of books categorized by genre, title, and author
The system will host an extensive database of books, offering users the ability to explore diverse genres. Books will be searchable by title, author, and genre, enabling easy navigation and discovery. Additionally, by featuring authors and their works, PAC-LIB encourages exploration of lesser-known books and authors alongside popular ones.

3. Facilitating users in borrowing books online
PAC-LIB aims to simplify the process of borrowing books by enabling users to request books online. This feature will provide an intuitive interface for users to search for available books, place loan requests, and manage their borrowed books. A robust system for handling return deadlines, loan periods, and book availability will be crucial for a smooth user experience.

### **Creating Table Structures**
Creating the table structure for the PAC-LIB system is crucial to ensure efficient data management, easy retrieval, and scalability.
1. Libraries Table
The libraries table is designed to store details about each library managed by PacLibrary. It includes fields for the library’s name, location, and book collections. This allows users to access comprehensive information about each library and its offerings.

2. Books Table
The books table contains information about the various books available in the libraries. Key details include the title, genre, author, and publication year. It also tracks how many copies of each book are available for loan and how many are held by the library in total. Each book is associated with both a library and an author.

3. Authors Table
The authors table stores information about the authors of the books. It includes fields for the author’s first and last name, as well as their year of birth. This table is referenced by the books table to establish which author wrote each book.

4. Users Table
The users table manages user information for the PAC-LIB system. It stores the user’s name, email, hashed password, membership type, and whether the account is active. This table is essential for tracking who can borrow books from the system.

5. Loans Table
The loans table records all the book loans made by users. It tracks which user borrowed a particular book, the date of the loan, the due date, and whether the book has been returned. This table connects the users and books tables, allowing the system to monitor borrowing activities.

6. Hold Table
If PAC-LIB allows users to reserve books that are currently unavailable, the reservations table will manage this data. It tracks the user who made the reservation, the reserved book, the date of the reservation, and whether it has been fulfilled.

### **Determine Table Relationships and Business Rules:**

1. **Authors and Books (Many-to-Many Relationship)**  
   - **Tables Involved**: `authors`, `books`, and `books_author`  
   - **Relationship**: An author can write many books, and a book can have multiple authors. The `books_author` table acts as a junction table that connects `authors` and `books`.  
   - **Business Rule**: Ensure that the same book can be associated with multiple authors and vice versa. This allows flexibility for books that are co-authored.

2. **Books and Genres (Many-to-Many Relationship)**  
   - **Tables Involved**: `books`, `genres`, and `book_genre`  
   - **Relationship**: A book can belong to multiple genres, and a genre can contain many books. The `book_genre` table serves as the junction table between `books` and `genres`.  
   - **Business Rule**: A single book can be categorized into multiple genres, allowing for diverse classification options. Similarly, a genre can host a variety of books from different authors.

3. **Libraries and Books (Many-to-Many Relationship)**  
   - **Tables Involved**: `libraries`, `books`, and `library_books`  
   - **Relationship**: A library can contain multiple books, and the same book can be available in multiple libraries. The `library_books` table serves as a junction table linking `libraries` and `books`, also holding information about the number of available copies (`qty`).  
   - **Business Rule**: Track how many copies of a book are available at each library. This helps ensure inventory management and efficient distribution of books across multiple branches.

4. **Users and Loans (One-to-Many Relationship)**  
   - **Tables Involved**: `users`, `loans`, and `library_books`  
   - **Relationship**: A user can borrow multiple books, but each loan record is linked to only one book. The `loans` table records the details of the book loans, such as loan date, return date, and due date. The `library_books` table provides a reference to the specific book and its availability in the library.  
   - **Business Rule**: Users should be able to borrow multiple books, but the system needs to track loan periods, enforce return deadlines, and ensure books are marked as returned when appropriate.

5. **Users and Holds (One-to-Many Relationship)**  
   - **Tables Involved**: `users`, `holds`, and `library_books`  
   - **Relationship**: A user can place multiple holds on different books, but each hold refers to a specific book. The `holds` table tracks when a book is on hold, including the hold date, expiry date, and status.  
   - **Business Rule**: Users can reserve books that are currently checked out. The system should manage hold expiration dates and status, indicating whether a hold has been fulfilled or expired.

6. **Libraries and Users (One-to-Many Relationship)**  
   - **Tables Involved**: `libraries` and `users`  
   - **Relationship**: Users are associated with a library, typically for account management and book borrowing purposes. The `users` table holds a foreign key reference to the `libraries` table.  
   - **Business Rule**: Each user is associated with a library where they manage their account and borrow books. The system ensures that users are linked to their local branch for library-specific operations.

### **ERD Diagram**
![image](https://github.com/user-attachments/assets/86363e69-f7b4-4e79-a190-61ae06e8f07d)





