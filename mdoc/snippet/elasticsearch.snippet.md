curl -i -u elastic:Pekalles12#$ 


> curl -i -u elastic:Pekalles12#$   \ 
> es1.pekall.com:9200/fooindex/_search?pretty&q=title:2012&sort=year:desc&from/=0&size=10



# exclude fields
```sh

# 其中通配符类似bash globbing, 不是正则表达式
GET /_search
{
    "_source": {
        "include": [
            "obj1*",
            "obj2*"
        ],
        "exclude": [

            "test*"
        ]
    },

    "query": {
        "term": {
            "user": "kimchy"
        }
    }
}


curl "localhost:9200/<index>/_doc/1?_source_excludes=description"

```