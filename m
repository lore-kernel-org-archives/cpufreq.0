From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] powernow-k7: example use for powernow_acpi_init()
Date: Mon, 22 Mar 2004 14:27:40 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322142740.GG29733@redhat.com>
References: <20040322092543.GN28592@poupinou.org>
	<20040322093851.GO28592@poupinou.org>
	<20040322095135.GD29733@redhat.com>
	<20040322123614.GP28592@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040322123614.GP28592@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Mon, Mar 22, 2004 at 01:36:14PM +0100, Bruno Ducrot wrote:

 > Indeed.  And making ACPI perflib in case of known broken BIOS via
 > DMI may be good (the ASUS should work with that patch, if I read
 > correctly the DSDT).  There may be though one little annoying thing for
 > the ASUS bug: FSB will be reported at 100MHz whereas it is at
 > 133MHz, but it's only cosmetic, I hope.

Hmm, won't that skew the calculated frequencies somewhat ?

 > The real trouble is that I don't know how to retrieve FSB on a
 > athlon/duron: MSR_IA32_EBL_CR_POWERON do not give it :(

*nod*. I even looked through the powernow docs hoping that the fsb
would be stored in one of those registers, but no.

One thing that I did just find though that is interesting.
In the powernow documents, they describe the current/maximum/startup FID
and say "multiply by 100 to determine the frequency" which is very odd
if there really are 133 bus parts out there.

It does state in another part of the document that the FSB is either 100
or 133 MHz, but in bold.. "For mobile applications the FSB is 100 MHz"

Very odd.

		Dave
