import credits.aleo;
import dcp_public_states.aleo;

program dcp_private_states.aleo;

struct Proposal:
    validators as [address; 16u32];
    threshold as u8;
    current_validator_set_index as u64;

struct Share:
    share_val as field;
    index as field;

struct Custody:
    origin as address;
    custody_key as field;
    threshold as u8;

struct ValidatorShareData:
    validator as address;
    share as Share;
    weight as u64;

record ValidatorShare:
    owner as address.private;
    share as Share.private;
    custody as Custody.private;
    weight as u64.private;

record WithdrawRequest:
    owner as address.private;
    custody_hash as field.private;
    to as address.private;
    fee_amount as u64.private;
    request_id as field.private;

record DestinationShare:
    owner as address.private;
    share as Share.private;
    custody_hash as field.private;





function process_request_as_validator:
    input r0 as ValidatorShare.record;
    input r1 as WithdrawRequest.record;
    hash.bhp256 r0.custody into r2 as field;
    assert.eq r1.custody_hash r2;
    cast r1.to r0.share r2 into r3 as DestinationShare.record;
    cast r0.owner r0.share r0.custody r0.weight into r4 as ValidatorShare.record;
    call credits.aleo/transfer_public self.caller r1.fee_amount into r5;
    call dcp_public_states.aleo/process_request_as_validator r2 r1.request_id r0.custody.threshold r0.weight into r6;
    async process_request_as_validator r6 r5 into r7;
    output r3 as DestinationShare.record;
    output r4 as ValidatorShare.record;
    output r7 as imports_credits_5.aleo/process_request_as_validator.future;

finalize process_request_as_validator:
    input r0 as dcp_public_states.aleo/process_request_as_validator.future;
    input r1 as credits.aleo/transfer_public.future;
    await r0;
    await r1;



function submit_shares_to_validators:
    input r0 as [ValidatorShareData; 16u32].private;
    input r1 as Custody.private;
    assert.eq self.caller data_custody_protocol.aleo;
    cast r0[0u32].validator r0[0u32].share r1 r0[0u32].weight into r2 as ValidatorShare.record;
    cast r0[1u32].validator r0[1u32].share r1 r0[1u32].weight into r3 as ValidatorShare.record;
    cast r0[2u32].validator r0[2u32].share r1 r0[2u32].weight into r4 as ValidatorShare.record;
    cast r0[3u32].validator r0[3u32].share r1 r0[3u32].weight into r5 as ValidatorShare.record;
    cast r0[4u32].validator r0[4u32].share r1 r0[4u32].weight into r6 as ValidatorShare.record;
    cast r0[5u32].validator r0[5u32].share r1 r0[5u32].weight into r7 as ValidatorShare.record;
    cast r0[6u32].validator r0[6u32].share r1 r0[6u32].weight into r8 as ValidatorShare.record;
    cast r0[7u32].validator r0[7u32].share r1 r0[7u32].weight into r9 as ValidatorShare.record;
    cast r0[8u32].validator r0[8u32].share r1 r0[8u32].weight into r10 as ValidatorShare.record;
    cast r0[9u32].validator r0[9u32].share r1 r0[9u32].weight into r11 as ValidatorShare.record;
    cast r0[10u32].validator r0[10u32].share r1 r0[10u32].weight into r12 as ValidatorShare.record;
    cast r0[11u32].validator r0[11u32].share r1 r0[11u32].weight into r13 as ValidatorShare.record;
    cast r0[12u32].validator r0[12u32].share r1 r0[12u32].weight into r14 as ValidatorShare.record;
    cast r0[13u32].validator r0[13u32].share r1 r0[13u32].weight into r15 as ValidatorShare.record;
    cast r0[14u32].validator r0[14u32].share r1 r0[14u32].weight into r16 as ValidatorShare.record;
    cast r0[15u32].validator r0[15u32].share r1 r0[15u32].weight into r17 as ValidatorShare.record;
    output r2 as ValidatorShare.record;
    output r3 as ValidatorShare.record;
    output r4 as ValidatorShare.record;
    output r5 as ValidatorShare.record;
    output r6 as ValidatorShare.record;
    output r7 as ValidatorShare.record;
    output r8 as ValidatorShare.record;
    output r9 as ValidatorShare.record;
    output r10 as ValidatorShare.record;
    output r11 as ValidatorShare.record;
    output r12 as ValidatorShare.record;
    output r13 as ValidatorShare.record;
    output r14 as ValidatorShare.record;
    output r15 as ValidatorShare.record;
    output r16 as ValidatorShare.record;
    output r17 as ValidatorShare.record;


function submit_requests_to_validators:
    input r0 as [address; 16u32].private;
    input r1 as field.private;
    input r2 as field.private;
    input r3 as address.private;
    input r4 as u64.private;
    assert.eq self.caller data_custody_protocol.aleo;
    cast r0[0u32] r1 r3 r4 r2 into r5 as WithdrawRequest.record;
    cast r0[1u32] r1 r3 r4 r2 into r6 as WithdrawRequest.record;
    cast r0[2u32] r1 r3 r4 r2 into r7 as WithdrawRequest.record;
    cast r0[3u32] r1 r3 r4 r2 into r8 as WithdrawRequest.record;
    cast r0[4u32] r1 r3 r4 r2 into r9 as WithdrawRequest.record;
    cast r0[5u32] r1 r3 r4 r2 into r10 as WithdrawRequest.record;
    cast r0[6u32] r1 r3 r4 r2 into r11 as WithdrawRequest.record;
    cast r0[7u32] r1 r3 r4 r2 into r12 as WithdrawRequest.record;
    cast r0[8u32] r1 r3 r4 r2 into r13 as WithdrawRequest.record;
    cast r0[9u32] r1 r3 r4 r2 into r14 as WithdrawRequest.record;
    cast r0[10u32] r1 r3 r4 r2 into r15 as WithdrawRequest.record;
    cast r0[11u32] r1 r3 r4 r2 into r16 as WithdrawRequest.record;
    cast r0[12u32] r1 r3 r4 r2 into r17 as WithdrawRequest.record;
    cast r0[13u32] r1 r3 r4 r2 into r18 as WithdrawRequest.record;
    cast r0[14u32] r1 r3 r4 r2 into r19 as WithdrawRequest.record;
    cast r0[15u32] r1 r3 r4 r2 into r20 as WithdrawRequest.record;
    output r5 as WithdrawRequest.record;
    output r6 as WithdrawRequest.record;
    output r7 as WithdrawRequest.record;
    output r8 as WithdrawRequest.record;
    output r9 as WithdrawRequest.record;
    output r10 as WithdrawRequest.record;
    output r11 as WithdrawRequest.record;
    output r12 as WithdrawRequest.record;
    output r13 as WithdrawRequest.record;
    output r14 as WithdrawRequest.record;
    output r15 as WithdrawRequest.record;
    output r16 as WithdrawRequest.record;
    output r17 as WithdrawRequest.record;
    output r18 as WithdrawRequest.record;
    output r19 as WithdrawRequest.record;
    output r20 as WithdrawRequest.record;
