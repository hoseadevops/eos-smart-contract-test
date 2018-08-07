#include "eosio.token.pausable.hpp"

namespace eosio
{
    void pause::setpause( bool pause )
    {
        is_pause = pause;
    }

    bool pause::getpause()
    {
        return is_pause;
    }

}

EOSIO_ABI( eosio::pause, (setpause) )
