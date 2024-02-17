import Map "mo:base/HashMap";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import Text "mo:base/Text";
import Error "mo:base/Error";

actor Library {

  type Book = {
      name: Text;
      year: Nat;
      writer: Text;
      description: Text;
      inUse: Bool;
      user: Text;
      readCount: Nat;
  };
   
  func natHash (n: Nat) : Hash.Hash{
      Text.hash(Nat.toText(n))
  };

  var books = Map.HashMap<Nat, Book>(0, Nat.equal, natHash);
  var nextBookId : Nat =   0;

  public func createBook(name: Text, year: Nat, writer: Text, description: Text) : async Nat {
    let id = nextBookId;
    let existingBook = books.get(id);
    if (existingBook != null) {
      throw Error.reject("A book with this name already exists.");
    } else {
      books.put(id, {
        name = name;
        year = year;
        writer = writer;
        description = description;
        inUse = false;
        user = "";
        readCount =   0;
      });
      nextBookId +=   1;
      id;
    }
  };

  public func borrowBook(id: Nat, user: Text) : async () {
    switch (books.get(id)) {
      case (?book) {
        if (not book.inUse) {
          books.put(id, {book with inUse = true; user = user;});
        } else {
          throw Error.reject("Book is already in use.");
        }
      };
      case null {
        throw Error.reject("Book not found.");
      };
    };
  };

  public func returnBook(id: Nat) : async () {
    switch (books.get(id)) {
      case (?book) {
        if (book.inUse) {
          books.put(id, {book with inUse = false; user = ""; readCount = book.readCount +   1;});
        } else {
            throw Error.reject("Book is not in use.");
        }
      };
      case null {
        throw Error.reject("Book not found.");
      };
    };
  };

  public query func listBooks() : async Text {
    var output : Text = "\n_____Books_____\n";
    for (book in books.vals()) {
      output #= "\n" # book.name;
      if (book.inUse) {
        output #= "| used by:" # book.user # " | description: " # book.description # " | read " # Nat.toText(book.readCount) # " times\n";
      } else {
        output #= " Not in use now  | description: " # book.description # " | read " # Nat.toText(book.readCount) # " times)\n";
      }
    };
    output # "\n"
  };
};