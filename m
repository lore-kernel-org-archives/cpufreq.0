From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: iBook G3 upon resume...
Date: Mon, 19 Jul 2004 09:50:41 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040719075041.GA9494@dominikbrodowski.de>
References: <1089615548.3485.4.camel@hermione.aeon.com.my>
	<20040716082440.GA9707@dominikbrodowski.de>
	<1090004628.2485.94.camel@gaston>
	<20040716194738.GA9307@dominikbrodowski.de>
	<1090008298.2934.98.camel@gaston>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1090008298.2934.98.camel@gaston>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: cpufreq@www.linux.org.uk, Colin Charles <byte@aeon.com.my>

On Fri, Jul 16, 2004 at 04:04:59PM -0400, Benjamin Herrenschmidt wrote:
> Nah, I didn't feel the need for a notifier... I need to check if the PMU
> actually keeps the speed accross sleep.

Even if it does keep it across "suspend to ram / standby", it won't be
sufficient if ppc supports swsusp and the CPU frequency might be different
if booting with AC adapter connected or not...

	Dominik
