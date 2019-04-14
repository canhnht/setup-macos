## Extra files

1. Download file `ignored.zip` and unzip it.

2. Copy one of these files to file `.extra`.

- `.extra.blue-nguyen`: extra things for my laptop
- `.extra.acworks-thanhcanh`: extra things for my iMac in AC Works

3. Run `./.dots all`.

4. Search for `TODO:` in script result and follow those instructions.

## Create zip of ignored files

```bash
zip ignored.zip -r .aws .ssh .extra.*
```

## Remove unused files

```bash
rm -rf .extra.* .ssh/config-* .aws/aws-*
```

## If node is not found

- Open `~/.bashrc`
- Copy the NVM script part in `~/.bashrc` to the end of `~/.bash_profile`.
