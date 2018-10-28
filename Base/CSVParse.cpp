#include "CSVParse.h"
#include "Base.h"

using namespace cocos2d;


CSVParse::~CSVParse()
{
    for (int i=0; i<data.size(); i++) 
    {
        data[i].clear();
    }
    
    data.clear();
}

// split: split line into fields
void CSVParse::split(vector<string>& field,string line)
{
    string fld;
    int i, j;
    
    if (line.length() == 0)
        return ;
    i = 0;

    do 
    {
        if (i < line.length() && line[i] == '"')
            j = advquoted(line, fld, ++i);    // skip quote
        else
            j = advplain(line, fld, i);

        field.push_back(fld);
        i = j + 1;
    } while (j < line.length());
    
}

// advquoted: quoted field; return index of next separator
int CSVParse::advquoted(const string& s, string& fld, int i)
{
    int j;
    
    fld = "";
    for (j = i; j < s.length(); j++)
    {
        if (s[j] == '"' && s[++j] != '"')
        {
            int k = s.find_first_of(fieldsep, j);
            if (k > s.length())    // no separator found
                k = s.length();
            for (k -= j; k-- > 0; )
                fld += s[j++];
            break;
        }
        fld += s[j];
    }
    return j;
}

// advplain: unquoted field; return index of next separator
int CSVParse::advplain(const string& s, string& fld, int i)
{
    int j;
    
    j = s.find_first_of(fieldsep, i); // look for separator
    if (j > s.length())               // none found
        j = s.length();
    fld = string(s, i, j-i);
    return j;
}


// getfield: return n-th field
const char* CSVParse::getData(int m,int n)
{
    if (m<0||m>=data.size()||n<0||n>=data[m].size()) {
        return "";
    }
    
    return data[m][n].c_str();
}

//读取方式: 逐行读取, 将行读入字符串, 行之间用回车换行区分
//If you want to avoid reading into character arrays, 
//you can use the C++ string getline() function to read lines into strings
bool CSVParse::openFile(const char* fileName)
{
    ssize_t fileSize  = 0;
    string pathName = CCFileUtils::getInstance()->fullPathForFilename(fileName);
    char *pBuffer = (char*)CCFileUtils::getInstance()->getFileData(pathName.c_str(), "rt", &fileSize);;
    
    string  stringData(pBuffer);
    stringstream  strm;
    strm.write(pBuffer, fileSize);
    
    string s;
    while(getline(strm,s))
    {
        vector<string> field;
        split(field,s);
        data.push_back(field);
    }
    
    
#ifdef GAME_DEBUG_MODE
    
    printf("CSVParse::openFile--> %s \n", fileName);
    printTable();
    
#endif
    
    
    return true;
}

//bool CSVParse::openFile(const char* fileName)
//{
//#ifdef ANDROID
//    
//    string pathKey = CCFileUtils::getInstance()->fullPathFromRelativePath(fileName);
//    CCFileData csvdata(pathKey, "rt");
//    unsigned long size = csvdata.getSize();
//    char *pBuffer = (char*) csvdata.getBuffer();
//    
//    string  stringData(pBuffer);
//    stringstream  strm;
//    strm.write(pBuffer, size);
//    
//    string s;
//    while(getline(strm,s))
//    {
//        vector<string> field;
//        split(field,s);
//        data.push_back(field);
//    }
//    
//#else
//    
//    string pathKey = CCFileUtils::getInstance()->fullPathForFilename(fileName);
//    ifstream fin(pathKey.c_str());
//    string s;
//    while( getline(fin,s))
//    {
//        //CCLOG("%s",s.c_str());
//        vector<string> field;
//        split(field,s);
//        data.push_back(field);
//    }
//#endif
//    
//    printTable();
//    
//    return true;
//}

void CSVParse::printTable()
{
#ifdef GAME_DEBUG_MODE
    
    for (int i=0; i<data.size(); i++) 
    {
        for (int k=0; k<data[i].size(); k++) 
        {
            printf("%s  ",getData(i, k));
        }
        
        //printf("\n");
    }
#endif
}


int CSVParse::getDataSize()
{
    return data.size();
}




