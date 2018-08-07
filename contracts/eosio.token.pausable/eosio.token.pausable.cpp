#include "eosio.token.pausable.hpp"

namespace eosio
{
    void pause::pausable( bool paused )
    {
        is_pause = paused;
    }

    bool pause::get_pause()
    {
        return is_pause;
    }

}

EOSIO_ABI( eosio::pause, (pausable) )
