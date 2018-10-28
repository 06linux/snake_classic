
/**
 *  解析完的数据放到data这个二维数组中，通过getData(int m,int n)
 *  获取数据
 *
 *  注意，同一个表格中，不支持多行，换行
 **/

#ifndef _CSVPARSE_H_
#define _CSVPARSE_H_


#include "cocos2d.h"
#include <stdio.h>
#include <iostream>
#include <fstream>

using namespace std;

class CSVParse 
{
    
public:
    CSVParse(istream& fin = cin, string sep = ","):
    fieldsep(sep) {}
    ~CSVParse();
private:
    string                      fieldsep;        // separator characters
    vector<vector<string> >     data;
    void    split(vector<string>& field,string line);
    int     advplain(const string& line, string& fld, int);
    int     advquoted(const string& line, string& fld, int);
    
public: 
    bool            openFile(const char* fileName);
    const   char*   getData(int m,int n);
    int             getDataSize();      // 数据表行数
    void            printTable();       // 打印，显示整个表的书序（调试用）
};

#endif

