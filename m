From: "Prashanth Tamraparni" <prasht@gmail.com>
Subject: failed to load cpufreq
Date: Thu, 24 May 2007 16:21:31 +0530
Message-ID: <be6e8fb10705240351q575b59e5u3f44db8e4daaa119@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_87360_13685837.1180003891665"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type;
	b=DbYY0RQPbsr8eX/LKTvYpKbh45uz0lrqbNDFMgbDP8q5YEOtQNxAmVihelyoyOI8gmzD8XPgHKScfshjPyYMK4UgZ7HWDiuCT1/CKxmhHSUj6aVMdtvArmkCpup/c7eHQJjEkbDvqPLIN/USLxSg/kIL0B2DQVzDk8rFxmIJtgo=
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

------=_Part_87360_13685837.1180003891665
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I am pretty new to using cpufreq and wanted to try on one of my test
system based on 2.6.18 kernel.  It failed to load speedstep-centrino:

cpufreq-core: trying to register driver centrino
cpufreq-core: adding CPU 0
speedstep-centrino: speedstep-centrino: obtaining ACPI data failed
speedstep-centrino: found unsupported CPU with Enhanced SpeedStep:
send /proc/cpuinfo to cpufreq@lists.linux.org.uk
cpufreq-core: initialization failed
cpufreq-core: adding CPU 1
speedstep-centrino: speedstep-centrino: obtaining ACPI data failed
cpufreq-core: initialization failed
cpufreq-core: adding CPU 2
speedstep-centrino: speedstep-centrino: obtaining ACPI data failed
cpufreq-core: initialization failed
cpufreq-core: adding CPU 3
speedstep-centrino: speedstep-centrino: obtaining ACPI data failed
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver centrino
cpufreq-core: unregistering CPU 0
cpufreq-core: unregistering CPU 1
cpufreq-core: unregistering CPU 2
cpufreq-core: unregistering CPU 3
ACPI: (supports S0 S4 S5)

I tried with acpi-cpufreq module:
acpi-cpufreq: acpi_cpufreq_init
acpi-cpufreq: acpi_cpufreq_early_init
cpufreq-core: trying to register driver acpi-cpufreq
cpufreq-core: adding CPU 0
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: adding CPU 1
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: adding CPU 2
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: adding CPU 3
acpi-cpufreq: acpi_cpufreq_cpu_init
cpufreq-core: initialization failed
cpufreq-core: no CPU initialized for driver acpi-cpufreq
cpufreq-core: unregistering CPU 0
cpufreq-core: unregistering CPU 1
cpufreq-core: unregistering CPU 2
cpufreq-core: unregistering CPU 3

I have attached the /proc/cpuinfo as mentioned in the message.  Any
help would be useful.

--Prashanth

------=_Part_87360_13685837.1180003891665
Content-Type: application/octet-stream; name=proc_cpuinfo
Content-Transfer-Encoding: base64
X-Attachment-Id: f_f233ov0g
Content-Disposition: attachment; filename="proc_cpuinfo"

cHJvY2Vzc29yCTogMAp2ZW5kb3JfaWQJOiBHZW51aW5lSW50ZWwKY3B1IGZhbWlseQk6IDYKbW9k
ZWwJCTogMTUKbW9kZWwgbmFtZQk6IEludGVsKFIpIFhlb24oUikgQ1BVICAgICAgICAgICAgNTE2
MCAgQCAzLjAwR0h6CnN0ZXBwaW5nCTogNgpjcHUgTUh6CQk6IDMwMDAuMTEyCmNhY2hlIHNpemUJ
OiA0MDk2IEtCCnBoeXNpY2FsIGlkCTogMApzaWJsaW5ncwk6IDIKY29yZSBpZAkJOiAwCmNwdSBj
b3Jlcwk6IDIKZnB1CQk6IHllcwpmcHVfZXhjZXB0aW9uCTogeWVzCmNwdWlkIGxldmVsCTogMTAK
d3AJCTogeWVzCmZsYWdzCQk6IGZwdSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFlIG1jZSBjeDggYXBp
YyBzZXAgbXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1c2ggZHRzIGFjcGkgbW14IGZ4
c3Igc3NlIHNzZTIgc3MgaHQgdG0gc3lzY2FsbCBsbSBjb25zdGFudF90c2MgcG5pIG1vbml0b3Ig
ZHNfY3BsIHZteCBlc3QgdG0yIGN4MTYgeHRwciBsYWhmX2xtCmJvZ29taXBzCTogNjAwNC4zNQpj
bGZsdXNoIHNpemUJOiA2NApjYWNoZV9hbGlnbm1lbnQJOiA2NAphZGRyZXNzIHNpemVzCTogMzYg
Yml0cyBwaHlzaWNhbCwgNDggYml0cyB2aXJ0dWFsCnBvd2VyIG1hbmFnZW1lbnQ6Cgpwcm9jZXNz
b3IJOiAxCnZlbmRvcl9pZAk6IEdlbnVpbmVJbnRlbApjcHUgZmFtaWx5CTogNgptb2RlbAkJOiAx
NQptb2RlbCBuYW1lCTogSW50ZWwoUikgWGVvbihSKSBDUFUgICAgICAgICAgICA1MTYwICBAIDMu
MDBHSHoKc3RlcHBpbmcJOiA2CmNwdSBNSHoJCTogMzAwMC4xMTIKY2FjaGUgc2l6ZQk6IDQwOTYg
S0IKcGh5c2ljYWwgaWQJOiAzCnNpYmxpbmdzCTogMgpjb3JlIGlkCQk6IDAKY3B1IGNvcmVzCTog
MgpmcHUJCTogeWVzCmZwdV9leGNlcHRpb24JOiB5ZXMKY3B1aWQgbGV2ZWwJOiAxMAp3cAkJOiB5
ZXMKZmxhZ3MJCTogZnB1IHZtZSBkZSBwc2UgdHNjIG1zciBwYWUgbWNlIGN4OCBhcGljIHNlcCBt
dHJyIHBnZSBtY2EgY21vdiBwYXQgcHNlMzYgY2xmbHVzaCBkdHMgYWNwaSBtbXggZnhzciBzc2Ug
c3NlMiBzcyBodCB0bSBzeXNjYWxsIGxtIGNvbnN0YW50X3RzYyBwbmkgbW9uaXRvciBkc19jcGwg
dm14IGVzdCB0bTIgY3gxNiB4dHByIGxhaGZfbG0KYm9nb21pcHMJOiA2MDAwLjEwCmNsZmx1c2gg
c2l6ZQk6IDY0CmNhY2hlX2FsaWdubWVudAk6IDY0CmFkZHJlc3Mgc2l6ZXMJOiAzNiBiaXRzIHBo
eXNpY2FsLCA0OCBiaXRzIHZpcnR1YWwKcG93ZXIgbWFuYWdlbWVudDoKCnByb2Nlc3Nvcgk6IDIK
dmVuZG9yX2lkCTogR2VudWluZUludGVsCmNwdSBmYW1pbHkJOiA2Cm1vZGVsCQk6IDE1Cm1vZGVs
IG5hbWUJOiBJbnRlbChSKSBYZW9uKFIpIENQVSAgICAgICAgICAgIDUxNjAgIEAgMy4wMEdIegpz
dGVwcGluZwk6IDYKY3B1IE1IegkJOiAzMDAwLjExMgpjYWNoZSBzaXplCTogNDA5NiBLQgpwaHlz
aWNhbCBpZAk6IDAKc2libGluZ3MJOiAyCmNvcmUgaWQJCTogMQpjcHUgY29yZXMJOiAyCmZwdQkJ
OiB5ZXMKZnB1X2V4Y2VwdGlvbgk6IHllcwpjcHVpZCBsZXZlbAk6IDEwCndwCQk6IHllcwpmbGFn
cwkJOiBmcHUgdm1lIGRlIHBzZSB0c2MgbXNyIHBhZSBtY2UgY3g4IGFwaWMgc2VwIG10cnIgcGdl
IG1jYSBjbW92IHBhdCBwc2UzNiBjbGZsdXNoIGR0cyBhY3BpIG1teCBmeHNyIHNzZSBzc2UyIHNz
IGh0IHRtIHN5c2NhbGwgbG0gY29uc3RhbnRfdHNjIHBuaSBtb25pdG9yIGRzX2NwbCB2bXggZXN0
IHRtMiBjeDE2IHh0cHIgbGFoZl9sbQpib2dvbWlwcwk6IDYwMDAuMTUKY2xmbHVzaCBzaXplCTog
NjQKY2FjaGVfYWxpZ25tZW50CTogNjQKYWRkcmVzcyBzaXplcwk6IDM2IGJpdHMgcGh5c2ljYWws
IDQ4IGJpdHMgdmlydHVhbApwb3dlciBtYW5hZ2VtZW50OgoKcHJvY2Vzc29yCTogMwp2ZW5kb3Jf
aWQJOiBHZW51aW5lSW50ZWwKY3B1IGZhbWlseQk6IDYKbW9kZWwJCTogMTUKbW9kZWwgbmFtZQk6
IEludGVsKFIpIFhlb24oUikgQ1BVICAgICAgICAgICAgNTE2MCAgQCAzLjAwR0h6CnN0ZXBwaW5n
CTogNgpjcHUgTUh6CQk6IDMwMDAuMTEyCmNhY2hlIHNpemUJOiA0MDk2IEtCCnBoeXNpY2FsIGlk
CTogMwpzaWJsaW5ncwk6IDIKY29yZSBpZAkJOiAxCmNwdSBjb3Jlcwk6IDIKZnB1CQk6IHllcwpm
cHVfZXhjZXB0aW9uCTogeWVzCmNwdWlkIGxldmVsCTogMTAKd3AJCTogeWVzCmZsYWdzCQk6IGZw
dSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFlIG1jZSBjeDggYXBpYyBzZXAgbXRyciBwZ2UgbWNhIGNt
b3YgcGF0IHBzZTM2IGNsZmx1c2ggZHRzIGFjcGkgbW14IGZ4c3Igc3NlIHNzZTIgc3MgaHQgdG0g
c3lzY2FsbCBsbSBjb25zdGFudF90c2MgcG5pIG1vbml0b3IgZHNfY3BsIHZteCBlc3QgdG0yIGN4
MTYgeHRwciBsYWhmX2xtCmJvZ29taXBzCTogNjAwMC40NQpjbGZsdXNoIHNpemUJOiA2NApjYWNo
ZV9hbGlnbm1lbnQJOiA2NAphZGRyZXNzIHNpemVzCTogMzYgYml0cyBwaHlzaWNhbCwgNDggYml0
cyB2aXJ0dWFsCnBvd2VyIG1hbmFnZW1lbnQ6Cgo=
------=_Part_87360_13685837.1180003891665
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------=_Part_87360_13685837.1180003891665--

