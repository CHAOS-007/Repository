# Software configuration

## Node.js

### Problems

`npm`, referred to *node package manager*, is used to manage node packages as named. However, due to its server located outside China, it is hard to get a smooth package managing experience inside GFW. `cnpm` is a replacement, known as a  fully cloned node repository, held by *taobao.org*, at the frequency of 10 min.

### Solutions

To set up `cnpm`, there are three methods. Each of them takes different effects.

**Method 1 : Temporary**

```
npm --registry https://registry.npm.taobao.org install [dependency name]
```

**Method 2 : Permanent**

```
npm config set registry https://registry.npm.taobao.org
```

This will set `https://registry.npm.taobao.org` as default registry, so if you want to use packages privately published to npm by your company, `npm` will fail.

To check if this method takes effect, use `npm config get registry`.

**Method 3 : Compromised** (tested and do work)

```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

This will install the command `cnpm`. Therefore, every time you want to install a package from `npm`, you can use `cnpm` instead.

**Method 4 : Alias**

By the way, setting a alias is also acceptable. But this changes nothing on `npm`.

```
alias cnpm="npm --registry=https://registry.npm.taobao.org \
      --cache=$HOME/.npm/.cache/cnpm \ ​ 
      --disturl=https://npm.taobao.org/dist \
      --userconfig=$HOME/.cnpmrc"
```

OR, you can alias it in the `.${shellName}rc` file like this :

```
echo '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npm.taobao.org \ 
     --cache=$HOME/.npm/.cache/cnpm \ 
     --disturl=https://npm.taobao.org/dist \ 
     --userconfig=$HOME/.cnpmrc"' >> ~/.zshrc && source ~/.zshrc
```

### Usage

`cnpm` supports all commands from `npm` but `publish`.
`cnpm` has a unique command : `cnpm sync connect`.

## Ubuntu Package Repository

Due to the default server of **Ubuntu repository** is outside China, it is too slow to use. Fortunately, there are several cloned repositories in China, called *mirrors*. 

If you are using a college network, please choose these mirrors below.

```
https://mirrors.tuna.tsinghua.edu.cn/
https://mirrors.ustc.edu.cn/
```

Otherwise, you can use these.

```
https://mirrors.aliyun.com/
https://mirrors.163.com/
```

After making up your decision, modify the file, `/etc/apt/sources.list`, with your preferred text editor and the `sudo` previlage. For example, `sudo vim /etc/apt/sources.list`. Just replace all the addresses with your choice.

## ufw

`ufw` is a system firewall management software.

To enable `ufw` to run when start up :

```
sudo ufw enable
```

To allow or deny a port, such as 8080 :

```
sudo ufw allow 8080
sudo ufw deny 8080
```

To recall the allow or deny operation :

```
sudo ufw delete allow 8080
sudo ufw delete deny 8080
```

## To Be Continued