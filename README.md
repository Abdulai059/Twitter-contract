# Simple Post Smart Contract

This is a Solidity-based smart contract that allows users to create and retrieve posts on the Ethereum blockchain. It demonstrates basic CRUD functionality in a decentralized environment.

## Features

- Users can create posts with a title and content.
- Retrieve all posts made globally by all users.
- Retrieve posts created by a specific address.
- Emits an event whenever a new post is created.

## Smart Contract Overview

The contract consists of the following components:

### Structs

- **`Post`**: Represents a single post with the following attributes:
  - `author`: The address of the user who created the post.
  - `title`: The title of the post.
  - `content`: The content of the post.
  - `timestamp`: The time when the post was created.

### Mappings and Arrays

- **`posts`**: A dynamic array storing all posts globally.
- **`userPosts`**: A mapping of user addresses to an array of posts created by that user.

### Events

- **`PostCreated`**: Triggered whenever a new post is created. Includes:
  - `author`: The address of the user who created the post.
  - `title`: The title of the post.
  - `content`: The content of the post.

### Functions

1. **`createPost(string memory _title, string memory _content)`**
   - Allows a user to create a new post.
   - Adds the post to the global array and the user-specific mapping.
   - Emits the `PostCreated` event.
   - Parameters:
     - `_title`: The title of the post.
     - `_content`: The content of the post.

2. **`getAllPosts()`**
   - Retrieves all posts made globally.
   - Returns:
     - An array of all `Post` structs.

3. **`getPostsByAddress(address _user)`**
   - Retrieves posts created by a specific user.
   - Parameters:
     - `_user`: The address of the user whose posts are to be retrieved.
   - Returns:
     - An array of `Post` structs for the specified user.

## Usage

### Prerequisites

- Install [Remix](https://remix.ethereum.org/) or any Solidity-compatible development environment.
- A web3 wallet like MetaMask to deploy and interact with the smart contract.

### Deployment Steps

1. Open the smart contract file in your development environment.
2. Compile the contract using Solidity `^0.8.0`.
3. Deploy the contract on your desired Ethereum network (e.g., Ethereum testnets like Goerli or Sepolia).

### Interaction

- **Creating a Post**:
  - Call the `createPost` function with the title and content as arguments.
- **Retrieving All Posts**:
  - Call the `getAllPosts` function to fetch all posts globally.
- **Retrieving Posts by User**:
  - Call the `getPostsByAddress` function with the user's Ethereum address.

## Example

### Create a Post
```solidity
createPost("My First Post", "This is the content of my first post.");
