From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: 2.4 patch and powernow-k8
Date: Thu, 2 Dec 2004 18:00:19 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A843AA1C5E@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: omv <omv@danhartman.org>, cpufreq@www.linux.org.uk

> I've been trying to patch cpufreq into a recent 2.4 kernel and having=20
> some problems.  When I've config'ed powernow-k8 to be static=20
> linked, I get the below errors. =20

> arch/i386/kernel/kernel.o(.data+0x1d80): In function `trampoline_end':
> : undefined reference to `local symbols in discarded section=20
> .text.exit'
> make: *** [vmlinux] Error 1

I can't quite reproduce this error on my AMD64 system, but=20
I can get something awfully close, in that I see the undefined
reference error.  I have no idea what the problem is.  It only
happens when the powernow-k8.c code is compiled, but I can't
see anything in the code that would produce that.

This is occuring on RHEL3 U2 with gcc-3.2.3.  Anyone have
any ideas?

-Mark Langsdorf
AMD, Inc.
