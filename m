From: David Moore <dcm@acm.org>
Subject: Re: [ACPI] _PDC method in DSDT
Date: 23 Jun 2003 13:02:25 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056398545.10322.111.camel@aldebaran.caltech.edu>
References: <F760B14C9561B941B89469F59BA3A84725A303@orsmsx401.jf.intel.com>
	 <20030623133834.GA2330@brodo.de>  <20030623161136.GG19556@poupinou.org>
	 <1056388336.15250.62.camel@ixodes.goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <1056388336.15250.62.camel@ixodes.goop.org>
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
Cc: Ducrot Bruno <ducrot@poupinou.org>, Dominik Brodowski <linux@brodo.de>, Andrew Grover <andrew.grover@intel.com>, "Adachi, Kenichi" <adachi@rd.scei.sony.co.jp>, acpi-devel@lists.sourceforge.net, cpufreq list <cpufreq@www.linux.org.uk>

On Mon, 2003-06-23 at 10:12, Jeremy Fitzhardinge wrote:
> On Mon, 2003-06-23 at 09:11, Ducrot Bruno wrote:
> > Yes.  It can be added.  But do we want to add it?  That's the real
> > question.
> 
> Well, the current scheme only works because there's a small number of
> easily identifiable Enhanced SpeedStep-capable processors which happen
> to use the same encoding for the PERF_CTL register.  It could get more
> complicated in future, and falling back to a table from ACPI may well be
> the appropriate solution for many people - though I would like to
> maintain the tables in speedstep-centrino so that it isn't dependent on
> ACPI.

Thanks for all the responses on this issue.  Forgive my ignorance in
many cases, I've been involved in this code much less time than most
people here.

What about this approach as a possible solution to everything that's
been discussed:

Patch ACPI as follows: In the case where _PCT returns FFH as the
register type in processor.c, we would simply call a processor-specific
function in /arch/i386/ instead of using outb() for the state changes. 
The function would be called with arguments that provide all the
information that ACPI gives us such as the control register, control
value, status value, etc.

This code in /arch/i386/ would be fairly trivial for Enhanced Speedstep:
just a call to wrmsr().  For AMD and Transmeta processors, it would be a
little more complicated since ACPI does not provide all the necessary
information to do the state changes.  Furthermore, the
processor-specific code would not need to be part of the normal ACPI
distribution if necessary -- it has minimal dependencies and could just
reside normally in the kernel.

For those who want to use cpufreq and ACPI simultaneously, they could
use the cpufreq-ACPI driver, which would now be capable of using the
appropriate processor-specific functions for state changes with little
ACPI overhead.

The only big drawback of this approach is the duplication of code
between the existing cpufreq drivers and these new processor-specific
state changing drivers.  Perhaps they could be folded into one by some
changes to the cpufreq API?

Does this seem like a sensible approach?

Regards,

David
