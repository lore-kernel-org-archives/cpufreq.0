From: Carl Thompson <cet@carlthompson.net>
Subject: Re: Problems with cpufreq on Acer Aspire Notebook
Date: Tue,  8 Jul 2003 11:41:51 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1057689711.41821bbda6ed7@carlthompson.net>
References: <20030708172233.4be9c44b.a_koch@moellinger.hx.uni-paderborn.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_e29ec73f984809942693cc"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030708172233.4be9c44b.a_koch@moellinger.hx.uni-paderborn.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: Andreas Koch <a_koch@moellinger.hx.uni-paderborn.de>
Cc: cpufreq@www.linux.org.uk

This message is in MIME format.

--=_e29ec73f984809942693cc
Content-Type: text/plain; charset="ISO-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Attached is a patch for your notebook.  Also note that there is a bug in
recent CPUFreq patches.  If you see the following lines in change_speed()
in powernow-k7.c

	} else {
		/* Going up, so change VID first */
		change_VID(fid);
		change_FID(vid);
	}

change them to

	} else {
		/* Going up, so change VID first */
		change_VID(vid);
		change_FID(fid);
	}

Hope this helps,
Carl Thompson

Quoting Andreas Koch <a_koch@moellinger.hx.uni-paderborn.de>:

> Hi,
>
> I couldn't find something like a search funktion for your mail archiv so
> I have to post my question without knowing if this was done already
> (sorry for this).
>
> I have a Acer Aspire Notebook, running Debian Woody with 2.4.20 Kernel
> and the cpu-freq patch 2.4.20-9. (I know that the same Problem from
> someone else on a 2.4.21 Kernel with the 2.4.21 patch).
>
> The Notebook has a mobile AMD Athlon XP 1800+ Processor with 1.5 GHz (
> 3060.53 Bogomips shown at startup). When the system is up /proc/cpuinfo
> shows only 800 MHz and 1596.79 Bogomips. /proc/cpufreq says min =
> 500000, max = 600000 MHz and demesg shows something like :
>
> powernow:  cpuid: 0x781 fsb: 100        maxFID: 0xe     startvid: 0xb
>  powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xc (1.400V)
>  powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xc (1.400V)
>  powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xc (1.400V)
>  powernow:    FID: 0x4 (5.0x [500MHz])   VID: 0xc (1.400V)
>  powernow:    FID: 0x6 (6.0x [600MHz])   VID: 0xc (1.400V)
>  powernow: Minimum speed 500 MHz. Maximum speed 600 MHz.
>
> My question is now what's wrong ?
>
> I didn't find anything on google so I have to ask here for your help.
>
> Yours,
>
> Andreas
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
>
>


--=_e29ec73f984809942693cc
Content-Type: text/x-diff; name="aspire_patch"; charset="ISO-8859-1"
Content-Disposition: attachment; filename="aspire_patch"
Content-Transfer-Encoding: base64

LS0tIGEvYXJjaC9pMzg2L2tlcm5lbC9wb3dlcm5vdy1rNy5jCTIwMDMtMDYtMzAgMTM6NDA6MTYu
MDAwMDAwMDAwICswMjAwCisrKyBiL2FyY2gvaTM4Ni9rZXJuZWwvcG93ZXJub3ctazcuYwkyMDAz
LTA2LTMwIDEzOjQxOjE5LjAwMDAwMDAwMCArMDIwMApAQCAtMTY3LDYgKzE2NywyOSBAQAogCXVu
c2lnbmVkIGludCBqLCBzcGVlZDsKIAl1OCBmaWQsIHZpZDsKCisvKiBoYXJkY29kZWQgbW9kaWZp
ZXMgZm9yIG1vYmlsZSBBdGhsb24geHAgMTgwMCsgb24gQWNlciBBc3BpcmUgMTMwMCB3aXRoIGJ1
Z2d5IGJpb3MgKi8KKworCXBzdCA9IGttYWxsb2MoMTAqc2l6ZW9mKHVuc2lnbmVkIGNoYXIpLCBH
RlBfS0VSTkVMKTsKKwlpZiAoIXBzdCkKKwkJcmV0dXJuIC1FTk9NRU07CisKKwkqcHN0KysgPSA0
OyAgLyogIDY2NiBNSHogKi8KKwkqcHN0KysgPSAxOTsgLyogICAxLjIwIFYgKi8KKwkqcHN0Kysg
PSA2OyAgLyogIDgwMCBNaHogKi8KKwkqcHN0KysgPSAxOTsgLyogICAxLjIwIFYgKi8KKwkqcHN0
KysgPSAxMDsgLyogMTA2NiBNaHogKi8KKwkqcHN0KysgPSAxOTsgLyogICAxLjIwIFYgKi8KKwkq
cHN0KysgPSAxNDsgLyogMTMzMyBNaHogKi8KKwkqcHN0KysgPSAxMTsgLyogICAxLjQ1IFYgKi8K
KwkqcHN0KysgPSAxOyAgLyogMTUzMyBNaHogKi8KKwkqcHN0ID0gOTsgICAgLyogICAxLjU1IFYg
Ki8KKworCXBzdCAtPSA5OworCisJZnNiPTEzMzsKKworLyoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKiovCisKIAlwb3dlcm5vd190YWJsZSA9IGttYWxsb2Mo
KHNpemVvZihzdHJ1Y3QgY3B1ZnJlcV9mcmVxdWVuY3lfdGFibGUpICogKG51bWJlcl9zY2FsZXMg
KyAxKSksIEdGUF9LRVJORUwpOwogCWlmICghcG93ZXJub3dfdGFibGUpCiAJCXJldHVybiAtRU5P
TUVNOwpAQCAtMTg3LDcgKzIxMCw3IEBACiAjZW5kaWYKIAkJfQogCi0JCWRwcmludGsgKEtFUk5f
SU5GTyBQRlggIiAgIEZJRDogMHgleCAoJWQuJWR4IFslZE1Iel0pXHQiLCBmaWQsCisJCWRwcmlu
dGsgKEtFUk5fSU5GTyBQRlggIiAgIEZJRDogMHgleCAoJWQuJWR4IFslZE1Iel0pICAiLCBmaWQs
CiAJCQlmaWRfY29kZXNbZmlkXSAvIDEwLCBmaWRfY29kZXNbZmlkXSAlIDEwLCBzcGVlZCk7CiAK
IAkJaWYgKHNwZWVkIDwgbWluaW11bV9zcGVlZCkKQEAgLTMyOCw5ICszNTEsMTEgQEAKIAkJCQlp
ZiAoKGV0dXBsZSA9PSBwc3QtPmNwdWlkKSAmJiAobWF4ZmlkPT1wc3QtPm1heGZpZCkgJiYgKHN0
YXJ0dmlkPT1wc3QtPnN0YXJ0dmlkKSkKIAkJCQl7CiAJCQkJCWRwcmludGsgKEtFUk5fSU5GTyBQ
RlggIlBTVDolZCAoQCVwKVxuIiwgaSwgcHN0KTsKLQkJCQkJZHByaW50ayAoS0VSTl9JTkZPIFBG
WCAiIGNwdWlkOiAweCV4XHQiLCBwc3QtPmNwdWlkKTsKLQkJCQkJZHByaW50ayAoImZzYjogJWRc
dCIsIHBzdC0+ZnNic3BlZWQpOwotCQkJCQlkcHJpbnRrICgibWF4RklEOiAweCV4XHQiLCBwc3Qt
Pm1heGZpZCk7CisJCQkJCWRwcmludGsgKEtFUk5fSU5GTyBQRlggIiBjcHVpZDogMHgleCAgIiwg
cHN0LT5jcHVpZCk7CisJCQkJCS8qIG1vZGlmaWVkIGZvciBtb2JpbGUgQXRobG9uIFhQIDE4MDAr
ICovCisJCQkJCWRwcmludGsgKCJmc2I6ICVkICAiLCAxMzMpOworCQkJCQkvKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqLworCQkJCQlkcHJpbnRrICgibWF4RklEOiAweCV4
ICAiLCBwc3QtPm1heGZpZCk7CiAJCQkJCWRwcmludGsgKCJzdGFydHZpZDogMHgleFxuIiwgcHN0
LT5zdGFydHZpZCk7CiAKIAkJCQkJZnNiID0gcHN0LT5mc2JzcGVlZDsK

--=_e29ec73f984809942693cc--
