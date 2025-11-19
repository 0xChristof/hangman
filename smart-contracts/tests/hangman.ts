import * as anchor from "@coral-xyz/anchor";
import { Program } from "@coral-xyz/anchor";
import { Hangman } from "../target/types/hangman";
import { expect } from "chai";

describe("hangman", () => {
  // Configure the client to use the local cluster.
  anchor.setProvider(anchor.AnchorProvider.env());

  const program = anchor.workspace.Hangman as Program<Hangman>;

  it("Initializes successfully", async () => {
    const tx = await program.methods.initialize().rpc();
    console.log("Your transaction signature", tx);
    expect(tx).to.be.a("string");
  });
});
