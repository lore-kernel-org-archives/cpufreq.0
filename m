From: Frederik Reiss <frederikreiss@gmx.de>
Subject: Re: bad ACPI tables for Dothan?
Date: Wed, 28 Jul 2004 15:25:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4107A955.5060101@gmx.de>
References: <410557B4.6060303@gmx.de> <1090872497.8114.3.camel@localhost>	
	<41061454.90306@gmx.de> <1090965071.16558.2.camel@localhost>	
	<4106E08D.3000909@gmx.de> <1090970168.16558.7.camel@localhost>	
	<4106EB87.4010603@gmx.de> <1090973581.16558.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <1090973581.16558.13.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@www.linux.org.uk

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jeremy Fitzhardinge schrieb:

| In theory the ACPI tables should work fine for this Dothan, but they
| seem corrupt.  It seems that centrino_cpu_init_acpi() is getting a
| 0xffff control register value, and a corresponding 25GHz CPU core speed.
| I'm assuming there's someone who knows what this means.
|
| 	J


Hi,

I found the Problem:

The ACPI table has 16 entrys, but only the first 5 entrys are valid
values the rest of them seems to have 0xffff as value.

If i add the line "p.state_count=5;" before line 345 in the
speedstep-centrino.c which you send me it works perfect for me.

Hope this helps :)

- --
He was always at a loss when people acted like this. When machines went
funny you just oiled them or prodded them or, if nothing else worked, hit
them with a hammer. Nomes didn't respond well to this treatment.
(Diggers)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFBB6lVcLHece3p3gARAqP0AJ99o/K+71vW8RyLIuzWjeBznxcWUwCgwKN4
pHfeF4VhO7npc8OJlBSbHKw=
=rlBJ
-----END PGP SIGNATURE-----
