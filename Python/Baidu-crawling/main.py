import requests
import time
import urllib.parse
import threading

#定义一个类
class crawling():
    #初始化类内部的参数
    def __init__(self):
        self.headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36'}
        self.url = 'https://image.baidu.com/search/acjson?tn=resultjson_com&logid={}&ipn=rj&ct=201326592&is=&fp=result&fr=&word={}&queryWord={}&cl=2&lm=-1&ie=utf-8&oe=utf-8&adpicid=&st=-1&z=&ic=&hd=&latest=&copyright=&s=&se=&tab=&width=&height=&face=0&istype=2&qc=&nc=1&expermode=&nojc=&isAsync=&pn={}&rn=60&gsm={}&1717648477383='
        #线程数
        self.thread_lock = threading.BoundedSemaphore(value=10)

    #方法，需要传入该类的对象
    #获取代理的ip地址
    def get_ip(self):
        #代理API链接
        url = "放置自己的代理API链接"
        while 1:
            try:
                #请求代理IP
                r = requests.get(url, timeout=10)
            except:
                continue

            ip = r.text.strip()
            if '请求过于频繁' in ip:
                print('IP请求频繁')
                time.sleep(2)
                continue
            break
        proxies = {
            'https': '%s' % ip
        }
        return proxies

    #获取一页的url地址
    def get_pages_url_from_keyword(self,keyword='黑丝',pages=1):
        #调整url的参数
        data = pages*30
        hex_data = hex(data)
        #日志
        logid_value = 7933136880885264200 + pages
        #转码
        #将中文编码
        kw_label = urllib.parse.quote(keyword)
        #定义一个字典，存储各个参数
        params = {
            'logid': logid_value,
            'queryWord': kw_label,
            'word': kw_label,
            'pn': data,
            'gsm': hex_data,
        }
        #将初始化的url格式化，并传入参数，得到每页的url地址
        urls = self.url.format(params['logid'],params['queryWord'],params['word'],params['pn'],params['gsm'])
        #返回url地址
        return urls

    #输入每页的url地址中，返回一个包含当前页所有图片的url地址的列表
    def get_images_url(self,url,IP='True',**kwargs):
        #定义一个列表
        middleURLs = []
        #使用IP代理
        if IP == 'True':
            resp = requests.get(url=url, headers=self.headers, proxies=kwargs['proxies'])
        #使用本地IP
        else:
            resp = requests.get(url=url, headers=self.headers)

        #将响应数据转换为json格式
        json_data =resp.json()
        #获取键名为data的键值
        json_list = json_data['data']
        #从切片列表中迭代出每个字典元素，进行循环
        for data in json_list[:-1]:
            #获取键名为middleURL的键值
            middleURL = data['middleURL']
            #将middleURL键值添加到列表中
            middleURLs.append(middleURL)
        #返回列表
        return middleURLs

    #输入一张图片的url地址，保存至本地
    def wr_image(self,image_url,number):
            image_data = requests.get(image_url).content
            with open(f'images/{number}.jpg', mode='wb') as f:
                f.write(image_data)
            #解锁
            #释放进程
            self.thread_lock.release()

if __name__ == "__main__":
    keyword = '辣妹'
    pages_num = 1
    number = 0
    crawling = crawling()
    #爬取页数
    for pages in range(1,pages_num+1):
        if pages%5 == 0:#每5页休眠10s，间隔爬取时间，避免被封
            time.sleep(10)
        proxies = crawling.get_ip()#获取代理IP
        #获取每页的url地址
        page_url = crawling.get_pages_url_from_keyword(keyword=keyword,pages=pages)
        #获取每页的url中包含图片url地址的列表
        images_url = crawling.get_images_url(url=page_url,IP='True',proxies=proxies,)
        #迭代列表中的每个元素
        for image_url in images_url:
            #上锁
            #此时未指定的程序无法使用进程资源
            crawling.thread_lock.acquire()
            #将函数分配给进程，函数独自使用进程资源
            t = threading.Thread(target=crawling.wr_image,args=(image_url,number))
            #开启进程
            t.start()
            number += 1
            print(number)