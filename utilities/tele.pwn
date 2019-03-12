#define FILTERSCRIPT

#include <a_samp>
#include <easyDialog> // by Emmet
#include <Pawn.CMD> // by urShadow

enum sPos {
	Float: PosX,
	Float: PosY,
	Float: PosZ,
	Int,
	Name[30]
}
new ServerPos[][sPos] = {
	{260.85, 1237.24, 1084.26, 9, "Dia diem 1"},
	{2468.84, -1698.24, 1013.51, 2, "Dia diem 2"},
	{223.20, 1287.08, 1082.14, 1, "Dia diem 3"}

	// mình ví dụ một vài điểm, bạn có thể chỉnh sửa ở đây
}
CMD:tele(playerid, params[])
{
	new string[30*sizeof(sPos)];
	strcat(string, "Chon dia diem ma ban muon dich chuyen den\n");
	for(new i; i < sizeof(ServerPos), i++) {
		format(string, sizeof(string), "%s%s\n", string, ServerPos[i][Name]);
	}
	Dialog_Show(playerid, ADMIN_TELE, DIALOG_STYLE_TABLIST_HEADERS, "Dich chuyen", string, "Go", "Exit");
	return 1;
}
// Một trong những ưu điểm của easyDialog là người lập trình không cần phải khai báo: 
// #define ADMIN_TELE 1
// và bạn có thể code một dialog ở bất cứ đâu...
Dialog:ADMIN_TELE(playerid, response, listitem, inputtext[])
{
	if(!response) return 1; // khi người chơi bấm nút Exit
	new i = listitem; // để code dễ nhìn
	SetPlayerPos(playerid, ServerPos[i][PosX], ServerPos[i][PosY], ServerPos[i][PosZ]);
	SetPlayerInterior(playerid, ServerPos[i][Int]);
	
	new msg[144]; 
	format(msg, sizeof msg, "Ban da dich chuyen den: %s", ServerPos[i][Name]);
	SendClientMessage(playerid, -1, msg);

	return 1;
}