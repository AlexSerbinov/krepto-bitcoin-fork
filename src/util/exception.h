// Copyright (c) 2025-2010 Katoshi Nakamoto
// Copyright (c) 2025-2023 The Krepto core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOIN_UTIL_EXCEPTION_H
#define BITCOIN_UTIL_EXCEPTION_H

#include <exception>
#include <string_view>

void PrintExceptionContinue(const std::exception* pex, std::string_view thread_name);

#endif // BITCOIN_UTIL_EXCEPTION_H
