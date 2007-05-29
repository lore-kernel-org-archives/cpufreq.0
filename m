From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Amd Turion TL-52 X2 on Amilo PA 1510> No way to change
 Frequency!
Date: Tue, 29 May 2007 12:51:03 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF02076E14@SAUSEXMB1.amd.com>
References: <1180379564.5763.8.camel@Tux-Devil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <1180379564.5763.8.camel@Tux-Devil>
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
To: muskatnuss@gmx.at, cpufreq@lists.linux.org.uk

> now my kernel got that module cpufreq debubugging within it!
> now i got that output from dmesg | grep power
> :
> [   56.286434] powernow-k8: Found 2 AMD Turion(tm) 64 X2 Mobile
> Technology TL-52 processors (version 2.00.00)
> [   56.286449] powernow-k8:    0 : fid 0x8, vid 0x13
> [   56.286455] powernow-k8:    1 : fid 0x0, vid 0x1e
> [   56.286459] powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x13
> [   56.286462] powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x1e
> [   56.286467] powernow-k8: cpu0, init lo 0x1308, hi 0x1
> [   56.286471] powernow-k8: policy current frequency 1600000 kHz
> [   56.286475] powernow-k8: cpu_init done, current fid 0x8, vid 0x13
> [   56.286520] powernow-k8: targ: cpu 0, 800000 kHz, min 800000, max
> 800000, relation 1
>=20
> so far... looks like i can only get 800 MHz ...

The processor says it supports 1600 MHz, and even starts in
that state.  Then it transitions to 800 MHz and I never see
another request for a higher frequency.

What are the values of the files in the
/sys/devices/system/cpu/cpu0/cpufreq
directory?

-Mark Langsdorf
Operating System Research Center
AMD
