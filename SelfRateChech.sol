pragma solidity ^0.4.18;
contract track {
   struct UserInfo {
        uint Postcode;
        uint Postcode2;
        uint Postcode3;
        uint Postcode4;
        string LocalRate;
        string SelfRate;
    }
    mapping (string => UserInfo) AllUsers;

    function SetUserTrajectory(string _Name, uint _Postcode,uint _Postcode2,uint _Postcode3,uint _Postcode4) public {
        AllUsers[_Name].Postcode = _Postcode;
        if (AllUsers[_Name].Postcode == 3000)  {AllUsers[_Name].LocalRate = "Your-self infection rate = 2%";
        AllUsers[_Name].SelfRate = "Your-self infection rate = 2%";
       }
       else AllUsers[_Name].LocalRate = "Waiting for update";
       
       AllUsers[_Name].Postcode2 = _Postcode2;
        if (AllUsers[_Name].Postcode2 == 3001)  {AllUsers[_Name].LocalRate = "Your-self infection rate = 2%";
        AllUsers[_Name].SelfRate = "Your-self infection rate = 2%";
       }
       else AllUsers[_Name].LocalRate = "Waiting for update";
       
       AllUsers[_Name].Postcode3 = _Postcode3;
        if (AllUsers[_Name].Postcode3 == 3002)  {AllUsers[_Name].LocalRate = "Your-self infection rate = 2%";
        AllUsers[_Name].SelfRate = "Your-self infection rate = 2%";
       }
       else AllUsers[_Name].LocalRate = "Waiting for update";
       
       AllUsers[_Name].Postcode4 = _Postcode4;
        if (AllUsers[_Name].Postcode4 == 3003)  {AllUsers[_Name].LocalRate = "Your-self infection rate = 2%";
        AllUsers[_Name].SelfRate = "Your-self infection rate = 2%";
       }
       else AllUsers[_Name].LocalRate = "Waiting for update";
}
   function GetUserInfo(string _Name) public view returns (string) {
        return (AllUsers[_Name].LocalRate);
    }   
}
