From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Overclocked Dothan
Date: Sun, 10 Jul 2005 20:45:38 +0200
Message-ID: <20050710184538.GF8758@dominikbrodowski.de>
References: <772ea30305070822016720a6a6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <772ea30305070822016720a6a6@mail.gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Belanger <davidbelanger@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Sat, Jul 09, 2005 at 01:01:10AM -0400, David Belanger wrote:
> My laptop has a Pentium M 1.6Ghz 400FSB (Dothan B0?) but I am running
> it with 533FSB. But now I'm all confused... what are the differences
> when I do that? I mean, the built-in VIDs are going to be wrong?

Good question. As you're running your notebook outside its specification,
doing such things as CPU frequency and voltage scaling might cause
"interesting" results. Freezes, possibly even hardware damage, to name a
few.... but well. As far as I can tell from the way the speedstep-centrino
driver works, it modifies the _multiplier_ and the voltage settings. So if
my assumption is correct, you will only be able to go down to 800MHz instead
of 600 MHz.

	Dominik
