/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include <../eosio.token/eosio.token.hpp>


namespace eosio
{
    class pause: public token {

        public:
            pause( account_name self ):token(self){}

            void pausable( bool paused );
            bool get_pause();

            void transfer( account_name from,
                           account_name to,
                           asset        quantity,
                           string       memo )
            {
                eosio_assert( is_pause == true, "This token is paused." );
                token::transfer(from, to, quantity, memo);
            }
            void issue( account_name to,
                        asset        quantity,
                        string       memo )
            {
                eosio_assert( is_pause == true, "This token is paused." );
                token::issue(to, quantity, memo);
            }

        private:
            bool is_pause = false;
    };


}
