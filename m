From: Paul Swartz <z3p@twistedmatrix.com>
Subject: Problem recognizing P4-M
Date: Tue, 26 Apr 2005 00:46:58 -0400
Message-ID: <1114490818.6148.15.camel@petra>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0128705132=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk


--===============0128705132==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-Mgdez3SsqOxVhceW7OYb"


--=-Mgdez3SsqOxVhceW7OYb
Content-Type: multipart/mixed; boundary="=-QRB/zwfZt0WU+EkgigkS"


--=-QRB/zwfZt0WU+EkgigkS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I've checked all over the internet, but I've had no luck finding the
answer to this problem.  I have what looks to be a Mobile Intel Pentium
4 at 2.66Ghz.  It's supported (sort of) by the p4-clockmod and
acpi-cpufreq modules, but it seems like it should be supported by one of
the speedstep modules.  However, whenever I try to insert the
speedstep-ich module, I get this:

FATAL: Error inserting speedstep_ich
(/lib/modules/2.6.10-5-686/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-ic=
h.ko): No such device

I get the same error under 2.6.10 (Ubuntu) and 2.6.11 (from the tree).
Attached are the output from 'cat /proc/cpuinfo' and 'x86info -a'.

Thanks in advance for any advice you might have,
-p
--=20
       Paul Swartz
(o_    http://z3p.livejournal.com/  _o)
//\    z3p@twistedmatrix.com        /\\
V_/_   AIM: z3penguin              _\_V->

--=-QRB/zwfZt0WU+EkgigkS
Content-Disposition: attachment; filename=cpuinfo
Content-Transfer-Encoding: base64
Content-Type: text/plain; name=cpuinfo; charset=us-ascii

cHJvY2Vzc29yCTogMA0KdmVuZG9yX2lkCTogR2VudWluZUludGVsDQpjcHUgZmFtaWx5CTogMTUN
Cm1vZGVsCQk6IDINCm1vZGVsIG5hbWUJOiBNb2JpbGUgSW50ZWwoUikgUGVudGl1bShSKSA0ICAg
ICBDUFUgMi42NkdIeg0Kc3RlcHBpbmcJOiA5DQpjcHUgTUh6CQk6IDI2NTguNTYzDQpjYWNoZSBz
aXplCTogNTEyIEtCDQpmZGl2X2J1Zwk6IG5vDQpobHRfYnVnCQk6IG5vDQpmMDBmX2J1Zwk6IG5v
DQpjb21hX2J1Zwk6IG5vDQpmcHUJCTogeWVzDQpmcHVfZXhjZXB0aW9uCTogeWVzDQpjcHVpZCBs
ZXZlbAk6IDINCndwCQk6IHllcw0KZmxhZ3MJCTogZnB1IHZtZSBkZSBwc2UgdHNjIG1zciBwYWUg
bWNlIGN4OCBzZXAgbXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1c2ggZHRzIGFjcGkg
bW14IGZ4c3Igc3NlIHNzZTIgc3MgaHQgdG0gcGJlIGNpZCB4dHByDQpib2dvbWlwcwk6IDUyNDIu
ODgNCg0K


--=-QRB/zwfZt0WU+EkgigkS
Content-Disposition: attachment; filename=x86info
Content-Transfer-Encoding: base64
Content-Type: text/plain; name=x86info; charset=us-ascii

eDg2aW5mbyB2MS4xMmIuICBEYXZlIEpvbmVzIDIwMDEtMjAwMw0KRmVlZGJhY2sgdG8gPGRhdmVq
QHJlZGhhdC5jb20+Lg0KDQpGb3VuZCAxIENQVQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCmVheCBpbjog
MHgwMDAwMDAwMCwgZWF4ID0gMDAwMDAwMDIgZWJ4ID0gNzU2ZTY1NDcgZWN4ID0gNmM2NTc0NmUg
ZWR4ID0gNDk2NTZlNjkNCmVheCBpbjogMHgwMDAwMDAwMSwgZWF4ID0gMDAwMDBmMjkgZWJ4ID0g
MDAwMTA4MDggZWN4ID0gMDAwMDQ0MDAgZWR4ID0gYmZlYmY5ZmYNCmVheCBpbjogMHgwMDAwMDAw
MiwgZWF4ID0gNjY1YjUxMDEgZWJ4ID0gMDAwMDAwMDAgZWN4ID0gMDAwMDAwMDAgZWR4ID0gMDA3
YjcwNDANCg0KZWF4IGluOiAweDgwMDAwMDAwLCBlYXggPSA4MDAwMDAwNCBlYnggPSAwMDAwMDAw
MCBlY3ggPSAwMDAwMDAwMCBlZHggPSAwMDAwMDAwMA0KZWF4IGluOiAweDgwMDAwMDAxLCBlYXgg
PSAwMDAwMDAwMCBlYnggPSAwMDAwMDAwMCBlY3ggPSAwMDAwMDAwMCBlZHggPSAwMDAwMDAwMA0K
ZWF4IGluOiAweDgwMDAwMDAyLCBlYXggPSA0ZDIwMjAyMCBlYnggPSA2YzY5NjI2ZiBlY3ggPSA2
ZTQ5MjA2NSBlZHggPSAyODZjNjU3NA0KZWF4IGluOiAweDgwMDAwMDAzLCBlYXggPSA1MDIwMjk1
MiBlYnggPSA2OTc0NmU2NSBlY3ggPSA1MjI4NmQ3NSBlZHggPSAyMDM0MjAyOQ0KZWF4IGluOiAw
eDgwMDAwMDA0LCBlYXggPSAyMDIwMjAyMCBlYnggPSAyMDU1NTA0MyBlY3ggPSAzNjM2MmUzMiBl
ZHggPSAwMDdhNDg0Nw0KDQpGYW1pbHk6IDE1IE1vZGVsOiAyIFN0ZXBwaW5nOiA5IFR5cGU6IDAg
QnJhbmQ6IDgNCkNQVSBNb2RlbDogUGVudGl1bSA0IChOb3J0aHdvb2QpIFtEMV0gT3JpZ2luYWwg
T0VNDQpQcm9jZXNzb3IgbmFtZSBzdHJpbmc6IE1vYmlsZSBJbnRlbChSKSBQZW50aXVtKFIpIDQg
ICAgIENQVSAyLjY2R0h6DQoNCkZlYXR1cmUgZmxhZ3M6DQoJT25ib2FyZCBGUFUNCglWaXJ0dWFs
IE1vZGUgRXh0ZW5zaW9ucw0KCURlYnVnZ2luZyBFeHRlbnNpb25zDQoJUGFnZSBTaXplIEV4dGVu
c2lvbnMNCglUaW1lIFN0YW1wIENvdW50ZXINCglNb2RlbC1TcGVjaWZpYyBSZWdpc3RlcnMNCglQ
aHlzaWNhbCBBZGRyZXNzIEV4dGVuc2lvbnMNCglNYWNoaW5lIENoZWNrIEFyY2hpdGVjdHVyZQ0K
CUNNUFhDSEc4IGluc3RydWN0aW9uDQoJU1lTRU5URVIvU1lTRVhJVA0KCU1lbW9yeSBUeXBlIFJh
bmdlIFJlZ2lzdGVycw0KCVBhZ2UgR2xvYmFsIEVuYWJsZQ0KCU1hY2hpbmUgQ2hlY2sgQXJjaGl0
ZWN0dXJlDQoJQ01PViBpbnN0cnVjdGlvbg0KCVBhZ2UgQXR0cmlidXRlIFRhYmxlDQoJMzYtYml0
IFBTRXMNCglDTEZMVVNIIGluc3RydWN0aW9uDQoJRGVidWcgVHJhY2UgU3RvcmUNCglBQ1BJIHZp
YSBNU1INCglNTVggc3VwcG9ydA0KCUZYU0FWRSBhbmQgRlhSRVNUT1JFIGluc3RydWN0aW9ucw0K
CVNTRSBzdXBwb3J0DQoJU1NFMiBzdXBwb3J0DQoJQ1BVIHNlbGYgc25vb3ANCglIeXBlci1UaHJl
YWRpbmcNCglBdXRvbWF0aWMgY2xvY2sgQ29udHJvbA0KCVBlbmRpbmcgQnJlYWsgRW5hYmxlDQoN
CkV4dGVuZGVkIGZlYXR1cmUgZmxhZ3M6DQogY250eC1pZA0KUGVudGl1bSA0IHNwZWNpZmljIE1T
UnM6DQoNCkluc3RydWN0aW9uIFRMQjogNEssIDJNQiBvciA0TUIgcGFnZXMsIGZ1bGx5IGFzc29j
aWF0aXZlLCAxMjggZW50cmllcy4NCkRhdGEgVExCOiA0S0Igb3IgNE1CIHBhZ2VzLCBmdWxseSBh
c3NvY2lhdGl2ZSwgNjQgZW50cmllcy4NCkwxIERhdGEgY2FjaGU6DQoJU2l6ZTogOEtCCVNlY3Rv
cmVkLCA0LXdheSBhc3NvY2lhdGl2ZS4NCglsaW5lIHNpemU9NjQgYnl0ZXMuDQpObyBsZXZlbCAy
IGNhY2hlIG9yIG5vIGxldmVsIDMgY2FjaGUgaWYgdmFsaWQgMm5kIGxldmVsIGNhY2hlLg0KSW5z
dHJ1Y3Rpb24gdHJhY2UgY2FjaGU6DQoJU2l6ZTogMTJLIHVPcHMJOC13YXkgYXNzb2NpYXRpdmUu
DQpMMiB1bmlmaWVkIGNhY2hlOg0KCVNpemU6IDUxMktCCVNlY3RvcmVkLCA4LXdheSBhc3NvY2lh
dGl2ZS4NCglsaW5lIHNpemU9NjQgYnl0ZXMuDQpOdW1iZXIgb2YgbG9naWNhbCBwcm9jZXNzb3Jz
IHN1cHBvcnRlZCB3aXRoaW4gdGhlIHBoeXNpY2FsIHBhY2thZ2U6IDANCg0KQ29ubmVjdG9yIHR5
cGU6IFNvY2tldDQ3OCAoUEdBNDc4IFNvY2tldCkNCg0KRGF0YXNoZWV0OiBodHRwOi8vZGV2ZWxv
cGVyLmludGVsLmNvbS9kZXNpZ24vcGVudGl1bTQvZGF0YXNodHMvMjQ5ODg3MDMucGRmDQoJaHR0
cDovL2RldmVsb3Blci5pbnRlbC5jb20vZGVzaWduL3BlbnRpdW00L2RhdGFzaHRzLzI5ODY0MzA0
LnBkZg0KRXJyYXRhOiBodHRwOi8vZGV2ZWxvcGVyLmludGVsLmNvbS9kZXNpZ24vcGVudGl1bTQv
c3BlY3VwZHQvMjQ5MTk5MjgucGRmDQoNCk1UUlIgcmVnaXN0ZXJzOg0KTVRSUmNhcCAoMHhmZSk6
IE1UUlJwaHlzQmFzZTAgKDB4MjAwKTogTVRSUnBoeXNNYXNrMCAoMHgyMDEpOiBNVFJScGh5c0Jh
c2UxICgweDIwMik6IE1UUlJwaHlzTWFzazEgKDB4MjAzKTogTVRSUnBoeXNCYXNlMiAoMHgyMDQp
OiBNVFJScGh5c01hc2syICgweDIwNSk6IE1UUlJwaHlzQmFzZTMgKDB4MjA2KTogTVRSUnBoeXNN
YXNrMyAoMHgyMDcpOiBNVFJScGh5c0Jhc2U0ICgweDIwOCk6IE1UUlJwaHlzTWFzazQgKDB4MjA5
KTogTVRSUnBoeXNCYXNlNSAoMHgyMGEpOiBNVFJScGh5c01hc2s1ICgweDIwYik6IE1UUlJwaHlz
QmFzZTYgKDB4MjBjKTogTVRSUnBoeXNNYXNrNiAoMHgyMGQpOiBNVFJScGh5c0Jhc2U3ICgweDIw
ZSk6IE1UUlJwaHlzTWFzazcgKDB4MjBmKTogTVRSUmZpeDY0S18wMDAwMCAoMHgyNTApOiBNVFJS
Zml4MTZLXzgwMDAwICgweDI1OCk6IE1UUlJmaXgxNktfQTAwMDAgKDB4MjU5KTogTVRSUmZpeDRL
X0M4MDAwICgweDI2OSk6IE1UUlJmaXg0S19EMDAwMCAweDI2YTogTVRSUmZpeDRLX0Q4MDAwIDB4
MjZiOiBNVFJSZml4NEtfRTAwMDAgMHgyNmM6IE1UUlJmaXg0S19FODAwMCAweDI2ZDogTVRSUmZp
eDRLX0YwMDAwIDB4MjZlOiBNVFJSZml4NEtfRjgwMDAgMHgyNmY6IE1UUlJkZWZUeXBlICgweDJm
Zik6IA0KDQoyLjZHaHogcHJvY2Vzc29yIChlc3RpbWF0ZSkuDQoNCg==


--=-QRB/zwfZt0WU+EkgigkS--

--=-Mgdez3SsqOxVhceW7OYb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBCbcfCn20RAFzwsckRAqnRAJ9QsVZuFZbm3l0ta3P/UTisQQ7QQQCbB6Vp
onkusuH28fjuOujOp/l49xE=
=ueSR
-----END PGP SIGNATURE-----

--=-Mgdez3SsqOxVhceW7OYb--



--===============0128705132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0128705132==--


