#include <inc.h>

std::string web::client::encryptDecrypt(std::string buffer, std::string key)
{
	for (auto c = 0; c < buffer.size(); c++) buffer[c] ^= key[c % key.length()];
	return buffer;
}
std::string web::client::rstr(int size)
{
	auto range = std::string("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
	auto out = std::stringstream();
	for (auto c = 0; c < size; c++)
	{
		auto slc = range[rand() % 52];
		out << slc;
	}
	return out.str();
}

std::string web::client::prepare(std::string data)
{
	std::string key_data = rstr(10);
	key_data.append(encryptDecrypt(data, key_data));
	return key_data;
}
bool web::client::connect(std::wstring page)
{
	//cleanup
	if (this->hrequest) WinHttpCloseHandle(this->hrequest);
	if (this->hconnect) WinHttpCloseHandle(this->hconnect);

	//init
	this->hconnect = WinHttpConnect(this->hsession, page.c_str(), this->usehttps ? INTERNET_DEFAULT_HTTPS_PORT : INTERNET_DEFAULT_HTTP_PORT, 0);

	//return
	if (this->hconnect)
		return true;
	return false;
}


std::string web::client::url_encode(const std::string& value) {
	std::ostringstream escaped;
	escaped.fill('0');
	escaped << std::hex;

	for (std::string::const_iterator i = value.begin(), n = value.end(); i != n; ++i) {
		std::string::value_type c = (*i);

		// Keep alphanumeric and other accepted characters intact
		if (isalnum(c) || c == '-' || c == '_' || c == '.' || c == '~') {
			escaped << c;
			continue;
		}

		// Any other characters are percent-encoded
		escaped << std::uppercase;
		escaped << '%' << std::setw(2) << int((unsigned char)c);
		escaped << std::nouppercase;
	}
	return escaped.str();
}

bool web::client::request(std::wstring file, web::requestmode mode, std::unordered_map<std::string, std::string> vars)
{
	//VMProtectBegin("wcr");

	//cleanup
	if (this->hrequest) WinHttpCloseHandle(this->hrequest);

	//failsafe
	if (!this->hconnect) return false;

	std::string data = "";
	if (vars.size())
	{
		auto i = 0;
		for (auto elm : vars)
		{
			if (i) data.append("&");
			data.append(elm.first);
			data.append("=");
			data.append(url_encode(base64_encode(prepare(elm.second))));
			i++;
		}
	}

	//init
	switch (mode)
	{
	case requestmode::GET:
		file.append(L"?");
		file.append(std::wstring(data.begin(), data.end()));
		this->hrequest = WinHttpOpenRequest(this->hconnect, L"GET", file.c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, this->usehttps ? WINHTTP_FLAG_SECURE : 0);
		//std::wcout << L"([]) req: " << file << std::endl;
		break;
	case requestmode::POST:
		this->hrequest = WinHttpOpenRequest(this->hconnect, L"POST", file.c_str(), NULL, WINHTTP_NO_REFERER, WINHTTP_DEFAULT_ACCEPT_TYPES, this->usehttps ? WINHTTP_FLAG_SECURE : 0);
		break;
	}

	if (!this->hrequest) {
		return false;
	}

	LPCWSTR additionalHeaders = L"Content-Type: application/x-www-form-urlencoded\r\n\0";
	DWORD headersLength = -1;
	BOOL bresults = FALSE;

	if (this->insecure)
	{
		unsigned long protocols =
			WINHTTP_FLAG_SECURE_PROTOCOL_ALL |
			WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_1 |
			WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2;
		DWORD dwFlags =
			SECURITY_FLAG_IGNORE_UNKNOWN_CA |
			SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE |
			SECURITY_FLAG_IGNORE_CERT_CN_INVALID |
			SECURITY_FLAG_IGNORE_CERT_DATE_INVALID;
		WinHttpSetOption(
			this->hrequest,
			protocols,
			&dwFlags,
			sizeof(dwFlags));
	}

	switch (mode)
	{
	case requestmode::GET:
		bresults = WinHttpSendRequest(this->hrequest, additionalHeaders, headersLength, WINHTTP_NO_REQUEST_DATA, 0, 0, 0);
		break;
	case requestmode::POST:
		bresults = WinHttpSendRequest(this->hrequest, additionalHeaders, headersLength, &data[0], data.size(), data.size(), 0);
		break;
	}

	if (bresults != TRUE)
	{
		return false;
	}

	bresults = WinHttpReceiveResponse(this->hrequest, NULL);

	if (bresults != TRUE)
	{
		return false;
	}

	response = {};

	DWORD dwSize = 0;
	do
	{
		// Check for available data.
		DWORD dwDownloaded = 0;
		if (!WinHttpQueryDataAvailable(this->hrequest, &dwSize)) continue;
		// Allocate space for the buffer.
		auto pszOutBuffer = new char[dwSize + 1];
		if (!pszOutBuffer)
		{
			return false;
		}
		else
		{
			// Read the data.
			ZeroMemory(pszOutBuffer, dwSize + 1);
			if (!WinHttpReadData(this->hrequest, (LPVOID)pszOutBuffer,
				dwSize, &dwDownloaded))
				continue;
			else
			{
				auto newdata = std::vector<byte>(pszOutBuffer, pszOutBuffer + dwDownloaded);
				response.insert(response.end(), newdata.begin(), newdata.end());

				/*if (this->size != 0)
				{
					std::stringstream owo;
					float percent = (float)((float)response.size() / (float)this->size) * 100.f;
					owo << (int)percent << "%";
					SetConsoleTitleA(owo.str().c_str());
				}*/
			}

			// Free the memory allocated to the buffer.
			delete[] pszOutBuffer;
		}
	} while (dwSize > 0);
	return true;

	//VMProtectEnd();

}

std::vector<byte> web::client::get()
{
	return this->response;
}

void web::client::set_max(int s, int st)
{
	this->size = s;
	this->stage = st;
}

std::string web::client::tostring(std::vector<byte> in)
{
	return std::string(in.begin(), in.end());
}

web::client::client(bool usehttps, bool insecure)
{

	unsigned long protocols =
		WINHTTP_FLAG_SECURE_PROTOCOL_ALL |
		WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_1 |
		WINHTTP_FLAG_SECURE_PROTOCOL_TLS1_2;
	DWORD dwFlags =
		SECURITY_FLAG_IGNORE_UNKNOWN_CA |
		SECURITY_FLAG_IGNORE_CERT_WRONG_USAGE |
		SECURITY_FLAG_IGNORE_CERT_CN_INVALID |
		SECURITY_FLAG_IGNORE_CERT_DATE_INVALID;
	WinHttpSetOption(
		this->hrequest,
		protocols,
		&dwFlags,
		sizeof(dwFlags));

	this->insecure = insecure;
	this->usehttps = usehttps;
	this->hsession = WinHttpOpen(L"obama get down", WINHTTP_ACCESS_TYPE_DEFAULT_PROXY, WINHTTP_NO_PROXY_NAME, WINHTTP_NO_PROXY_BYPASS, 0);
}

web::client::~client()
{
	if (this->hrequest) WinHttpCloseHandle(this->hrequest);
	if (this->hconnect) WinHttpCloseHandle(this->hconnect);
	if (this->hsession) WinHttpCloseHandle(this->hsession);
	this->response = { };
}