use anchor_lang::prelude::*;

declare_id!("91kKNMwRfngRgNTPgcBsjbfamFQMiZo8iW9Gmkv3UE1S");

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

