#include "DIY.h"

long size;
struct LogData {
    char logdate[20];
    char lognote[20];
    double charge;
    double balance;

};


int showmenu() {
    cout << "Enter your choice:\n";
    cout << "1-Add a new cash LOG.\n2-List All Casg LOG.\n";
    cout << "3-Query Last LOG.\n";
    cout << "4-update your LOG\n";
    cout << "0-End program.\n";
    cout << "Please tell me if you are using it for the first time? If yes please enter 1, otherwise enter 0.\n";
    int ci;
    cin >> ci;
    return ci;
}

int inputmychoice() {
    cout << "please enter number of operator\n";
    int mychoice;
    cin >> mychoice;
    return mychoice;
}

void AddNewLog(int di) {

    std::ofstream file("F:\\Code\\cpp\\consle\\3210613027.OUT.txt", std::ios::app);
    if (!file.is_open()) {
        throw std::runtime_error("fail to open target file");
    }
    LogData temp;
    if (di == 1) {

        cout << "Log format: data note charge balance. Please enter in order.\n";
        cout << "Because you are a new user. Please let charge=0, balance=your current total money.\n";
        cin >> temp.logdate >> temp.lognote >> temp.charge >> temp.balance;
        file << temp.logdate << " " << temp.lognote << " " << temp.charge << " " << temp.balance << endl;
    } else {
        std::ifstream filer("F:\\Code\\cpp\\consle\\3210613027.OUT.txt");
        std::string line;
        LogData tem;
        while (std::getline(filer, line)) {
            std::istringstream iss(line);
            iss >> tem.logdate >> tem.lognote >> tem.charge >> tem.balance;
//          std::cout << temp.logdate << " " << temp.lognote << " " << temp.charge << " " << temp.balance << std::endl;
        }
        filer.close();

        cout << "Log format: data note charge. Please enter in order.\n";
        cin >> temp.logdate >> temp.lognote >> temp.charge;
        file << temp.logdate << " " << temp.lognote << " " << temp.charge << " " << tem.balance + temp.charge << endl;

    }
    if (file.fail()) // 检查写入操作是否失败
    {
        std::cout << "Failed to write file." << std::endl; // 输出错误信息
    } else {
        std::cout << "Write file successfully." << std::endl; // 输出提示信息
    }
    file.close();
}

void ListAllLog(int ci) {
    if (ci == 1) {
        cout << "       There is no any log for you.        " << endl;
        return;
    }
    std::ifstream filer("F:\\Code\\cpp\\consle\\3210613027.OUT.txt");
    if (!filer.is_open()) {
        throw runtime_error("fail to open file");
    } else {
        int lines = 0;
        LogData temp;
        cout << "    LogId    " << "    LogDate    " << "    Charge    " << "    Balance    " << endl;
        string kong = "    ";
        string line;
        while (std::getline(filer, line)) {
            ++lines;
            stringstream iss(line);
            iss >> temp.logdate >> temp.lognote >> temp.charge >> temp.balance;
            cout << kong << lines << kong << temp.logdate << kong << temp.lognote << kong << temp.charge << kong
                 << temp.balance << kong << endl;
        }
        filer.close();
        if (filer.eof()) // 如果到达文件末尾
        {
            std::cout << "      Above is all your logs.     " << std::endl;
        } else // 如果读取失败
        {
            std::cerr << "Failed to read file." << std::endl;
        }
    }
}

void QueryLastLog(int ci) {
    if (ci == 1) {
        cout << "       There is no any log.        " << endl;
        return;
    }

    int lines = 0;
    LogData temp;
    cout << "Your last log:   ";

    std::ifstream filer("F:\\Code\\cpp\\consle\\3210613027.OUT.txt");
    string kong = "    ";
    string line;
    while (std::getline(filer, line)) {
        ++lines;
        stringstream iss(line);
        iss >> temp.logdate >> temp.lognote >> temp.charge >> temp.balance;
    }
    cout << "LogId:" << lines << ", LogDate:" << temp.logdate << ", LogNote:" << temp.lognote << ", Charge:"
         << temp.charge << ", Balance:" << temp.balance << endl;
    filer.close();

    if (!filer.eof()) // 如果没有到达文件末尾，则是读取失败.
    {
        std::cerr << "Failed to read file." << std::endl;
    }
}

void UpdateLog(int ci) {
    if (ci == 1) {
        cout << "     You don not have log,so can not alter any log.   \n";
        return;
    }
    ListAllLog(0);
    cout<<"Below Log is your all log.Please enter the serial number of the log to be modified\n""Your Input:    ";
    int x;
    cin>>x;
    cout<<endl;
    std::ifstream filer("F:\\Code\\cpp\\consle\\3210613027.OUT.txt");
    string s;
    LogData tem;
    vector<LogData> vec;
    int cnt=0;
    while(getline(filer,s))
    {
        ++cnt;
        stringstream  iss(s);
        iss >>tem.logdate>>tem.lognote>>tem.charge>>tem.balance;
        vec.pb(tem);
    }
    filer.close();
    DEBUG(x,cnt);
    tem=vec[x-1];
    cout<<"Please alter  your selected log by inputing.Notice: if you want to alter balance,please add new log to Implement it.If there's no need for modification, please copy and paste it directly.\n";
    cin>>tem.logdate>>tem.lognote>>tem.charge;
    strcpy(vec[x-1].lognote,tem.lognote);
    strcpy(vec[x-1].logdate,tem.logdate);
    vec[x-1].charge=tem.charge;
    DEBUG(vec[0].charge,vec[0].lognote,vec[0].logdate);
    DEBUG(vec[x-1].charge,vec[x-1].lognote,vec[x-1].logdate);
    rep(i,x-1,cnt-1)
    {
        if(x!=1)
        vec[i].balance=vec[i].charge+vec[i-1].balance;
    }

    std::ofstream file("F:\\Code\\cpp\\consle\\3210613027.OUT.txt");
    rep(i,0,cnt-1)
    {
        file<<vec[i].logdate<<" "<<vec[i].lognote<<" "<<vec[i].charge<<" "<<vec[i].balance<<endl;
    }
    file.close();
  
}
