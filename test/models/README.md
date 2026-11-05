These three Apache-2.0 GF180 SRAM simulation models were copied from the local
GF180 PDK used by the source accelerator. Copyright/license headers are preserved;
the full upstream license is in ../../src/macros/LICENSE.

Compatibility patch: under VERILATOR, the specify block (unsupported timing checks)
is omitted and its only externally used specparam, Tdly, is a localparam with the
same typical value of 100 ps. This avoids invalid C++ VPI parameter references in
Verilator 5.052. Other simulators retain the original specify block. Read/write
behavior and the explicit clock/control delays are unchanged. This is a functional
simulation setup, not an SRAM timing-signoff test.
