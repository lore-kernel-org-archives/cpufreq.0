From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: my dothan didn't work with cpufreq...
Date: Thu, 22 Jul 2004 08:04:37 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040722060437.GA8888@dominikbrodowski.de>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
	<1090461320.13505.3.camel@localhost>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1090461320.13505.3.camel@localhost>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@www.linux.org.uk

On Wed, Jul 21, 2004 at 06:55:20PM -0700, Jeremy Fitzhardinge wrote:
> I've been meaning to look into this to see if there's some way to add a
> table method.  It's moderately tricky because there's two steppings of
> Dothan, and the specs are not obvious to me (they seem to list 4
> voltages per frequency point, which is confusing).

AFAICS in some specs, there are identical-looking (CPUID, string) Dothans
with different voltage requirements, at least for the B1 stepping. Also, as
the usage of the ACPI P-State library in speedstep-centrino seems to work 
flawlessly on Dothans [at least I haven't heard otherwise], I'm tempted to 
remove the "(EXPERIMENTAL)" mark on it and possibly make it even the default. 
What do you think?

> I guess it would also be good to get dumps from the ACPI tables.  What's
> the best way to do that?

acpi_pdump with pdc=1 as parameter. This test module can be grabbed here:

http://www.brodo.de/patches/2004-04-06/cpufreq-acpi_pdump.c

	Dominik
