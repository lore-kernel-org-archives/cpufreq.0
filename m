From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: powernow-k8 problem (Mobile Sempron 2800+, Acer Aspire 1362
 )
Date: Mon, 15 Nov 2004 20:56:29 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84301539D47@SAUSEXMB1.amd.com>
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
To: =?iso-8859-2?Q?Micha=B3_Pytasz?= <mpytasz@pai.net.pl>, cpufreq@www.linux.org.uk, "Langsdorf, Mark" <mark.langsdorf@amd.com>

=20
> powernow-k8:    0 : fid 0x8 (1600 MHz), vid 0x6 (1400 mV)
> powernow-k8:    1 : fid 0x0 (800 MHz), vid 0x18 (950 mV)

> powernow-k8: cpu 0, changing to fid 0x8, vid 0x6
> powernow-k8: ph1 (cpu0): start, currfid 0x8, currvid 0x4, reqvid 0x6, =
rvo 0x2
> powernow-k8: ph1: changing vid for rvo, req 0x3
> powernow-k8: writing vid 0x3, lo 0x10308, hi 0x1
> powernow-k8: vid trans failed, vid 0x3, curr 0x4

Thanks for the additional debug data, that was very helpful. It appears =
to
me that the data provided by your BIOS is actually correct. (I am making =
the
big assumption that you have a processor that can do 800 MHz/1600 MHz =
and
that the data is not just totally crazy! My first guess when I looked at
your initial post was that the rvo value provided by BIOS might be =
wrong,
but it is not.

There is a bug in the driver exposed here. The bug is exposed by the =
fact
that the initial frequency/voltage (8/4) are not valid in the frequency
table, and the first requested transition is to make them valid (8/6). =
I.e.,
your initial voltage is 2 steps too high (4 instead of 6). The driver is
applying the rvo in 2 steps here, and should be going to a target of =
(6-2).
So, no voltage change is needed. What it is actually doing is attempting =
to=20
go to 3 and then 2 (4-2).

I will fix this in the driver and send you a patch, hopefully tomorrow
morning, and we can see what the new behavior is.

Paul.
