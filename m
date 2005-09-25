From: <lutris@gmail.com>
Subject: Clock runs twice as fast when CPU speed is halved on AMD Turion 64
	mobile (Compaq Presario V2311US)
Date: Sat, 24 Sep 2005 23:26:06 -0400
Message-ID: <8d7939e2050924202679c61e8b@mail.gmail.com>
Reply-To: lutris@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

I've an AMD Turion-based laptop, a Compaq Presario V2311US.  It can be
set to two speeds, 800Mhz or 1600Mhz.  When set to 800Mhz, Linux
thinks that time is passing twice as fast as normal - if I let the
laptop sit for an hour, it claims that two have passed.

Are there any known workarounds or fixes for this?

If not, are there any suggestions for dirty hacks?

Hard-coding the kernel to run the clock half as fast would be
sufficient; I never need to set the bus speed to full when in Linux.


Incidentally, I briefly thought that I was getting -fantastic- battery
life, although I was confused about how fast it became midnight.  :]=20
Oh, well.
