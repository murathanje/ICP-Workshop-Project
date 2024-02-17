# Library Project

This project is a web application developed for the Internet Computer platform using the Motoko programming language. It serves as a template for developers to start building their own web applications on the Internet Computer.

## Purpose

The `Library` actor is a simple library management system that allows users to create, borrow, and return books. It also keeps track of how many times each book has been read.

## Main Technologies

- **Motoko Programming Language**: Used for backend development.
- **Internet Computer SDK**: Used for deploying and managing canisters.

## Codebase Organization

The project is organized into a backend and a frontend. The backend is written in Motoko and contains the `Library` actor, which manages the books. The frontend interacts with the backend through the Internet Computer SDK.

## Backend

The backend is located in the `src/library_project_backend/` directory. It contains the `main.mo` file, which defines the `Library` actor and its associated types and functions.

### Library Actor

The `Library` actor has the following public functions:

- `createBook(name: Text, year: Nat, writer: Text, description: Text) : async Nat`: Creates a new book with the given details and returns its ID.
- `borrowBook(id: Nat, user: Text) : async ()`: Borrows a book with the given ID for the specified user.
- `returnBook(id: Nat) : async ()`: Returns a book with the given ID.
- `listBooks() : async Text`: Lists all books in the library, including their read count.

## Frontend

The frontend is located in the `src/library_project_frontend/` directory. It interacts with the backend through the Internet Computer SDK and provides a user interface for managing books.

## Running the Project Locally

To run the project locally, follow these steps:

1. Start the local Internet Computer replica with `dfx start --clean` and split your terminal.
2. Deploy the canisters using the `dfx deploy` command.

The application will be available at `http://localhost:4943?canisterId={asset_canister_id}`.

## Deployment

To deploy the project to the Internet Computer, use the `dfx deploy` command. The URLs for the frontend and backend canisters will be displayed in the terminal after deployment.

## Contributing

Contributions are welcome! Please read the contributing guidelines before submitting a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.