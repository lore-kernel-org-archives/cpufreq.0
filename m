From: Dave Jones <davej@redhat.com>
Subject: Re: two test/debug/dump cpufreq modules
Date: Wed, 14 Apr 2004 12:18:06 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414111806.GF24970@redhat.com>
References: <20040406213436.GA11147@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040406213436.GA11147@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Tue, Apr 06, 2004 at 11:34:36PM +0200, Dominik Brodowski wrote:
 > I've just uploaded cleaned-up versions of two test modules for cpufreq which
 > might be of interest for at least some of you. They're under the GPL, of
 > course, as the MODULE_LICENSE states...
 > 
 > cpufreq-acpi_pdump
 > 
 > Dump the ACPI P-States to be found in the _PSS section of the ACPI table, as
 > well as the contents of the _PCT registers. _PDC capability bits can be
 > passed as module parameter "pdc="
 > 
 > location: http://www.brodo.de/patches/2004-04-06/cpufreq-acpi_pdump.c
 > 
 > 
 > cpufreq-tsc_test
 > 
 > Verify that the TSC-based timing code continues to function as expected
 > after cpufreq transitions by dumping the difference between TSC reads and
 > PMTMR reads [ACPI Powermanagement-Aware Timer]. Needs ACPI to work properly.
 > 
 > location: http://www.brodo.de/patches/2004-04-06/cpufreq-tsc_test.c

Very nice. The first one looks especially useful.
I'm tempted to actually merge these to keep all the modules in one place.

Opinions ?

		Dave
