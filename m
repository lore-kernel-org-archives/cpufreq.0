From: David Moore <dcm@acm.org>
Subject: Re: [ACPI] _PDC method in DSDT
Date: 23 Jun 2003 19:02:29 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056420149.10322.160.camel@aldebaran.caltech.edu>
References: <F760B14C9561B941B89469F59BA3A84725A303@orsmsx401.jf.intel.com>
	 <20030623133834.GA2330@brodo.de> <20030623161136.GG19556@poupinou.org>
	 <1056388336.15250.62.camel@ixodes.goop.org>
	 <1056398545.10322.111.camel@aldebaran.caltech.edu>
	 <20030623213726.GA1317@brodo.de>
	 <1056417280.10323.148.camel@aldebaran.caltech.edu>
	 <1056418635.5977.20.camel@sherkaner.pao.digeo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <1056418635.5977.20.camel@sherkaner.pao.digeo.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: Dominik Brodowski <linux@brodo.de>, Ducrot Bruno <ducrot@poupinou.org>, Andrew Grover <andrew.grover@intel.com>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq list <cpufreq@www.linux.org.uk>

On Mon, 2003-06-23 at 18:37, Jeremy Fitzhardinge wrote:
> Hardly any of the code in speedstep-centrino has to do with actually
> setting the speed; nor is much of it to do with identifying the CPU and
> selecting the right table.  Most of it is to do with being a
> well-behaved cpufreq driver.  You would need to move more code than just
> the "wrmsr" into acpi.c.
> 

My understanding was that i386/kernel/cpu/cpufreq/acpi.c in 2.5.x was
already a well-behaved cpufreq driver.  Am I wrong about that?

> The driver as it stands still has to exist for the case where you're not
> using ACPI, but if ACPI is available, using its table is certainly a
> useful thing to have.  If the ACPI code for getting that table
> information is so complicated, then how about a nice simple entrypoint
> which provides the appropiate frequency points with the corresponding
> PERF_CTL values?

> The core of the tension is whether to put ACPI code under
> arch/i386/kernel/cpu/cpufreq or put cpufreq code into drivers/acpi. 
> There doesn't seem to be much to choose between the two, but if ACPI is
> a mechanism which is supposed to supply services to other drivers, it
> doesn't make much sense to migrate all those drivers into drivers/acpi.
> 

Right, that's why the ACPI performance control code got moved out of
drivers/acpi and into arch/i386/kernel/cpu/cpufreq in the 2.5 series. 
The problem is that, if I understand it correctly, the current code for
ACPI performance control in 2.5 does not really work as a library for
other drivers -- it's basically just a standalone cpufreq driver.  It
would be much easier to add a few lines for Enhanced Speedstep than to
restructure the code to work well as a library.

-David
