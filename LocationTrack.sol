pragma solidity ^0.4.18;
contract track {
   struct UserInfo {
        uint Postcode;
        string LocalRate;
        string SelfRate;
    }
    mapping (string => UserInfo) AllUsers;

    function SetLocation(string _Name, uint _Postcode) public {
        AllUsers[_Name].Postcode = _Postcode;
        if (AllUsers[_Name].Postcode == 3000)  {AllUsers[_Name].LocalRate = "Theis area infection rate = 2%";
        AllUsers[_Name].SelfRate = "Your-self infection rate = 2%";
       }
       else AllUsers[_Name].LocalRate = "Waiting for update";
}
   function GetUserInfo(string _Name) public view returns (uint,string) {
        return (AllUsers[_Name].Postcode,AllUsers[_Name].LocalRate);
    }   
}
