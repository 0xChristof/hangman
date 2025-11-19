use anchor_lang::prelude::*;

declare_id!("Hp8S9gQjhCVctpLA2tbcDN59Gqc4Vr9xKbJSFWuqa2C6");

#[program]
pub mod hangman {
    use super::*;

    pub fn initialize(_ctx: Context<Initialize>) -> Result<()> {
        msg!("Hangman program initialized!");
        Ok(())
    }
}

#[derive(Accounts)]
pub struct Initialize {}

