# How to add your SSH key to the server

## Initial setup (local machine)

We first need to create a ```.ssh``` directory if it does not exist and then correct the permissions.

```bash
# Create .ssh directory
mkdir -p ~/.ssh
# And restrict the permissions so only your user has access
chmod 700 ~/.ssh
```

## Generating a key pair

Now we can generate a keypair to use with the server.

```bash
ssh-keygen -t ed25519 -f ~/.ssh/seedlab_key
```

When prompted to set a password, just hit enter to allow for ssh without a password.

This should generate two files: ```seedlab_key``` (your private key) and ```seedlab_key.pub``` (your public key)

Now update the permissions on your private key:

```bash
chmod 600 ~/.ssh/seedlab_key
```

Now print out the contents of ```seedlab_key.pub``` that is your public key and what you will be adding to the server.

```bash
cat ~/.ssh/seedlab_key.pub
```
![Cat out the key](images/print_out_public_key.png)


## Adding your public key to the server

Now log into the server as normal, and open a terminal.
Now we will create a ```.ssh``` directory on the server if it does not exist and then correct the permissions like we did earlier.

```bash
# Create the directory if it doesn't exist
mkdir -p ~/.ssh

# And restrict the permissions so only your user has access
chmod 700 ~/.ssh
```

Now create the authorized_keys file:

```bash
# Create the authorized_keys file in ~/.ssh
touch ~/.ssh/authorized_keys

# Update the permissions on the file
chmod 600 ~/.ssh/authorized_keys
```

Now edit the file in your favorite editor and paste in your public key.

```bash
nano ~/.ssh/authorized_keys
```

![Add your key](images/add_your_key.png)

Now save the file and you have added your key to the server.

## Editing your SSH config to use your key

Now go back to your own local machine and create a ssh config if it does not already.

```bash
# Create the file
touch ~/.ssh/config

# And update the permissions
chmod 600 ~/.ssh/config
```

Now edit the file in your editor and paste the following in:

```
Host seedlab
    Hostname 10.3.28.23
    User seed
    IdentityFile ~/.ssh/seedlab_key
```

Now save the file and now you should be able to run this command to connect to the server

```bash
ssh seedlab
```