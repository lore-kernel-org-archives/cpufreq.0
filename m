From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [PATCH 1/4] speedstep-centrino: move to per-CPU analyzing of
	CPUs
Date: Fri, 20 Feb 2004 15:37:57 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1077320156.4205.1.camel@localhost.localdomain>
References: <20040220084424.GA10473@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040220084424.GA10473@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq list <cpufreq@www.linux.org.uk>

On Fri, 2004-02-20 at 00:44, Dominik Brodowski wrote:
> Move the table matching into an own function; only the FEATURE_EST bit is checked
> in module_init() directly. As cpufreq drivers aren't sticky any longer (see other 
> pending patch sent to cpufreq mailing list a few minutes ago), this will not 
> change user-visible behaviour.


These all look reasonable to me.  I tried testing the ACPI table change,
but it isn't obvious about where it gets its frequency table from - it
might be nice to add a hint to the banner.

	J
