From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [RFC] cpufreq: use new acpi processor perflib in
	speedstep-centrino [Was: Re: [ACPI] _PDC method in DSDT]
Date: Fri, 05 Sep 2003 09:53:32 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1062780812.23453.40.camel@localhost.localdomain>
References: <20030623133834.GA2330@brodo.de>
	<20030623161136.GG19556@poupinou.org>
	<1056388336.15250.62.camel@ixodes.goop.org>
	<1056398545.10322.111.camel@aldebaran.caltech.edu>
	<20030623213726.GA1317@brodo.de>
	<1056417280.10323.148.camel@aldebaran.caltech.edu>
	<1056418635.5977.20.camel@sherkaner.pao.digeo.com>
	<1056420149.10322.160.camel@aldebaran.caltech.edu>
	<20030624091836.GI19556@poupinou.org>
	<1056491271.3979.15.camel@aldebaran.caltech.edu>
	<20030904231932.GA8518@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030904231932.GA8518@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>
Cc: acpi-devel@lists.sourceforge.net, Ducrot Bruno <ducrot@poupinou.org>, Andrew Grover <andrew.grover@intel.com>, cpufreq list <cpufreq@www.linux.org.uk>, David Moore <dcm@acm.org>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>

On Thu, 2003-09-04 at 16:19, Dominik Brodowski wrote:
> This patch modifies the speedstep-centrino driver to use the ACPI 
> processor perflib if no hardcoded value could be found. Centrino-specific
> stuff is taken from a patch to arch/i386/kernel/cpu/cpufreq/acpi.c by 
> David Moore [in this thread].

Sorry, I haven't really been following this thread.  What's the complete
minimal set of other patches I need to make this one work?  Are they
against 2.5.0-test4?

Thanks,
	J
