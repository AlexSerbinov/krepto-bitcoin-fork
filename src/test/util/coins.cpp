// Copyright (c) 2023 The Krepto core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <test/util/coins.h>

#include <coins.h>
#include <primitives/transaction.h>
#include <script/script.h>
#include <test/util/random.h>
#include <uint256.h>

#include <stdint.h>
#include <utility>

COutPoint AddTestCoin(CCoinsViewCache& coins_view)
{
    Coin new_coin;
    COutPoint outpoint{Txid::FromUint256(InsecureRand256()), /*nIn=*/0};
    new_coin.nHeight = 1;
    new_coin.out.nValue = InsecureRandMoneyAmount();
    new_coin.out.scriptPubKey.assign(uint32_t{56}, 1);
    coins_view.AddCoin(outpoint, std::move(new_coin), /*possible_overwrite=*/false);

    return outpoint;
};
