From: Christian Heimanns <heimanns@versanet.de>
Subject: Re: speedstep-ich and ich5, [speedstep]
Date: Tue, 10 Aug 2004 18:56:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4118FE2C.8080508@versanet.de>
References: <4114D272.6070808@versanet.de>
	<20040807131432.GA8934@dominikbrodowski.de>
	<4114E9C1.8070409@versanet.de>
	<20040808175726.GA15268@dominikbrodowski.de>
	<4116A003.600@versanet.de>
	<20040809204940.GA10802@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080500070808010608040302"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040809204940.GA10802@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq <cpufreq@www.linux.org.uk>

This is a multi-part message in MIME format.
--------------080500070808010608040302
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mxout01.versatel.de id
	i7AGu57O014289

Dominik Brodowski wrote:

> Back to the original problem: pstate_cnt doesn't work, disabling irqs
> doesn't work... I'm running out of ideas at the moment. Hopefully new i=
deas
> will appear soon... in the meantime, could you send a lspci [no additio=
nal=20
> options needed] again, please?

No problem, see attachement please.

Christian

--=20
---
Christian Heimanns
heimanns@versanet.de

### Pinguine k=C3=B6nnen nicht fliegen
- Pinguine st=C3=BCrzen auch nicht ab! ###

--------------080500070808010608040302
Content-Type: text/plain;
 name="lspci.txt"
Content-Disposition: inline;
 filename="lspci.txt"
Content-Transfer-Encoding: base64

MDA6MDAuMCBIb3N0IGJyaWRnZTogSW50ZWwgQ29ycC4gODI4NjVHL1BFL1AgRFJBTSBDb250
cm9sbGVyL0hvc3QtSHViIEludGVyZmFjZSAocmV2IDAyKQowMDowMS4wIFBDSSBicmlkZ2U6
IEludGVsIENvcnAuIDgyODY1Ry9QRS9QIFBDSSB0byBBR1AgQ29udHJvbGxlciAocmV2IDAy
KQowMDoxZC4wIFVTQiBDb250cm9sbGVyOiBJbnRlbCBDb3JwLiA4MjgwMUVCL0VSIChJQ0g1
L0lDSDVSKSBVU0IgVUhDSSAjMSAocmV2IDAyKQowMDoxZC4xIFVTQiBDb250cm9sbGVyOiBJ
bnRlbCBDb3JwLiA4MjgwMUVCL0VSIChJQ0g1L0lDSDVSKSBVU0IgVUhDSSAjMiAocmV2IDAy
KQowMDoxZC4yIFVTQiBDb250cm9sbGVyOiBJbnRlbCBDb3JwLiA4MjgwMUVCL0VSIChJQ0g1
L0lDSDVSKSBVU0IgVUhDSSAjMyAocmV2IDAyKQowMDoxZC4zIFVTQiBDb250cm9sbGVyOiBJ
bnRlbCBDb3JwLiA4MjgwMUVCL0VSIChJQ0g1L0lDSDVSKSBVU0IgVUhDSSAjNCAocmV2IDAy
KQowMDoxZC43IFVTQiBDb250cm9sbGVyOiBJbnRlbCBDb3JwLiA4MjgwMUVCL0VSIChJQ0g1
L0lDSDVSKSBVU0IyIEVIQ0kgQ29udHJvbGxlciAocmV2IDAyKQowMDoxZS4wIFBDSSBicmlk
Z2U6IEludGVsIENvcnAuIDgyODAxQkEvQ0EvREIvRUIvRVIgSHViIGludGVyZmFjZSB0byBQ
Q0kgQnJpZGdlIChyZXYgYzIpCjAwOjFmLjAgSVNBIGJyaWRnZTogSW50ZWwgQ29ycC4gODI4
MDFFQi9FUiAoSUNINS9JQ0g1UikgTFBDIEJyaWRnZSAocmV2IDAyKQowMDoxZi4xIElERSBp
bnRlcmZhY2U6IEludGVsIENvcnAuIDgyODAxRUIvRVIgKElDSDUvSUNINVIpIFVsdHJhIEFU
QSAxMDAgU3RvcmFnZSBDb250cm9sbGVyIChyZXYgMDIpCjAwOjFmLjMgU01CdXM6IEludGVs
IENvcnAuIDgyODAxRUIvRVIgKElDSDUvSUNINVIpIFNNQnVzIENvbnRyb2xsZXIgKHJldiAw
MikKMDA6MWYuNSBNdWx0aW1lZGlhIGF1ZGlvIGNvbnRyb2xsZXI6IEludGVsIENvcnAuIDgy
ODAxRUIvRVIgKElDSDUvSUNINVIpIEFDJzk3IEF1ZGlvIENvbnRyb2xsZXIgKHJldiAwMikK
MDA6MWYuNiBNb2RlbTogSW50ZWwgQ29ycC4gODI4MDFFQi9FUiAoSUNINS9JQ0g1UikgQUMn
OTcgTW9kZW0gQ29udHJvbGxlciAocmV2IDAyKQowMTowMC4wIFZHQSBjb21wYXRpYmxlIGNv
bnRyb2xsZXI6IG5WaWRpYSBDb3Jwb3JhdGlvbjogVW5rbm93biBkZXZpY2UgMDMyYyAocmV2
IGExKQowMzowNC4wIENhcmRCdXMgYnJpZGdlOiBUZXhhcyBJbnN0cnVtZW50czogVW5rbm93
biBkZXZpY2UgYWM4ZQowMzowNC4xIENhcmRCdXMgYnJpZGdlOiBUZXhhcyBJbnN0cnVtZW50
czogVW5rbm93biBkZXZpY2UgYWM4ZQowMzowNC4yIEZpcmVXaXJlIChJRUVFIDEzOTQpOiBU
ZXhhcyBJbnN0cnVtZW50czogVW5rbm93biBkZXZpY2UgODAyZQowMzowNC4zIFVua25vd24g
bWFzcyBzdG9yYWdlIGNvbnRyb2xsZXI6IFRleGFzIEluc3RydW1lbnRzOiBVbmtub3duIGRl
dmljZSBhYzhmCjAzOjA1LjAgRXRoZXJuZXQgY29udHJvbGxlcjogUmVhbHRlayBTZW1pY29u
ZHVjdG9yIENvLiwgTHRkLiBSVEwtODEzOS84MTM5Qy84MTM5QysgKHJldiAxMCkKMDM6MDYu
MCBOZXR3b3JrIGNvbnRyb2xsZXI6IEhhcnJpcyBTZW1pY29uZHVjdG9yIEQtTGlua3MgRFdM
LWc2NTAgQTEgKHJldiAwMSkK
--------------080500070808010608040302
Content-Type: text/plain;
 name="cpuinfo.txt"
Content-Disposition: inline;
 filename="cpuinfo.txt"
Content-Transfer-Encoding: base64

cHJvY2Vzc29yCTogMAp2ZW5kb3JfaWQJOiBHZW51aW5lSW50ZWwKY3B1IGZhbWlseQk6IDE1
Cm1vZGVsCQk6IDIKbW9kZWwgbmFtZQk6IE1vYmlsZSBJbnRlbChSKSBQZW50aXVtKFIpIDQg
ICAgIENQVSAzLjA2R0h6CnN0ZXBwaW5nCTogOQpjcHUgTUh6CQk6IDMwNTkuMjA4CmNhY2hl
IHNpemUJOiA1MTIgS0IKZmRpdl9idWcJOiBubwpobHRfYnVnCQk6IG5vCmYwMGZfYnVnCTog
bm8KY29tYV9idWcJOiBubwpmcHUJCTogeWVzCmZwdV9leGNlcHRpb24JOiB5ZXMKY3B1aWQg
bGV2ZWwJOiAyCndwCQk6IHllcwpmbGFncwkJOiBmcHUgdm1lIGRlIHBzZSB0c2MgbXNyIHBh
ZSBtY2UgY3g4IGFwaWMgc2VwIG10cnIgcGdlIG1jYSBjbW92IHBhdCBwc2UzNiBjbGZsdXNo
IGR0cyBhY3BpIG1teCBmeHNyIHNzZSBzc2UyIHNzIGh0IHRtIHBiZSBjaWQKYm9nb21pcHMJ
OiA2MDYyLjA4Cgo=
--------------080500070808010608040302
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------080500070808010608040302--

