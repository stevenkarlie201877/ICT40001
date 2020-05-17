import pprint
import requests
from lxml import etree


def get_table_from_html(html):
    tree = etree.HTML(html)
    # find table data tag
    table_lst = tree.xpath("//table")
    table_data_lst = []
    for table in table_lst:
        table_data_lst.append(get_table(table))

    return table_data_lst


def get_table(table_ele):
    """
    get table data
    :param table_ele:
    :return:
    """
    tr_lst = table_ele.xpath(".//tr")
    # get title
    title_data = get_title(tr_lst[0])
    # get data
    data = get_data(tr_lst[1:])

    return {
        'title': title_data,
        'data': data
    }


def get_title(tr_ele):
    """
    get title
    :param tr_ele:
    :return:
    """
    # find th tag
    title_lst = get_tr_data_by_tag(tr_ele, 'th')
    if not title_lst:
        title_lst = get_tr_data_by_tag(tr_ele, 'td')

    return title_lst


def get_data(tr_lst):
    """
    get data
    :param tr_lst:
    :return:
    """
    datas = []
    for tr in tr_lst:
        tr_data = get_tr_data_by_tag(tr, 'td')
        datas.append(tr_data)

    return datas


def get_tr_data_by_tag(tr, tag):
    """
    :param tr:
    :param tag:
    :return:
    """
    datas = []
    nodes = tr.xpath(".//{tag}".format(tag=tag))
    for node in nodes:
        text = node.xpath('string(.)').strip()
        datas.append(text)

    return datas


def get_html(url):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36',
    }
    res = requests.get(url, headers=headers)
    res.encoding = 'utf-8'
    return res.text


def run():
    #Mel
    # url = 'https://app.powerbi.com/view?r=eyJrIjoiODBmMmE3NWQtZWNlNC00OWRkLTk1NjYtMjM2YTY1MjI2NzdjIiwidCI6ImMwZTA2MDFmLTBmYWMtNDQ5Yy05Yzg4LWExMDRjNGViOWYyOCJ9'
    #Sydney
    url = "https://www.health.nsw.gov.au/Infectious/diseases/Pages/covid-19-lga.aspx"
    html = get_html(url)
    table_lst = get_table_from_html(html)
    pprint.pprint(table_lst)


if __name__ == '__main__':
    run()