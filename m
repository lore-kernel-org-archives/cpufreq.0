From: Nebojsa Trpkovic <trxman@gmail.com>
Subject: FSB overclock & speedstep
Date: Mon, 02 Jul 2007 05:38:18 +0200
Message-ID: <4688732A.9060900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:x-enigmail-version:content-type:content-transfer-encoding;
	b=tBCUmGR01HdiUV9ETzXyCMbjxqvUM+5sTcxQExlWtB70C4h5HMTrHxNgEg2+LVS8F3JEuBWWmiCXGJKtwe2Za0bn6m3WYGu7tSSKYKOGjrp8KZciVTxz6eSLGIep+W2Bjh8jkFkA7i7z3IUIqAZOc1sxbPzUxQAcebtdyZ3lEkk=
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

what's happening exactly?

I had tested AMD Athlon64 (Winchester core) and found out how PowerNow
controls Vcore.
I've been manualy overriding Frequency/Voltage pairs on it to undervolt
it in both 1.8 and 1.0GHz states.

Is it the same with Intel SpeedStep?


If it's the same, this scenario would be right:

CPU boots with Vcore that is set in the BIOS.
SpeedStep reads Frequency(Multiplier)/Vcore table from BIOS and uses it.

E6300 @ default:
7 x 266MHz (1.86GHz) ~1.35V on the full load
6 x 266MHz (1.60GHz) ~1.15V in the idle state

so, if I raise FSB to 400MHz I get:
7 x 400MHz (2.80GHz) ~1.35V on the full load
6 x 400MHz (2.40GHz) ~1.15V in the idle state

So, my CPU has to be stable in both situations: 2.8GHz @1.35V and 2.4GHz
@1.15V
Guess it's the main "stability" problem if SpeedStep is on while
overclocking. Guess it's more difficult to get it run stable @1.15V with
mulitplier 6 than @1.35V with multiplier 7.

Another thing:
If I raise Vcore to ~1.45V in the BIOS, and set some high CPU freq that
can not be achieved with ~1.35V, when SpeedStep kicks in it will read
Multiplier/Vcore table from BIOS and NOT Vcore I've set manualy. So, it
will use 1.15 and 1.35V for multiplliers 6 and 7 and bring instability
on that high frequencies.


So, anyone with Intel Core 2 Duo, is the process the same ?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGiHMqqDH2e5UXzrQRAq1TAJ4xAsFbynDDNYfQP7nXsG6fq8cTxgCfRFBX
f9eem+XAKPUsWNIncEomxpY=
=YOe9
-----END PGP SIGNATURE-----
