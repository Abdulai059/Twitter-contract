// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

// Define the Simple Post Smart Contract
contract PostContract {
    // Struct to represent a Post
    struct Post {
        address author; // Address of the post creator
        string title; // Title of the post
        string content; // Content of the post
        uint256 timestamp; // Timestamp of the post creation
    }

    // Array to store all posts
    Post[] private posts;

    // Mapping to store posts created by a specific user address
    mapping(address => Post[]) private userPosts;

    // Event to notify when a new post is created
    event PostCreated(address indexed author, string title, string content);

    // Function to create a new post
    function createPost(string memory _title, string memory _content) public {
        // Create a new Post struct instance
        Post memory newPost = Post({
            author: msg.sender, // Set the author as the sender
            title: _title, // Set the title of the post
            content: _content, // Set the content of the post
            timestamp: block.timestamp // Set the current timestamp
        });

        // Add the new post to the global posts array
        posts.push(newPost);

        // Add the new post to the user's posts mapping
        userPosts[msg.sender].push(newPost);

        // Emit the PostCreated event
        emit PostCreated(msg.sender, _title, _content);
    }

    // Function to retrieve all posts
    function getAllPosts() public view returns (Post[] memory) {
        return posts;
    }

    // Function to retrieve posts created by a specific address
    function getPostsByAddress(address _user)
        public
        view
        returns (Post[] memory)
    {
        // Return the array of posts created by the specified address
        return userPosts[_user];
    }
}
