#include <Windows.h>

extern "C" __declspec(dllexport)
void SendKeysUTF8(int utf8Code, char* windowTitle) {
    HWND targetWindow = FindWindow(NULL, windowTitle);

    if(targetWindow) {
        SetForegroundWindow(targetWindow);

        INPUT input;
        memset(&input, 0, sizeof(INPUT));

        input.type = INPUT_KEYBOARD;
        input.ki.wVk = 0; // For Unicode characters, set wVk to 0

        int utf8CodePoint = utf8Code & 0x7F;
        input.ki.wScan = MapVirtualKeyW(utf8CodePoint, MAPVK_VK_TO_VSC); // Get scan code from virtual key code

        input.ki.dwFlags = KEYEVENTF_UNICODE; // Specify Unicode flag
        SendInput(1, &input, sizeof(INPUT));

        input.ki.dwFlags = KEYEVENTF_UNICODE | KEYEVENTF_KEYUP; // Release key
        SendInput(1, &input, sizeof(INPUT));
    }
}