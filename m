From: =?iso-8859-2?q?Micha=B3_Pytasz?= <pytasz@lodz.home.pl>
Subject: Turion64 x2 TL-68 (HP Pavilion tx2010eo) low freq. hang
Date: Mon, 14 Apr 2008 16:35:10 +0200
Message-ID: <200804141635.10308.pytasz@lodz.home.pl>
References: <200712141300.23975.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200712141300.23975.mark.langsdorf@amd.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Hi,

The problem occurs when CPU is running on low freq. (800 MHz). The hangs oc=
cur =

(not neccesarily immediately) with Machine Check Exception, however the =

message is not always displayed (or I am too slow to see it), there were tw=
o =

messages I did not manage to write down (fully) both of them, one of them w=
as  =

CPU. 0: Machine Check Exception: 0....4 Bank 4: b20...70f0f =

In place of dots were zeroes I did not manage to count before reboot. =

Sometimes it does not reboot but just hangs hard with no message but blinki=
ng =

capslock (kernel panic).

System attempted to instal is linux Gentoo, kernel 2.6.23, it does not matt=
er =

whether the frequency is switched after startup or low from the beginning =

(switched by bios on startup with battery power.  Chipset is Nvidia MCP51.

Also, the system does exactlu the same booted from x86 as well as amd64 liv=
ecd =

gentoo, SystemRescueCD (0.4.3 and 1.0.0) - mostly during some compiling or =

un-tarring, but sometimes it just does that "out of the box", during boot o=
r =

right after that).

On 2.4GHz, system is running without any problems (govenor - performance or =

userspace). It doess not seem to be a memory problem - I have tested it on =
2 =

sets of modules - (original ones 2x1GB 667MHz CL5 as well as elpida 2x2GB =

800MHz CL5). Moreover, frequency scaling (or keeping low frequency, =

unexpectedly) does not affect system stability in bundled vista - which als=
o =

suggests no memory problem. memtest86 also passes.

Best regards,
Micha=B3 Pytasz
