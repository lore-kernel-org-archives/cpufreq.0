From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Is it possible to modify "Frequency Table Helpers" to let
	Overclock?
Date: Thu, 20 Jan 2005 10:12:31 +0100
Message-ID: <20050120091231.GA8007@dominikbrodowski.de>
References: <200501200234.51382.javi@gsmlandia.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@zenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200501200234.51382.javi@gsmlandia.com>
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
To: Javi <javi@gsmlandia.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, Jan 20, 2005 at 02:34:51AM +0000, Javi wrote:
> First of all, hi everybody, it's my first mail to the list :)
> 
> I use to have my CPU overclocked and I would like to use dynamic CPU frequency scaling.
> I have an AMD64 3400+ (754) which default's  frequency  is 2400Mhz, but I always run it at 2800Mhz.
> 
> The problem is that I can't use dynamic CPU frequency scaling because the max abiable speed I can set is 2400Mhz, so I can't overclock :(

The values reported by cpufreq are the values the CPU is supposed to run
at, that is the hardcoded FSB speed mutliplied by the "multiplier factor".
If you modify the FSB (and not the multiplier), this isn't detectable by
cpufreq. However, if you modify the multiplier, you'd need to override the
PSB or ACPI tables, and the frequency table helpers are the wrong place to
look for that.

	Dominik
